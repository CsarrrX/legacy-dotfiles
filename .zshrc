# Cargo to PATH 
export PATH="$HOME/.cargo/bin:$PATH"

# Starship init
eval "$(starship init zsh)"

# Nvim PATH
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# --- Configuración de Miniconda ---
export PATH="$HOME/miniconda3/bin:$PATH"

# Inicialización opcional (esto activa el entorno base al abrir la terminal)
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi

alias lectures="python3 $HOME/setup-notes/scripts/lectures_cli.py"
alias views="latexmk -pdf -pvc -interaction=nonstopmode -view=none build/master.tex"


