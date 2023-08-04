import matplotlib.pyplot as plt
import numpy as np

table_q_id = 53

#Leitura de dados de um arquivo CSV

t = []
f = []
values = []
file = open(f'table_q/table_q_{table_q_id}.csv', 'r')
for line in file:
    line = line.split(',')
    t.append(int(line[0]))
    f.append(int(line[1]))
    values.append(float(line[2]))

id = []
x = []
y = []
f2 = open('vertices.csv', 'r')
for line in f2:
    line = line.split(',')
    id.append(int(line[0]))
    x.append(int(line[-2]))
    y.append(int(line[-1]))

new_x = []
new_y = []
new_values = []

for i in range(len(f)):
    for j in range(len(id)):
        if f[i] == id[j]:
            new_x.append(x[j])
            new_y.append(y[j])
            new_values.append(values[i])

x = new_x 
y = new_y 
values = new_values

# Criação de uma matriz 2D com base nos dados
heatmap, xedges, yedges = np.histogram2d(x, y, bins=(np.max(x), np.max(y)), weights=values)

# Configuração do mapa de cores
cmap = 'viridis'  # Escolha uma paleta de cores, como 'hot', 'cool', 'viridis', 'jet', etc.

# Plotagem do mapa de calor
plt.imshow(heatmap.T, cmap=cmap, origin='lower',vmax=10.0)

# Adição de barras de cores para indicar os valores
plt.colorbar()
plt.gca().invert_yaxis()
# plt.savefig('heatmap.png',transparent=True)
# Exibição do gráfico
plt.show()






