# Uso: draw_fig.sh <nombre_figura> <directorio_del_tex>

FIG_NAME=$1
DIR=$2
FIG_DIR="$DIR/figures"

# Crear el directorio de figuras si no existe
mkdir -p "$FIG_DIR"

XOPP_FILE="$FIG_DIR/$FIG_NAME.xopp"
PDF_FILE="$FIG_DIR/$FIG_NAME.pdf"

# Abrir Xournal++. El script se pausará aquí hasta que cierres la ventana.
xournalpp "$XOPP_FILE"

# Cuando el usuario cierra la ventana (con Mod+Shift+Q o guardando), se exporta
if [ -f "$XOPP_FILE" ]; then
    xournalpp -p "$PDF_FILE" "$XOPP_FILE"
fi
