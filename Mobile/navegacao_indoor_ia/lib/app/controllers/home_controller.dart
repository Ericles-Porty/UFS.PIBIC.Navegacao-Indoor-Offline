import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../models/estabelecimento.dart';
import '../models/user_options.dart';

class HomeController extends ChangeNotifier {
  final Dio dio = Dio();
  late UserOptions userOptions;
  final List<Estabelecimento> listEstabelecimento;
  final List<String> listAlgoritmo = [
    "QLearning",
    "Sarsa",
    "A*",
    "Largura",
    "Profundidade"
  ];

  HomeController({required this.listEstabelecimento}) {
    userOptions = UserOptions(
        estabelecimentoPartida:
            listEstabelecimento.firstWhere((element) => element.id == 0),
        estabelecimentoChegada: listEstabelecimento.last,
        algoritmo: listAlgoritmo.first,
        interesses: [],
        quantidade_interesses: 0);
  }
//https://graph-with-q-learning.ericles-porty.repl.co/path/1/2/QLearning?max_interests=0&interests=aa
  void getPath() async {
    String baseUrl = "https://graph-with-q-learning.ericles-porty.repl.co";

    Response response = await dio.get( baseUrl + "/path/" + userOptions.estabelecimentoPartida.id.toString() + "/" + userOptions.estabelecimentoChegada.id.toString() + "/" + userOptions.algoritmo, queryParameters: {"max_interests": userOptions.quantidade_interesses, "interests": userOptions.interesses.join(",")});
    print(response.data);
  }

  void setInterest(String interest) {
    userOptions.interesses.contains(interest)
        ? userOptions.interesses.remove(interest)
        : userOptions.interesses.add(interest);
    notifyListeners();
  }

  void setQuantidade(int quantidade) {
    userOptions.quantidade_interesses = quantidade;
    notifyListeners();
  }
}
