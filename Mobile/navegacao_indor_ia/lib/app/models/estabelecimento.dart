class Estabelecimento {
  final int id;
  String name;
  final int bias;
  final int isCross;
  final String category;
  final int poxX;
  final int poxY;

  Estabelecimento({
    required this.id,
    required this.name,
    required this.bias,
    required this.isCross,
    required this.category,
    required this.poxX,
    required this.poxY,
  });

  factory Estabelecimento.fromJson(Map<String, dynamic> json) {
    return Estabelecimento(
      id: json['id'],
      name: json['name'],
      bias: json['bias'],
      isCross: json['is_cross'],
      category: json['category'],
      poxX: json['pox_x'],
      poxY: json['pox_y'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['bias'] = bias;
    map['is_cross'] = isCross;
    map['category'] = category;
    map['pox_x'] = poxX;
    map['pox_y'] = poxY;
    return map;
  }
}
