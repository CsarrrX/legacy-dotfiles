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

alias ink='python3 ~/inkscape-shortcut-manager/main.py'
alias ink2='inkscape-figures watch --no-daemon'
eval "$(starship init zsh)"
