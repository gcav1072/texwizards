# ==============================================================================
# compile_all.ps1 — Recompilador de documentos LaTeX para Mathwizards STEM (Windows)
# ==============================================================================
# Uso:
#   .\compile_all.ps1                  # Recompila todos los .tex en tex_files\
#   .\compile_all.ps1 curso_3eraño     # Recompila solo los que coincidan con la ruta
#   .\compile_all.ps1 -f               # Fuerza recompilación (-g en latexmk)
#   .\compile_all.ps1 -c               # Limpia auxiliares luego de compilar
#   .\compile_all.ps1 -j 4             # Compila usando 4 hilos en paralelo
#   .\compile_all.cmd -f -j 4          # Equivalente desde CMD o sin ExecutionPolicy
#
# Cada guía con respuestas (\ifmwclaves) se compila DOS veces desde el MISMO
# fuente: la versión normal y la variante _scr (sin respuestas), usando
# -usepretex=\AtBeginDocument{\mwclavesoff} + -jobname=<stem>_scr.
# Los archivos sin \ifmwclaves (exámenes, etc.) se compilan una sola vez.
# ==============================================================================

$ErrorActionPreference = 'Stop'

# Asegurar salida UTF-8 limpia para rutas con acentos y ñ
$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
[Console]::OutputEncoding = $utf8NoBom
$OutputEncoding = $utf8NoBom

function Show-Help {
    Write-Host "Uso: " -NoNewline -ForegroundColor White
    Write-Host ".\compile_all.ps1 [opciones] [filtro_de_ruta]"
    Write-Host "     .\compile_all.cmd [opciones] [filtro_de_ruta]"
    Write-Host ""
    Write-Host "Opciones:"
    Write-Host "  -f, --force, -Force       Fuerza la recompilación completa (latexmk -g)"
    Write-Host "  -c, --clean, -Clean       Limpia archivos auxiliares (.aux, .log, .xdv, etc.) tras compilar"
    Write-Host "  -j, --jobs,  -Jobs N      Número de compilaciones en paralelo (por defecto: 1)"
    Write-Host "  -h, --help,  -Help        Muestra esta ayuda"
    Write-Host ""
    Write-Host "Cada guía con respuestas (\ifmwclaves) se compila DOS veces desde el"
    Write-Host "mismo fuente: la versión normal y la variante _scr (sin respuestas)."
    Write-Host ""
    Write-Host "Ejemplos:"
    Write-Host "  .\compile_all.ps1                      # Todo tex_files\ (normal + _scr)"
    Write-Host "  .\compile_all.ps1 lead_magnets         # Solo la carpeta lead_magnets"
    Write-Host "  .\compile_all.ps1 conversiones.tex     # Solo conversiones.tex"
    Write-Host "  .\compile_all.ps1 guia1                # guia1...tex y su versión _scr"
    Write-Host "  .\compile_all.ps1 -f -j 4              # Todo, forzado y con 4 hilos"
}

# Parseo manual de argumentos para aceptar estilo Unix (-f, --force, -j 4) y PowerShell (-Force, -Jobs 4)
$Force = $false
$CleanAux = $false
$Jobs = 1
$Filters = New-Object System.Collections.Generic.List[string]

$i = 0
while ($i -lt $args.Count) {
    $arg = [string]$args[$i]
    switch -Regex ($arg) {
        '^(-f|--force|-Force)$' {
            $Force = $true
            $i++
            break
        }
        '^(-c|--clean|-Clean)$' {
            $CleanAux = $true
            $i++
            break
        }
        '^(-h|--help|-Help|-\?)$' {
            Show-Help
            exit 0
        }
        '^(-j|--jobs|-Jobs)$' {
            if ($i + 1 -ge $args.Count) {
                Write-Host "Error: La opción $arg requiere un número entero positivo." -ForegroundColor Red
                exit 1
            }
            $val = 0
            if (-not [int]::TryParse([string]$args[$i + 1], [ref]$val) -or $val -lt 1) {
                Write-Host "Error: Valor inválido para $($arg): '$($args[$i + 1])'." -ForegroundColor Red
                exit 1
            }
            $Jobs = $val
            $i += 2
            break
        }
        '^(-j|--jobs|-Jobs)=(.+)$' {
            $raw = $Matches[2]
            $val = 0
            if (-not [int]::TryParse($raw, [ref]$val) -or $val -lt 1) {
                Write-Host "Error: Valor inválido para --jobs: '$raw'." -ForegroundColor Red
                exit 1
            }
            $Jobs = $val
            $i++
            break
        }
        '^-' {
            Write-Host "Opción desconocida: $arg" -ForegroundColor Red
            Write-Host ""
            Show-Help
            exit 1
        }
        default {
            $Filters.Add($arg)
            $i++
            break
        }
    }
}

