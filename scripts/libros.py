from config import Parent_root_libros

class Libro(): 
    def __init__(self, path): 
        self.path = path 
        self.name = path.stem


class Libros(list): 
    def __init__(self):
        list.__init__(self, self.read_files()) 

    def read_files(self):
        directorio_libros = [x for x in Parent_root_libros.iterdir() if x.is_file() and x.name != ".git"]
        _libros = [Libro(path) for path in directorio_libros]
        return sorted(_libros, key=lambda c: c.name)
