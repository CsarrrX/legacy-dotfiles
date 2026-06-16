import subprocess 
import os
from libros import Libros, Libro

def rofi_menu(opciones, prompt='Selecciona libro'):
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
    libros = Libros() 
    nombres_libros = [c.name for c in libros]

    libro = rofi_menu(nombres_libros) 

    if not libro:
        print("Operación cancelada por el usuario.")
        return

    libro_objetivo = next(c for c in libros if c.name == libro) 
    
    if libro_objetivo: 
        archivo = libro_objetivo.path 

        if os.path.exists(archivo): 
            subprocess.Popen(["okular", archivo])
        else: 
            print("Libro no encontrado")

if __name__ == "__main__": 
    main()
