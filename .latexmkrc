# .latexmkrc — Mathwizards Consultoría Educativa STEM
use Cwd qw(abs_path);
use File::Basename qw(dirname);

my $repo_root = dirname(abs_path(__FILE__));
$ENV{'TEXINPUTS'} = "$repo_root/styles//:" . ($ENV{'TEXINPUTS'} // '') . ":";

$xelatex = 'xelatex -halt-on-error -file-line-error -synctex=1 %O %S';
$pdf_mode = 5;            # 5 = xelatex
$pdf_previewer = 'zathura';
