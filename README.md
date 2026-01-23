# Dotfiles - Fedora Sway Setup

Este repositorio contiene la configuración personal para Fedora Sway Spin, optimizada para un flujo de trabajo eficiente y un uso reducido de espacio en disco.

## Contenido del Repositorio

* Window Manager: Sway (configuración minimalista sin mensajes de confirmación de salida).
* Barra de Estado: Waybar (transparente con indicadores de Red, Disco, Batería y Reloj).
* Lanzador de Aplicaciones: Wofi (configuración centrada tipo Spotlight).
* Terminal: Kitty.
* Shell: Zsh + Starship (prompt configurado sin indicadores de entornos de Python/Conda).
* Editor: Neovim (instalación manual externa, configuración en ~/dotfiles/nvim).
* Herramientas de Estudio: TexLive Full, Latexmk y Zathura.
* Desarrollo: Miniconda, Node.js, Rust/Cargo, GCC, Make y R.
* Assets: Carpeta para fondos de pantalla y recursos del sistema.

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

* Mod + d: Abrir Wofi.
* Mod + t: Abrir terminal Kitty.
* Mod + Shift + e: Salir de Sway inmediatamente.
* Mod + l: Bloquear pantalla (Swaylock con fondo personalizado y sin indicadores).

## Notas de Configuracion

* Reloj: El script configura el RTC en local para evitar conflictos de hora con Windows.
* Symlinks: La organizacion se basa en enlaces simbolicos manuales desde ~/dotfiles hacia ~/.config para facilitar la gestion de cambios.
* Privacidad y Estilo: Se prioriza una interfaz limpia, eliminando elementos visuales distractores en el prompt y la pantalla de bloqueo.
