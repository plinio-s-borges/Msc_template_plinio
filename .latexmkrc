# Use latexmk -pdf (default pdflatex). Keep your LaTeX engine as-is.

# Use LuaLaTeX as the PDF engine (direct to PDF)
$pdf_mode = 4;

# Run Biber only when needed (not every build)
$bibtex_use = 1;
$bibtex     = 'biber %O %B';
$biberswitches = '-q';

# Reduce maximum reruns (latexmk rarely needs more)
$max_repeat = 3;

# Quieter output; tiny overhead reduction
$silent = 1;

# Enable make-style deps if present (glossaries, etc.)
$use_make = 1;
