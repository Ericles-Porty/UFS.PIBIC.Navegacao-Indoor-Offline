import nbformat

def has_outputs_to_remove(notebook_path):
    with open(notebook_path, 'r') as nb_file:
        nb = nbformat.read(nb_file, as_version=4)
        for cell in nb.cells:
            if cell.cell_type == 'code' and cell.outputs:
                return True
    return False

if __name__ == "__main__":
    import sys
    notebook_path = sys.argv[1]
    if has_outputs_to_remove(notebook_path):
        print("true")
    else:
        print("false")
