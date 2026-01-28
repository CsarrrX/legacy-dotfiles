#!/bin/bash
set -e

# ================================
# Dotfiles Bootstrap Script (Fedora + i3)
# ================================
echo "[*] Instalando paquetes del sistema y herramientas de compilación..."
sudo dnf install -y \
    git curl wget gcc make cmake zsh firefox nodejs \
    python3 python3-pip clang-tools-extra cargo rust \
    texlive-scheme-full latexmk zathura zathura-pdf-mupdf \
    R-devel kitty libwacom xsetwacom xinput \
    util-linux-user inkscape \
    i3 i3lock polybar rofi feh picom maim xclip xdotool \
    python3-google-api-client python3-google-auth-oauthlib python3-google-auth-httplib2 \
    python3-pyyaml python3-pytz python3-dateutil -y

# --- Herramientas de Lenguaje y LSP ---
echo "[*] Instalando herramientas globales (NPM/Cargo)..."
sudo npm install -g pyright
cargo install texlab
cargo install starship

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
mkdir -p ~/.config/i3 ~/.config/polybar ~/.config/rofi ~/.config/kitty ~/.config/picom 

ln -sf ~/legacy-dotfiles/i3/config ~/.config/i3/config
ln -sf ~/legacy-dotfiles/polybar/config.ini ~/.config/polybar/config.ini
ln -sf ~/legacy-dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
ln -sf ~/legacy-dotfiles/picom/picom.conf ~/.config/picom/picom.conf
ln -sf ~/legacy-dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

# Enlaces compartidos
ln -sfn ~/legacy-dotfiles/nvim ~/.config/nvim
ln -sfn ~/legacy-dotfiles/assets ~/.config/assets
ln -sf ~/legacy-dotfiles/.zshrc ~/.zshrc
ln -sf ~/legacy-dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/legacy-dotfiles/.latexmkrc ~/.latexmkrc

# --- Cambio de Shell ---
if [ "$SHELL" != "$(which zsh)" ]; then
    chsh -s $(which zsh)
fi

echo "[✔] Instalación completada."
echo "[!] IMPORTANTE: Copia tu llave pública a GitHub:"
cat ~/.ssh/id_ed25519.pub
