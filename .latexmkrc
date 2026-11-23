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

# En Windows (TeX Live), fontconfig usa TEXMFSYSVAR/fonts/conf/fonts.conf, que
# solo indexa C:/Windows/fonts y texmf-dist, ignorando assets/fonts/ y las
# fuentes instaladas por usuario en %LOCALAPPDATA%\Microsoft\Windows\Fonts.
if ($^O eq 'MSWin32' && (!defined $ENV{'FONTCONFIG_FILE'} || $ENV{'FONTCONFIG_FILE'} eq '')) {
    require File::Path;
    my @extra_font_dirs;
    if (defined($repo_root) && -d "$repo_root/assets/fonts") {
        (my $d = "$repo_root/assets/fonts") =~ s{\\}{/}g;
        push @extra_font_dirs, $d;
    }
    if (defined($ENV{'LOCALAPPDATA'}) && $ENV{'LOCALAPPDATA'} ne '') {
        (my $uf = "$ENV{'LOCALAPPDATA'}/Microsoft/Windows/Fonts") =~ s{\\}{/}g;
        push @extra_font_dirs, $uf if -d $uf;
    }

    if (@extra_font_dirs) {
        my $base_fc;
        for my $var ('TEXMFSYSVAR', 'TEXMFVAR') {
            my $val = $ENV{$var};
            if (!defined($val) || $val eq '') {
                $val = `kpsewhich --var-value=$var 2>NUL`;
                $val =~ s/[\r\n]+$// if defined $val;
            }
            if (defined($val) && $val ne '' && -e "$val/fonts/conf/fonts.conf") {
                ($base_fc = "$val/fonts/conf/fonts.conf") =~ s{\\}{/}g;
                last;
            }
        }

        if (defined($base_fc)) {
            my $xml_esc = sub {
                my ($s) = @_;
                $s =~ s/&/&amp;/g;
                $s =~ s/</&lt;/g;
                $s =~ s/>/&gt;/g;
                return $s;
            };
            my $xml = qq{<?xml version="1.0" encoding="UTF-8"?>\n<!DOCTYPE fontconfig SYSTEM "fonts.dtd">\n<fontconfig>\n};
            $xml .= "  <include ignore_missing=\"no\">" . $xml_esc->($base_fc) . "</include>\n";
            for my $d (@extra_font_dirs) {
                $xml .= "  <dir>" . $xml_esc->($d) . "</dir>\n";
            }
            $xml .= "</fontconfig>\n";

            my $tmp_dir = (defined($repo_root) && -d $repo_root)
                ? "$repo_root/.mws_tmp"
                : ($ENV{'TEMP'} // $ENV{'TMP'} // '.');
            $tmp_dir =~ s{\\}{/}g;
            eval { File::Path::make_path($tmp_dir) unless -d $tmp_dir; };
            my $custom_fc = "$tmp_dir/fonts.conf";
            my $existing_xml = '';
            if (-e $custom_fc && open(my $rfh, '<', $custom_fc)) {
                local $/;
                $existing_xml = <$rfh> // '';
                close($rfh);
            }
            if ($existing_xml ne $xml) {
                my $stage = "$custom_fc.$$.tmp";
                if (open(my $wfh, '>', $stage)) {
                    print {$wfh} $xml;
                    close($wfh);
                    rename($stage, $custom_fc) or unlink($stage);
                }
            }
            $ENV{'FONTCONFIG_FILE'} = $custom_fc if -e $custom_fc;
        }
    }
}

$xelatex = 'xelatex -halt-on-error -file-line-error -synctex=1 %O %S';
$pdf_mode = 5;            # 5 = xelatex
$pdf_previewer = 'zathura' if $^O eq 'linux';
