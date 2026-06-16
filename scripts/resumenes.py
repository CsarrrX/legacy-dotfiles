from config import Parent_root_resumenes

class Resumen(): 
    def __init__(self, path): 
        self.path = path 
        self.name = path.stem


class Resumenes(list): 
    def __init__(self):
        list.__init__(self, self.read_files()) 

    def read_files(self):
        directorio_resumenes = [x for x in Parent_root_resumenes.iterdir() if x.is_dir() and x.name != ".git"]
        _resumenes = [Resumen(path) for path in directorio_resumenes]
        return sorted(_resumenes, key=lambda c: c.name)

    def buscar_por_nombre(self, nombre):
        for resumen in self:
            if resumen.name == nombre:
                return resumen
        return None
