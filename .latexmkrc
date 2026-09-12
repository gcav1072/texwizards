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
my $repo_root = dirname(abs_path(__FILE__));

# Fallback: si el rc se copiara/simlinkeara fuera del repo, busca styles/
# ascendiendo desde el directorio de trabajo.
if (!-d "$repo_root/styles") {
    my $dir = abs_path('.');
    while ($dir ne '/' && !-d "$dir/styles") {
        $dir = dirname($dir);
    }
    $repo_root = $dir if -d "$dir/styles";
}

my $styles = "$repo_root/styles";
if (-d $styles) {
    my $existing = $ENV{'TEXINPUTS'} // '';
    # Prepend solo si no estaba ya; el ":" final conserva las rutas por defecto.
    if (index($existing, $styles) < 0) {
        $ENV{'TEXINPUTS'} = "$styles//" . ($existing ne '' ? ":$existing" : '') . ":";
    }
} else {
    warn "[.latexmkrc] Aviso: no se encontró '$styles'. "
       . "Ejecuta setup_texmf.sh o revisa que styles/ exista.\n";
}

$xelatex = 'xelatex -halt-on-error -file-line-error -synctex=1 %O %S';
$pdf_mode = 5;            # 5 = xelatex
$pdf_previewer = 'zathura';
