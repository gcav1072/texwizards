# .latexmkrc — Mathwizards Consultoría Educativa STEM
# Configura XeLaTeX como motor y agrega styles/ a la ruta de paquetes.
# Uso:  latexmk -xelatex archivo.tex

$ENV{'TEXINPUTS'} = '/home/gabo/texwizards/styles:' . ($ENV{'TEXINPUTS'} // '');

$xelatex = 'xelatex -halt-on-error -file-line-error -synctex=1';
$pdf_mode = 5;            # 5 = xelatex
$pdf_previewer = 'zathura';
