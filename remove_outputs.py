from nbformat import read, write

def remove_outputs(notebook_path, output_path):
    with open(notebook_path, 'r') as nb_file:
        nb = read(nb_file, as_version=4)
        for cell in nb.cells:
            if hasattr(cell, "outputs"):
                cell.outputs = []

    with open(output_path, 'w') as output_file:
        write(nb, output_file)

if __name__ == "__main__":
    import sys
    input_nb_path = sys.argv[1]
    output_nb_path = sys.argv[2]
    remove_outputs(input_nb_path, output_nb_path)
