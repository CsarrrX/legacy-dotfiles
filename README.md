# Dotfiles - Fedora i3 Setup

Este repositorio contiene la configuración personal para Fedora, migrada de Sway a i3, optimizada para un flujo de trabajo eficiente, minimalista y con alto rendimiento bajo X11.

## Contenido del Repositorio

* **Window Manager:** i3-gaps (configuración con gaps de 10px y bordes inteligentes).
* **Compositor:** Picom (configurado con Dual Kawase Blur, sombras y esquinas redondeadas).
* **Barra de Estado:** Polybar (diseño modular con soporte para scripts de Google Calendar y monitoreo de sistema).
* **Lanzador de Aplicaciones:** Rofi (estilo minimalista centrado, reemplazo de Wofi).
* **Terminal:** Kitty.
* **Shell:** Zsh + Starship (prompt limpio sin indicadores de entornos virtuales).
* **Editor:** Neovim (configuración avanzada en `~/dotfiles/nvim`).
* **Herramientas de Estudio:** TexLive Full, Inkscape, Latexmk y Zathura.
* **Desarrollo:** Miniconda, Node.js, Rust/Cargo, GCC, Make y R.
* **Assets:** Fondos de pantalla y recursos en `~/.config/assets`.

## Instalacion (Bootstrap)

1. Clonar el repositorio en la carpeta personal:
   git clone https://github.com/csarrrx/dotfiles.git ~/dotfiles

2. Dar permisos de ejecucion al script:
   cd ~/dotfiles
   chmod +x instala_sistema.sh

3. Ejecutar el instalador:
   ./instala_sistema.sh

El script instala los paquetes mediante DNF, herramientas vía Cargo y NPM, configura Git, genera la llave SSH y crea los enlaces simbolicos (symlinks) necesarios para la configuracion.

## Actualizacion

### Sistema y Herramientas
Para actualizar los paquetes y herramientas globales:
sudo dnf update && cargo install starship --locked && sudo npm install -g pyright

### Sincronizacion de Configuracion
Si se realizan cambios en la carpeta de dotfiles:
cd ~/dotfiles
git pull
./instala_sistema.sh

## Atajos de Teclado Principales

* Mod + d: Abrir rofi.
* Mod + t: Abrir terminal Kitty.
* Mod + Shift + e: Salir de i3 inmediatamente.
* Mod + l: Bloquear pantalla

## Notas de Configuracion
* Symlinks: La organizacion se basa en enlaces simbolicos manuales desde ~/dotfiles hacia ~/.config para facilitar la gestion de cambios.
* Privacidad y Estilo: Se prioriza una interfaz limpia, eliminando elementos visuales distractores en el prompt y la pantalla de bloqueo.
