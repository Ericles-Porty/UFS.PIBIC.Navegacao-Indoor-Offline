from nbconvert import NotebookExporter

def remove_outputs(input_nb_path, output_nb_path):
    exporter = NotebookExporter()
    with open(input_nb_path, 'r') as nb_file:
        nb_contents = nb_file.read()
        (body, resources) = exporter.from_notebook_node(nb_contents)

    with open(output_nb_path, 'w') as output_file:
        output_file.write(body)
