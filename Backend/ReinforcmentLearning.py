import os
import random

ALPHA = 0.3  # Taxa de aprendizado
GAMMA = 0.7  # Fator de desconto
EPSILON = 0.9  # Taxa de exploração
DEFAULT_Q = 0.0


def get_normalized_distance(distance: float, max_distance: float,
                            min_distance: float) -> float:
    return (distance - min_distance) / (max_distance - min_distance)


def get_delta_q(actual_q: float, reward: float, max_q: float,
                normalized_distance: float) -> float:
    return (ALPHA +
            (1 - normalized_distance)) * (reward + GAMMA * max_q - actual_q)
    # return ALPHA * (reward + GAMMA * max_q - actual_q)


def get_delta_q_sarsa(actual_q: float, reward: float, next_q: float,
                      normalized_distance: float) -> float:
    # return (ALPHA +
            # (1 - normalized_distance)) * (reward + GAMMA * next_q - actual_q)
    return ALPHA * (reward + GAMMA * next_q - actual_q)

# used for generate graph with matplotlib
def save_delta_q_list(dq: list) -> None:
    _file = open("delta_q.csv", "w", encoding="utf-8")
    for i in dq:
        _file.write(f"{i}\n")
    _file.close()

# verify if the last 5 values of delta q are equal
def is_converged(delta_q_list: list, match_numbers: int = 5) -> bool:
    if len(delta_q_list) > match_numbers:
        for i in range(1, match_numbers):
            if delta_q_list[-1] != delta_q_list[-i]:
                return False
        return True

# save path in csv file
def save_path(path: list) -> None:
    _file = open("path.csv", "w", encoding="utf-8")

    # convert int to str
    path = [str(p) for p in path]

    # separate path with comma
    path = ",".join(path)

    _file.write(path)
    _file.close()


class Edge:

    def __init__(self, start, end, distance: int, q=DEFAULT_Q) -> None:
        self.start = start
        self.end = end
        self.distance = distance
        self.q = q


class Vertex:

    def __init__(self, id: int, name: str, category: str, r=0.0) -> None:
        self.id = id
        self.name = name
        self.edges = []
        self.category = category
        self.r = r

    def add_edge(self, edge: Edge) -> None:
        for e in self.edges:
            if e.end == edge.end:
                return
        self.edges.append(edge)

    def get_bigger_q_action(self) -> float:
        bigger_q = DEFAULT_Q
        for edge in self.edges:
            if edge.q > bigger_q:
                bigger_q = edge.q
        return bigger_q

    def get_best_action_index(self) -> int:
        edge_destiny = self.edges[0]
        for edge in self.edges:
            if edge.q > edge_destiny.q:
                edge_destiny = edge
        return self.edges.index(edge_destiny)


class Graph:

    def __init__(self) -> None:
        self.vertices = []
        self.start = None
        self.goal = None
        self.min_distance = 9999999
        self.max_distance = 0

    def read_csv(self) -> None:
        _file = open("vertices.csv", "r", encoding="utf-8-sig")

        for line in _file:
            line = line.split(",")

            vertex_id = int(line[0])
            name = str(line[1])
            category = str(line[2])

            self.add_vertex(Vertex(vertex_id, name, category))

        _file.close()

        _file = open("arestas.csv", "r", encoding="utf-8-sig")

        for line in _file:
            line = line.split(",")

            start = int(line[0])
            end = int(line[1])
            distance = int(line[2])

            if distance < self.min_distance:
                self.min_distance = distance

            if distance > self.max_distance:
                self.max_distance = distance

            self.add_edge(start, end, distance)

        _file.close()

    def get_all_vertices(self) -> list():
        return self.vertices

    def get_all_edges(self) -> list:
        edges = []
        for vertex in self.vertices:
            for edge in vertex.edges:
                edges.append(edge)
        return edges

    def add_vertex(self, vertex: Vertex) -> None:
        self.vertices.append(vertex)

    def get_vertex_by_id(self, id: int) -> Vertex:
        for vertex in self.vertices:
            if str(vertex.id) == str(id):
                return vertex
        raise Exception(f"Vertex with id {id} not found")

    def get_vertex_by_name(self, name: str) -> Vertex:
        for vertex in self.vertices:
            if vertex.name == name:
                return vertex
        raise Exception(f"Vertex with name {name} not found")

    def set_goal(self, goal_vertex: Vertex) -> None:
        self.goal = goal_vertex

    def set_start(self, start_vertex: Vertex) -> None:
        self.start = start_vertex

    def add_edge(self, start: int, end: int, distance: int) -> None:
        start = self.get_vertex_by_id(start)
        end = self.get_vertex_by_id(end)
        start.add_edge(Edge(start, end, distance))
        end.add_edge(Edge(end, start, distance))

    def define_reward(self, reward: float, vertex: Vertex) -> None:
        vertex.r = reward