$RepoRoot = $PSScriptRoot
$TexDir = Join-Path $RepoRoot 'tex_files'
$StylesDir = Join-Path $RepoRoot 'styles'
$LatexmkRc = Join-Path $RepoRoot '.latexmkrc'

if (-not (Get-Command latexmk -ErrorAction SilentlyContinue)) {
    Write-Host "Error: No se encontró 'latexmk' en el PATH. Verifica tu instalación de TeX Live." -ForegroundColor Red
    exit 1
}

if (-not (Test-Path -LiteralPath $TexDir -PathType Container)) {
    Write-Host "Error: No se encontró el directorio $TexDir" -ForegroundColor Red
    exit 1
}

if (-not (Test-Path -LiteralPath $LatexmkRc -PathType Leaf)) {
    Write-Host "Error: No se encontró $LatexmkRc" -ForegroundColor Red
    exit 1
}

# Inicializar .mws_tmp/fonts.conf antes de lanzar hilos en paralelo para evitar contención
if (Get-Command kpsewhich -ErrorAction SilentlyContinue) {
    $extraDirs = New-Object System.Collections.Generic.List[string]
    $assetsFonts = Join-Path $RepoRoot 'assets\fonts'
    if (Test-Path -LiteralPath $assetsFonts -PathType Container) {
        $extraDirs.Add(($assetsFonts -replace '\\', '/'))
    }
    if ($env:LOCALAPPDATA) {
        $userFonts = Join-Path $env:LOCALAPPDATA 'Microsoft\Windows\Fonts'
        if (Test-Path -LiteralPath $userFonts -PathType Container) {
            $extraDirs.Add(($userFonts -replace '\\', '/'))
        }
    }

    if ($extraDirs.Count -gt 0 -and -not $env:FONTCONFIG_FILE) {
        $baseFc = $null
        foreach ($varName in @('TEXMFSYSVAR', 'TEXMFVAR')) {
            $varVal = (& kpsewhich "--var-value=$varName" 2>$null | Select-Object -First 1)
            if ($varVal) {
                $candidate = Join-Path $varVal.Trim() 'fonts\conf\fonts.conf'
                if (Test-Path -LiteralPath $candidate -PathType Leaf) {
                    $baseFc = ($candidate -replace '\\', '/')
                    break
                }
            }
        }
        if ($baseFc) {
            $escXml = { param($s) $s.Replace('&', '&amp;').Replace('<', '&lt;').Replace('>', '&gt;') }
            $sb = New-Object System.Text.StringBuilder
            [void]$sb.AppendLine('<?xml version="1.0" encoding="UTF-8"?>')
            [void]$sb.AppendLine('<!DOCTYPE fontconfig SYSTEM "fonts.dtd">')
            [void]$sb.AppendLine('<fontconfig>')
            [void]$sb.AppendLine("  <include ignore_missing=`"no`">$(& $escXml $baseFc)</include>")
            foreach ($d in $extraDirs) {
                [void]$sb.AppendLine("  <dir>$(& $escXml $d)</dir>")
            }
            [void]$sb.AppendLine('</fontconfig>')
            $xmlText = $sb.ToString() -replace "`r`n", "`n"

            $tmpDir = Join-Path $RepoRoot '.mws_tmp'
            if (-not (Test-Path -LiteralPath $tmpDir -PathType Container)) {
                [void](New-Item -ItemType Directory -Path $tmpDir -Force)
            }
            $customFc = (Join-Path $tmpDir 'fonts.conf') -replace '\\', '/'
            $existingFc = if (Test-Path -LiteralPath $customFc -PathType Leaf) {
                [System.IO.File]::ReadAllText($customFc, $utf8NoBom) -replace "`r`n", "`n"
            } else { '' }
            if ($existingFc -ne $xmlText) {
                [System.IO.File]::WriteAllText($customFc, $xmlText, $utf8NoBom)
            }
            $env:FONTCONFIG_FILE = $customFc
        }
    }
}

Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "   Mathwizards STEM — Compilador de Documentos TeX    " -ForegroundColor Cyan
Write-Host "======================================================" -ForegroundColor Cyan
Write-Host "Directorio raíz: " -NoNewline -ForegroundColor White; Write-Host $RepoRoot
Write-Host "Estilos:         " -NoNewline -ForegroundColor White; Write-Host $StylesDir
if ($Filters.Count -gt 0) {
    Write-Host "Filtro aplicado: " -NoNewline -ForegroundColor White; Write-Host ($Filters -join ', ')
}
Write-Host "Paralelismo:     " -NoNewline -ForegroundColor White; Write-Host "$Jobs proceso(s)"
Write-Host "------------------------------------------------------" -ForegroundColor Cyan

# Buscar todos los .tex recursivamente (orden determinista)
$allFiles = Get-ChildItem -LiteralPath $TexDir -Recurse -File -Filter '*.tex' | Sort-Object FullName

$filesToCompile = New-Object System.Collections.Generic.List[System.IO.FileInfo]
$repoPrefixLen = $RepoRoot.TrimEnd('\', '/').Length + 1
foreach ($file in $allFiles) {
    $relNorm = $file.FullName.Substring($repoPrefixLen) -replace '\\', '/'
    if ($Filters.Count -eq 0) {
        $filesToCompile.Add($file)
    } else {
        $matched = $false
        foreach ($flt in $Filters) {
            $fltNorm = $flt -replace '\\', '/'
            if ($relNorm.IndexOf($fltNorm, [System.StringComparison]::OrdinalIgnoreCase) -ge 0) {
                $matched = $true
                break
            }
        }
        if ($matched) {
            $filesToCompile.Add($file)
        }
    }
}

$total = $filesToCompile.Count
if ($total -eq 0) {
    Write-Host "No se encontraron archivos .tex que coincidan con el filtro." -ForegroundColor Yellow
    exit 0
}

Write-Host "Archivos a procesar: $total`n" -ForegroundColor White

# Scriptblock autocontenido para compilar un archivo (usado tanto secuencial como en RunspacePool)
$compileWorker = {
    param(
        [string]$TexPath,
        [string]$RelPath,
        [string]$LatexmkRc,
        [bool]$Force,
        [bool]$CleanAux
    )

    function Format-Win32Arg {
        param([string]$Value)
        if ($Value.Length -eq 0) { return '""' }
        if ($Value -notmatch '[\s"]') { return $Value }
        $sb = New-Object System.Text.StringBuilder
        [void]$sb.Append('"')
        $bsCount = 0
        foreach ($ch in $Value.ToCharArray()) {
            if ($ch -eq '\') {
                $bsCount++
            } elseif ($ch -eq '"') {
                [void]$sb.Append(('\' * ($bsCount * 2)) + '\"')
                $bsCount = 0
            } else {
                if ($bsCount -gt 0) {
                    [void]$sb.Append('\' * $bsCount)
                    $bsCount = 0
                }
                [void]$sb.Append($ch)
            }
        }
        if ($bsCount -gt 0) {
            [void]$sb.Append('\' * ($bsCount * 2))
        }
        [void]$sb.Append('"')
        return $sb.ToString()
    }

    function Invoke-Latexmk {
        param(
            [string[]]$ArgList,
            [string]$WorkingDir
        )
        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = 'latexmk'
        $psi.Arguments = (($ArgList | ForEach-Object { Format-Win32Arg $_ }) -join ' ')
        $psi.WorkingDirectory = $WorkingDir
        $psi.UseShellExecute = $false
        $psi.RedirectStandardOutput = $true
        $psi.RedirectStandardError = $true
        $psi.CreateNoWindow = $true

        $proc = [System.Diagnostics.Process]::Start($psi)
        $errTask = $proc.StandardError.ReadToEndAsync()
        $stdout = $proc.StandardOutput.ReadToEnd()
        $proc.WaitForExit()
        $stderr = $errTask.GetAwaiter().GetResult()

        return [pscustomobject]@{
            ExitCode = $proc.ExitCode
            Output   = ($stdout + "`n" + $stderr).Trim()
        }
    }

    $dirName = [System.IO.Path]::GetDirectoryName($TexPath)
    $baseName = [System.IO.Path]::GetFileName($TexPath)
    $stem = [System.IO.Path]::GetFileNameWithoutExtension($TexPath)

    $sourceText = [System.IO.File]::ReadAllText($TexPath, [System.Text.Encoding]::UTF8)
    $hasClaves = $sourceText.Contains('ifmwclaves')

    $commonArgs = New-Object System.Collections.Generic.List[string]
    $commonArgs.Add('-xelatex')
    $commonArgs.Add('-interaction=nonstopmode')
    $commonArgs.Add('-halt-on-error')
    if ($Force) { $commonArgs.Add('-g') }
    $commonArgs.Add('-r')
    $commonArgs.Add($LatexmkRc)

    $logParts = New-Object System.Collections.Generic.List[string]
    $okTotal = $true

    $firstArgs = New-Object System.Collections.Generic.List[string]
    $firstArgs.AddRange($commonArgs)
    $firstArgs.Add($baseName)
    $res1 = Invoke-Latexmk -ArgList $firstArgs.ToArray() -WorkingDir $dirName
    if ($res1.Output) { $logParts.Add($res1.Output) }
    if ($res1.ExitCode -ne 0) {
        $okTotal = $false
    }

    if ($okTotal -and $hasClaves) {
        $secondArgs = New-Object System.Collections.Generic.List[string]
        $secondArgs.AddRange($commonArgs)
        $secondArgs.Add('-usepretex=\AtBeginDocument{\mwclavesoff}')
        $secondArgs.Add("-jobname=${stem}_scr")
        $secondArgs.Add($baseName)
        $res2 = Invoke-Latexmk -ArgList $secondArgs.ToArray() -WorkingDir $dirName
        if ($res2.Output) { $logParts.Add($res2.Output) }
        if ($res2.ExitCode -ne 0) {
            $okTotal = $false
        }
    }

    if ($okTotal -and $CleanAux) {
        [void](Invoke-Latexmk -ArgList @('-c', '-r', $LatexmkRc, $baseName) -WorkingDir $dirName)
        if ($hasClaves) {
            [void](Invoke-Latexmk -ArgList @('-c', '-r', $LatexmkRc, "-jobname=${stem}_scr", $baseName) -WorkingDir $dirName)
        }
    }

    return [pscustomobject]@{
        Ok        = $okTotal
        RelPath   = $RelPath
        HasClaves = $hasClaves
        Log       = ($logParts -join "`n")
    }
}

function Write-FailureTail {
    param([string]$LogText)
    if ([string]::IsNullOrWhiteSpace($LogText)) { return }
    Write-Host "         Últimas líneas del error:" -ForegroundColor Yellow
    $lines = $LogText -split "`r?`n"
    $start = [Math]::Max(0, $lines.Length - 12)
    for ($k = $start; $k -lt $lines.Length; $k++) {
        Write-Host "         | $($lines[$k])"
    }
    Write-Host ""
}

$stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
$passed = 0
$failed = 0
$failedList = New-Object System.Collections.Generic.List[string]

if ($Jobs -gt 1) {
    $pool = [runspacefactory]::CreateRunspacePool(1, $Jobs)
    $pool.Open()
    $tasks = New-Object System.Collections.Generic.List[object]

    try {
        foreach ($file in $filesToCompile) {
            $relPath = $file.FullName.Substring($repoPrefixLen) -replace '\\', '/'
            $ps = [powershell]::Create()
            $ps.RunspacePool = $pool
            [void]$ps.AddScript($compileWorker).AddArgument($file.FullName).AddArgument($relPath).AddArgument($LatexmkRc).AddArgument($Force).AddArgument($CleanAux)
            $handle = $ps.BeginInvoke()
            $tasks.Add([pscustomobject]@{
                PowerShell = $ps
                Handle     = $handle
                RelPath    = $relPath
                Done       = $false
            })
        }

        $remaining = $tasks.Count
        while ($remaining -gt 0) {
            $completedAny = $false
            foreach ($t in $tasks) {
                if (-not $t.Done -and $t.Handle.IsCompleted) {
                    $completedAny = $true
                    $t.Done = $true
                    $remaining--
                    try {
                        $res = $t.PowerShell.EndInvoke($t.Handle) | Select-Object -First 1
                        if ($res -and $res.Ok) {
                            $passed++
                            $tag = if ($res.HasClaves) { " (+_scr)" } else { "" }
                            Write-Host "  [ " -NoNewline
                            Write-Host "OK" -NoNewline -ForegroundColor Green
                            Write-Host " ] $($res.RelPath)$tag"
                        } else {
                            $failed++
                            $failedList.Add($t.RelPath)
                            Write-Host "  [" -NoNewline
                            Write-Host "FAIL" -NoNewline -ForegroundColor Red
                            Write-Host "] $($t.RelPath)"
                            if ($res) { Write-FailureTail -LogText $res.Log }
                        }
                    } catch {
                        $failed++
                        $failedList.Add($t.RelPath)
                        Write-Host "  [" -NoNewline
                        Write-Host "FAIL" -NoNewline -ForegroundColor Red
                        Write-Host "] $($t.RelPath)"
                        Write-FailureTail -LogText $_.Exception.Message
                    } finally {
                        $t.PowerShell.Dispose()
                    }
                }
            }
            if (-not $completedAny) {
                Start-Sleep -Milliseconds 100
            }
        }
    } finally {
        $pool.Close()
        $pool.Dispose()
    }
} else {
    $count = 0
    foreach ($file in $filesToCompile) {
        $count++
        $relPath = $file.FullName.Substring($repoPrefixLen) -replace '\\', '/'
        $label = $relPath.PadRight(60)
        Write-Host ("  [{0,2}/{1,2}] Compilando {2} ... " -f $count, $total, $label) -NoNewline

        $res = & $compileWorker $file.FullName $relPath $LatexmkRc $Force $CleanAux
        if ($res.Ok) {
            $passed++
            Write-Host "[ " -NoNewline
            Write-Host "OK" -NoNewline -ForegroundColor Green
            Write-Host " ]"
        } else {
            $failed++
            $failedList.Add($relPath)
            Write-Host "[" -NoNewline
            Write-Host "FAIL" -NoNewline -ForegroundColor Red
            Write-Host "]"
            Write-FailureTail -LogText $res.Log
        }
    }
}

$stopwatch.Stop()
$duration = [int][Math]::Round($stopwatch.Elapsed.TotalSeconds)

Write-Host "`n======================================================" -ForegroundColor Cyan
Write-Host "Resumen de Compilación:" -ForegroundColor White
Write-Host "  Tiempo total : ${duration}s"
Write-Host "  Exitosos     : " -NoNewline
Write-Host "$passed" -NoNewline -ForegroundColor Green
Write-Host " / $total"
if ($failed -gt 0) {
    Write-Host "  Fallidos     : " -NoNewline
    Write-Host "$failed" -ForegroundColor Red
    Write-Host "`nArchivos con errores:"
    foreach ($f in $failedList) {
        Write-Host "  - $f" -ForegroundColor Red
    }
} else {
    Write-Host "  Estado       : " -NoNewline
    Write-Host "¡Todos los documentos compilaron sin errores!" -ForegroundColor Green
}
Write-Host "======================================================" -ForegroundColor Cyan

if ($failed -gt 0) {
    exit 1
}
exit 0
