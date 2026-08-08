# Cargo to PATH 
export PATH="$HOME/.cargo/bin:$PATH"

# Nvim PATH
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Configuración de Miniconda
export PATH="$HOME/miniconda3/bin:$PATH"

if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi

# Inkscape
alias ink='python3 ~/inkscape-shortcut-manager/main.py'
alias ink2='inkscape-figures watch --no-daemon'

# Telegram 
alias mandarpdf='telegram-send --file build/master.pdf'
mandartodas() {
    echo "Enviando notas..."
    for pdf in an2/build/master.pdf md3/build/master.pdf mat/build/master.pdf inf1/build/master.pdf; do
        if [ -f "$pdf" ]; then
            telegram-send --file "$pdf"
            echo "Enviado: $pdf"
        else
            echo "No encontrado: $pdf"
        fi
    done
    echo "¡Listo!"
}

# Inicio de starship
eval "$(starship init zsh)"
