import math


# Função para calcular a distância euclidiana entre dois pontos (x1, y1) e (x2, y2)
def calculate_distance(x1, y1, x2, y2):
    return math.sqrt((x1 - x2)**2 + (y1 - y2)**2)


# Leitura dos vértices a partir do arquivo
vertices = {}
with open('vertices.csv', 'r', encoding='utf-8-sig') as vertices_file:
    for line in vertices_file:
        id, nome, category, pos_x, pos_y = line.strip().split(',')
        vertices[id] = {
            'nome': nome,
            'category': category,
            'pos_x': float(pos_x),
            'pos_y': float(pos_y)
        }

arestas_novas = []

# Leitura das arestas a partir do arquivo
with open('arestas.csv', 'r', encoding="utf-8-sig") as arestas_file:
    for line in arestas_file:
        id_origem, id_destino, _ = map(str,line.strip().split(','))

        x1, y1 = vertices[id_origem]['pos_x'], vertices[id_origem]['pos_y']
        x2, y2 = vertices[id_destino]['pos_x'], vertices[id_destino]['pos_y']

        distance = calculate_distance(x1, y1, x2, y2)

        distance_formated = f'{distance:.1f}'
        arestas_novas.append((id_origem, id_destino, distance_formated))

for id_origem, id_destino, distance_formated in arestas_novas:
    print(f'{id_origem},{id_destino},{distance_formated}')

file = open('arestas.csv', 'w', encoding="utf-8-sig")
for id_origem, id_destino, distance_formated in arestas_novas:
    file.write(f'{id_origem},{id_destino},{distance_formated}\n')
file.close()

        
