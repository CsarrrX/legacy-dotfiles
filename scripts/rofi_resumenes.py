import subprocess 
from resumenes import Resumenes


def rofi_menu(opciones, prompt='Selecciona materia'):
    proceso = subprocess.Popen(
        ['rofi', '-dmenu', '-p', prompt, '-i'], 
        stdin=subprocess.PIPE,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True
    )

    seleccion, _ = proceso.communicate(input="\n".join(opciones))
    return seleccion.strip()

def main(): 
    resumenes = Resumenes() 
    materias_nombres = [c.name for c in resumenes]

    nombre_seleccionado = rofi_menu(materias_nombres) 

    if nombre_seleccionado: 
        resumen_elegido = resumenes.buscar_por_nombre(nombre_seleccionado)

        if resumen_elegido and resumen_elegido.path.exists(): 
            subprocess.Popen(["kitty", "-e", "nvim", str(resumen_elegido.path)])

if __name__ == "__main__": 
    main() 

