from api import *

def batch_run():
    qlearning_total_distance = 0
    sarsa_total_distance = 0
    astar_total_distance = 0
    largura_total_distance = 0
    profundidade_total_distance = 0

    # create a file to save the results
    # _file = open("results.csv", "w", encoding="utf-8-sig")
    # _file.write("algorithm, distance, steps\n")

    epochs = 1000000
    # run the 5 algorithms 100 times
    for i in range(epochs):
        # generate a random origin and destiny
        origin = int(random.choice(list(vertices_dict.keys())))
        destiny = int(random.choice(list(vertices_dict.keys())))

        while origin == destiny:
            destiny = int(random.choice(list(vertices_dict.keys())))

        # run the 5 algorithms
        for algorithm in ["QLearning", "Sarsa", "Astar", "Largura",
                          "Profundidade"]:
            # print (f"Running {algorithm} {i}")
            # print (f"Origin: {origin} Destiny: {destiny}")
            # path = []
            distance = 0
            if algorithm in ["QLearning", "Sarsa"]:
                _, distance = get_path_rl(origin, destiny, algorithm)
            else:
                _, distance = get_path_search(origin, destiny, algorithm)

            if algorithm == "QLearning":
                qlearning_total_distance += distance
            elif algorithm == "Sarsa":
                sarsa_total_distance += distance
            elif algorithm == "Astar":
                astar_total_distance += distance
            elif algorithm == "Largura":
                largura_total_distance += distance
            elif algorithm == "Profundidade":
                profundidade_total_distance += distance

            # print (f"Distance: {distance}")
            # _file.write(f"{algorithm}, {distance}, {len(path)}\n")

    # _file.close()

    _file = open(f"batch/total_results_{epochs}.csv", "w", encoding="utf-8-sig")
    _file.write(f"QLearning, {qlearning_total_distance}\n")
    _file.write(f"Sarsa, {sarsa_total_distance}\n")
    _file.write(f"Astar, {astar_total_distance}\n")
    _file.write(f"Largura, {largura_total_distance}\n")
    _file.write(f"Profundidade, {profundidade_total_distance}\n")
    _file.close()

if __name__ == "__main__":
    batch_run()