class Agent:

    def __init__(self, graph: Graph) -> None:
        self.graph = graph
        self.current = graph.start
        self.path = []
        self.epoch = 0
        self.path.append(self.current)
        self.delta_q_total = 0.0
        self.list_delta_q = [0]
        self.converged = False

    def get_random_action(self) -> int:
        return int(random.random() * len(self.current.edges))

    def random_policy(self) -> int:
        return int(self.get_random_action())

    def greedy_policy(self) -> int:
        # Has a chance of EPSILON to exploit
        if random.random() > EPSILON:
            if self.current.get_bigger_q_action() != DEFAULT_Q:
                return self.current.get_best_action_index()
        # Otherwise, explore
        return self.get_random_action()

    def greater_policy(self) -> int:
        return self.current.get_best_action_index()

    def reset_agent(self) -> None:
        random_vertex = self.graph.get_vertex_by_id(
            str(int(random.random() * len(self.graph.vertices))))

        self.current = random_vertex
        self.path.clear()
        self.path.append(self.current)

    def verify_convergence(self) -> bool:
        if is_converged(self.list_delta_q):
            self.converged = True
            return True
        return False

    def train(self) -> None:
        while not self.converged:
            while self.current != self.graph.goal:
                self.move()

            self.reset_agent()


class QLearningAgent(Agent):

    def __init__(
        self,
        graph: Graph,
    ) -> None:
        super().__init__(graph)

    def update_q_value(self, next_vertex) -> None:
        has_change = False

        for edge in self.current.edges:
            if edge.end == next_vertex:
                normalized_distance = get_normalized_distance(
                    edge.distance, self.graph.min_distance,
                    self.graph.max_distance)

                delta_q = get_delta_q(edge.q, next_vertex.r,
                                      next_vertex.get_bigger_q_action(),
                                      normalized_distance)
                self.delta_q_total += delta_q
                edge.q = edge.q + delta_q
                if delta_q != 0:
                    has_change = True

        if has_change:
            self.list_delta_q.append(self.delta_q_total)

        self.epoch += 1
        if self.epoch % 5000 == 0:
            if is_converged(self.list_delta_q):
                self.converged = True
                # save_delta_q_list(self.list_delta_q)
                # generate_plot(self.list_delta_q)

    def move(self) -> None:
        action_generated = self.greedy_policy()
        chosen_vertex = self.current.edges[action_generated].end

        self.update_q_value(next_vertex=chosen_vertex)

        self.current = chosen_vertex
        self.path.append(self.current)


class SarsaAgent(Agent):

    def __init__(self, graph: Graph) -> None:
        super().__init__(graph)

    def update_q_value(self, next_vertex) -> None:
        has_change = False

        for edge in self.current.edges:
            if edge.end == next_vertex:

                old_current = self.current
                self.current = next_vertex
                next_action = self.greedy_policy()
                self.current = old_current

                next_edge = next_vertex.edges[next_action]

                normalized_distance = get_normalized_distance(
                    edge.distance, self.graph.min_distance,
                    self.graph.max_distance)

                delta_q = get_delta_q_sarsa(edge.q, next_vertex.r, next_edge.q,
                                            normalized_distance)
                self.delta_q_total += delta_q
                edge.q = edge.q + delta_q
                if delta_q != 0:
                    has_change = True

        if has_change:
            self.list_delta_q.append(self.delta_q_total)

        self.epoch += 1

        if self.epoch == 500000:
            self.converged = True
            # save_delta_q_list(self.list_delta_q)
            # generate_plot(self.list_delta_q)

    def move(self) -> None:
        next_action = self.greedy_policy()
        next_vertex = self.current.edges[next_action].end

        self.update_q_value(next_vertex)

        self.current = next_vertex
        self.path.append(self.current)


def print_graph(g: Graph) -> None:
    for vertex in g.get_all_vertices():
        print(vertex)
        for edge in vertex.edges:
            print(f"\t{edge}")
        print("")


def save_table_q(g: Graph, file_name: str = "table_q.csv") -> None:
    if not os.path.exists("table_q"):
        os.mkdir("table_q")

    if file_name in os.listdir("table_q"):
        os.remove(f"table_q/{file_name}")
        # print(f"File {file_name} already exists. It was removed.")
    _file = open(f"table_q/{file_name}", "w", encoding="utf-8")

    # filter just the biggest q for each edge
    for vertex in g.get_all_vertices():
        bigger_q = DEFAULT_Q
        start = vertex
        end = vertex
        for edge in vertex.edges:
            if edge.q > bigger_q:
                bigger_q = edge.q
                start = edge.start
                end = edge.end

        _file.write(f"{start.id},{end.id}\n")
    _file.close()


# create table q for every vertex
def full_run(algorithm: Agent):
    g = Graph()
    g.read_csv()
    all_vertex = g.get_all_vertices()
    for vertex in all_vertex:
        print(
            f"{int(all_vertex.index(vertex) / len(all_vertex) * 100)}% - Running for vertex {vertex.name} - {vertex.id + 1} of {len(all_vertex)} "
        )
        g = Graph()
        g.read_csv()
        start_vertex = g.get_vertex_by_id(1)
        g.set_start(start_vertex)
        goal_vertex = g.get_vertex_by_id(vertex.id)
        g.set_goal(goal_vertex=goal_vertex)
        g.define_reward(10, g.goal)

        a = algorithm(g)
        a.train()

        save_table_q(g, file_name=f"table_q_{vertex.id}.csv")



# create table_q.csv for only one vertex
def single_run(start_id, goal_id, algorithm: Agent):
    g = Graph()
    g.read_csv()
    start_vertex = g.get_vertex_by_id(start_id)
    g.set_start(start_vertex)
    goal_vertex = g.get_vertex_by_id(goal_id)
    g.set_goal(goal_vertex)
    g.define_reward(10.0, g.goal)

    a = algorithm(g)

    a.train()

    save_table_q(g, file_name=f"table_q_{goal_id}.csv")

    path = a.generate_path_interest(start_id=start_id, categories=["Tech"])
    save_path([vertex.id for vertex in path])

