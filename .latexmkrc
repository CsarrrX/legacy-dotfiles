# Enviar todos los archivos auxiliares a build/
$out_dir = 'build';

# Crear el directorio si no existe
$do_cd = 1;

# PDF por defecto
$pdf_mode = 1;

# Synctex siempre
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode %O %S';

# Limpieza más agresiva
$clean_ext .= ' acn acr alg glg glo gls fls fdb_latexmk synctex.gz';

# Usamos zathura 
$pdf_previewer = 'zathura';
