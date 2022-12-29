dic = {}

line = []

#Sala
line.append(('Cozinha', 2.0))
line.append(('Varanda', 0.3))
line.append(('Banheiro', 4.0))
line.append(('Quarto de Hospede', 4.5))
line.append(('Quarto', 5.5))
line.append(('Suite', 7.0))
dic['Sala'] = line

#Cozinha
line = []
line.append(('Sala', 2.0))
line.append(('Varanda', 0.3))
line.append(('Banheiro', 2.0))
line.append(('Quarto de Hospede', 3.5))
line.append(('Quarto', 4.0))
line.append(('Suite', 5.0))
dic['Cozinha'] = line

#Banheiro
line = []
line.append(('Cozinha', 2.0))
line.append(('Sala', 4.0))
line.append(('Quarto de Hospede', 2.5))
line.append(('Quarto', 3.0))
line.append(('Suite', 3.0))
dic['Banheiro'] = line

#Quarto Hospede
line = []
line.append(('Sala', 4.5))
line.append(('Banheiro', 2.5))
line.append(('Cozinha', 3.5))
line.append(('Quarto', 0.5))
line.append(('Suite', 3.0))
dic['Quarto de Hospede'] = line

#Quarto
line = []
line.append(('Sala', 5.5))
line.append(('Banheiro', 3.0))
line.append(('Cozinha', 4.0))
line.append(('Quarto de Hospede', 0.5))
line.append(('Suite', 1.0))
dic['Quarto'] = line

#Suite
line = []
line.append(('Sala', 7.0))
line.append(('Banheiro', 3.0))
line.append(('Cozinha', 5.0))
line.append(('Quarto de Hospede', 3.0))
line.append(('Banheiro da Suite', 0.3))
line.append(('Quarto', 1.0))
dic['Suite'] = line

#Banheiro da suite
line = []
line.append(('Suite', 0.3))
dic['Banheiro da Suite'] = line

for current_locale, destinations in dic.items():
    print(current_locale, 'destinations:')

    for espace, distance in destinations:
        print(espace, 'at', distance, 'm')

    print()
