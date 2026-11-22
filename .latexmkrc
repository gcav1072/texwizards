# .latexmkrc — Mathwizards Consultoría Educativa STEM
#
# Expone <repo>/styles/ a TeX vía TEXINPUTS para que \usepackage{mathwizards-*}
# funcione desde cualquier subdirectorio.
#
# LIMITACIÓN IMPORTANTE: latexmk solo lee .latexmkrc del directorio actual o de
# $HOME, NUNCA de carpetas padre. Al compilar desde tex_files/<curso>/, este
# archivo NO se lee. Para LaTeX Workshop / Ctrl+S la solución portable vive en
# .vscode/settings.json (env TEXINPUTS con %WORKSPACE_FOLDER%). Este .latexmkrc
# cubre la compilación por CLI desde la raíz del repo.
#
# Este archivo es idempotente: puede convivir con un TEXINPUTS ya exportado
# (p. ej. el de compile_all.sh) sin duplicar entradas.

use Cwd qw(abs_path);
use File::Basename qw(dirname);

# Directorio del repo = directorio de este .latexmkrc (resuelve symlinks).
# latexmk evalúa este archivo con `eval`, por lo que __FILE__ vale "(eval N)".
# Usamos @rc_files_read, que latexmk rellena con la ruta del rc antes del eval.
my $rc_file_path = (@rc_files_read && defined $rc_files_read[-1] && -e $rc_files_read[-1])
    ? abs_path($rc_files_read[-1])
    : undef;
my $repo_root = defined($rc_file_path) ? dirname($rc_file_path) : abs_path('.');

# Fallback: si el rc se copiara/simlinkeara fuera del repo, busca styles/
# ascendiendo desde el directorio de trabajo.
if (!defined($repo_root) || !-d "$repo_root/styles") {
    my $dir = abs_path('.');
    while (defined($dir) && !-d "$dir/styles") {
        my $parent = dirname($dir);
        last if !defined($parent) || $parent eq $dir;
        $dir = $parent;
    }
    $repo_root = $dir if defined($dir) && -d "$dir/styles";
}

my $styles = defined($repo_root) ? "$repo_root/styles" : 'styles';
if (-d $styles) {
    if (defined &ensure_path) {
        ensure_path('TEXINPUTS', "$styles//");
    } else {
        my $sep = $search_path_separator // ($^O =~ /^(MSWin32|cygwin|msys)$/ ? ';' : ':');
        my $existing = $ENV{'TEXINPUTS'} // '';
        # Prepend solo si no estaba ya; el separador final conserva rutas por defecto.
        if (index($existing, $styles) < 0) {
            $ENV{'TEXINPUTS'} = "$styles//" . ($existing ne '' ? "$sep$existing" : '') . $sep;
        }
    }
} else {
    warn "[.latexmkrc] Aviso: no se encontró '$styles'. "
       . "Ejecuta setup_texmf.sh o revisa que styles/ exista.\n";
}

$xelatex = 'xelatex -halt-on-error -file-line-error -synctex=1 %O %S';
$pdf_mode = 5;            # 5 = xelatex
$pdf_previewer = 'zathura' if $^O eq 'linux';
