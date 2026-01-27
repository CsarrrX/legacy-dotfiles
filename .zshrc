# Cargo to PATH 
export PATH="$HOME/.cargo/bin:$PATH"

# Nvim PATH
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# --- Configuración de Miniconda ---
export PATH="$HOME/miniconda3/bin:$PATH"

# Inicialización opcional (esto activa el entorno base al abrir la terminal)
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi

alias views='latexmk -pdf -pvc master.tex'

# Función para cambiar la materia activa (cursoact)
setc() {
    local NOTAS_DIR="$HOME/notas"
    local TARGET_LINK="$NOTAS_DIR/cursoact"
    
    # Si no das argumentos, muestra las materias disponibles
    if [ -z "$1" ]; then
        echo "Uso: setc <nombre_carpeta>"
        echo "Materias disponibles:"
        ls -d $NOTAS_DIR/*/ | grep -v "cursoact" | xargs -n 1 basename
        return 1
    fi

    local NEW_COURSE="$NOTAS_DIR/$1"

    # Verifica si la carpeta de la materia existe
    if [ -d "$NEW_COURSE" ]; then
        # -s: simbólico, -f: forzar (borra el anterior), -n: evita anidamiento
        ln -sfn "$NEW_COURSE" "$TARGET_LINK"
        echo "📍 Materia activa cambiada a: $1"
    else
        echo "❌ Error: La carpeta '$1' no existe en $NOTAS_DIR"
    fi
}

# Starship init
eval "$(starship init zsh)"

