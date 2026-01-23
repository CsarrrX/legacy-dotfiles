#!/bin/bash
set -e

# ================================
# Dotfiles Bootstrap Script (Fedora + Sway)
# ================================

echo "[*] Instalando paquetes del sistema y herramientas de compilación..."
# Agregamos lo que faltaba: swaybg, swaylock, wofi y las herramientas de desarrollo
sudo dnf install -y \
    git curl wget gcc make cmake zsh firefox nodejs \
    python3 python3-pip clang-tools-extra cargo rust \
    texlive-scheme-full latexmk zathura zathura-pdf-mupdf \
    tmux R-devel wofi swaybg swaylock kitty libwacom xsetwacom \
    util-linux-user

# --- Herramientas de Lenguaje y LSP ---
echo "[*] Instalando herramientas globales (NPM/Cargo)..."
sudo npm install -g pyright
cargo install texlab
cargo install starship  # Instalado vía cargo como pediste

# --- Git config global ---
echo "[*] Configurando Git..."
git config --global user.name "csarrrx"
git config --global user.email "cesarpeam@proton.me"

# --- Github ssh key ---
if [ ! -f "$HOME/.ssh/id_ed25519" ]; then
    echo "[*] Generando llave SSH..."
    ssh-keygen -t ed25519 -C "cesarpeam@proton.me" -f ~/.ssh/id_ed25519 -N ""
fi
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

# --- Miniconda ---
if [ ! -d "$HOME/miniconda3" ]; then
    echo "[*] Instalando Miniconda..."
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /tmp/miniconda.sh
    bash /tmp/miniconda.sh -b -u -p ~/miniconda3
    rm /tmp/miniconda.sh
fi

# --- Fuentes (Nerd Fonts) ---
if [ ! -d "$HOME/.local/share/fonts/JetBrainsMono" ]; then
    echo "[*] Instalando Nerd Fonts..."
    mkdir -p ~/.local/share/fonts
    curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
    tar -xvf JetBrainsMono.tar.xz -C ~/.local/share/fonts
    rm JetBrainsMono.tar.xz
    fc-cache -fv
fi

# --- Estructura de Dotfiles y Symlinks ---
echo "[*] Creando symlinks de dotfiles..."
mkdir -p ~/.config/sway ~/.config/waybar ~/.config/wofi ~/.config/kitty

# Enlaces directos a .config
ln -sf ~/dotfiles/sway/config ~/.config/sway/config
ln -sf ~/dotfiles/waybar/config ~/.config/waybar/config
ln -sf ~/dotfiles/waybar/style.css ~/.config/waybar/style.css
ln -sf ~/dotfiles/wofi/config ~/.config/wofi/config
ln -sf ~/dotfiles/wofi/style.css ~/.config/wofi/style.css
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sfn ~/dotfiles/nvim ~/.config/nvim

# Enlaces en HOME
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.latexmkrc ~/.latexmkrc

# --- Configuración de Reloj (Dual Boot) ---
sudo timedatectl set-local-rtc 1 --adjust-system-clock

# --- Cambio de Shell ---
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi

echo "[✔] Instalación completada."
echo "[!] IMPORTANTE: Copia tu llave pública a GitHub:"
cat ~/.ssh/id_ed25519.pub
