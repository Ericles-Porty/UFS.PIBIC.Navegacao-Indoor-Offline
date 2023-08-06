class Estabelecimento {
  final int id;
  String name;
  final String category;
  final int poxX;
  final int poxY;

  Estabelecimento({
    required this.id,
    required this.name,
    required this.category,
    required this.poxX,
    required this.poxY,
  });

  factory Estabelecimento.fromJson(Map<String, dynamic> json) {
    return Estabelecimento(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      poxX: json['pos_x'],
      poxY: json['pos_y'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['category'] = category;
    map['pos_x'] = poxX;
    map['pos_y'] = poxY;
    return map;
  }
}
