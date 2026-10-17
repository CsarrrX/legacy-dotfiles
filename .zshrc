# Cargo to PATH 
export PATH="$HOME/.cargo/bin:$PATH"

# Nvim PATH
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"

# Configuración de Miniconda
export PATH="$HOME/miniconda3/bin:$PATH"

# Local PATH
export PATH="$HOME/.local/bin:$PATH"

if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
fi

# Inkscape
alias ink1='python3 ~/inkscape-shortcut-manager/main.py'
alias ink2='inkscape-figures watch --no-daemon'

# Inicio de starship
eval "$(starship init zsh)"

# To-do
alias te='nvim ~/.todo.tex'
alias tt='~/legacy-dotfiles/scripts/to-do'

# Calendario
alias ce='nvim ~/.cal_local.tex'
alias ct='~/legacy-dotfiles/scripts/calendar'

to-do
calendar
