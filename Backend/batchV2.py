import random
from api import *

def get_distance(algorithm, origin, destiny):
    distance = 0
    if algorithm in ["QLearning", "Sarsa"]:
        _, distance = get_path_rl(origin, destiny, algorithm)
    elif algorithm in ["Astar", "Largura", "Profundidade"]:
        _, distance = get_path_search(origin, destiny, algorithm)
    return distance

def batch_run(epochs):
    algorithms = ["QLearning", "Sarsa", "Astar", "Largura", "Profundidade"]
    total_distances = {algorithm: 0 for algorithm in algorithms}

    for i in range(epochs):
        origin, destiny = generate_random_origin_destiny()

        for algorithm in algorithms:
            distance = get_distance(algorithm, origin, destiny)
            total_distances[algorithm] += distance

    save_results(total_distances, epochs)

def generate_random_origin_destiny():
    vertices = list(vertices_dict.keys())
    origin = random.choice(vertices)
    destiny = random.choice(vertices)
    
    while origin == destiny:
        destiny = random.choice(vertices)
    
    return int(origin), int(destiny)

def save_results(total_distances, epochs):
    with open(f"batch/total_results_{epochs}.csv", "w", encoding="utf-8-sig") as _file:
        for algorithm, distance in total_distances.items():
            _file.write(f"{algorithm}, {distance}\n")

if __name__ == "__main__":
    epochs = 1000000
    batch_run(epochs)
