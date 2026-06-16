# Uso: draw_fig.sh <nombre_figura> <directorio_del_tex>

FIG_NAME=$1
DIR=$2
FIG_DIR="$DIR/figures"

# Crear el directorio de figuras si no existe
mkdir -p "$FIG_DIR"

XOPP_FILE="$FIG_DIR/$FIG_NAME.xopp"
PDF_FILE="$FIG_DIR/$FIG_NAME.pdf"

# Abrir Xournal++.
xournalpp "$XOPP_FILE"

# Cuando cerramos Xournal++, exportamos y recortamos
if [ -f "$XOPP_FILE" ]; then
    # 1. Exporta el A4 completo
    xournalpp -p "$PDF_FILE" "$XOPP_FILE"
    
    # 2. Recorta el exceso de espacio en blanco (sobrescribe el mismo archivo)
    pdfcrop "$PDF_FILE" "$PDF_FILE" > /dev/null
fi

