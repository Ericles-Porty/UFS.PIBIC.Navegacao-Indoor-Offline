import matplotlib.pyplot as plt

# Dados de exemplo
x = []  # Valores X
y = []  # Valores Y

# f = open('table_q/table_q_53.csv', 'r')
f = open('vertices.csv', 'r')
for line in f:
    line = line.split(',')
    x.append(int(line[-2]))
    y.append(int(line[-1]))
    # values.append(float(line[2]))
# Plotagem dos pontos
plt.scatter(x, y)

# Configurações dos eixos
plt.xlabel('X')
plt.ylabel('Y')
plt.gca().invert_yaxis()

# Exibição do gráfico
plt.show()