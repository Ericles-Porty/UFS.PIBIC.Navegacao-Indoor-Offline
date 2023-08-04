import 'package:flutter/material.dart';

import '../models/estabelecimento.dart';
import '../models/user_options.dart';

class HomeController extends ChangeNotifier {
  late UserOptions userOptions;
  final List<Estabelecimento> listEstabelecimento;
  final List<String> listAlgoritmo = ["QLearning", "Sarsa","A*", "Largura", "Profundidade"];

  HomeController({required this.listEstabelecimento}) {
    userOptions = UserOptions(
        estabelecimentoPartida: listEstabelecimento.firstWhere((element) => element.id == 0),
        estabelecimentoChegada: listEstabelecimento.last,
        algoritmo: listAlgoritmo.first,
        interesses: [],
        quantidade_interesses: 0);
  }

  void setInterest(String interest) {
    userOptions.interesses.contains(interest) ? userOptions.interesses.remove(interest) : userOptions.interesses.add(interest);
    notifyListeners();
  }

  void setQuantidade(int quantidade) {
    userOptions.quantidade_interesses = quantidade;
    notifyListeners();
  }
}
