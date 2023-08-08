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
    String baseUrl = "http://168.75.83.4:1234";
    String url;
    url = baseUrl;
    url += "/path";
    url += "/" + userOptions.estabelecimentoPartida.id.toString();
    url += "/" + userOptions.estabelecimentoChegada.id.toString();
    url += "/" + userOptions.algoritmo;
    if (userOptions.interesses.length > 0) {
      url += "?max_interests=" +
          userOptions.quantidade_interesses.toString() +
          "&interests=" +
          userOptions.interesses.join(",");
    }
    
    print(url);
    Response response = await dio.get(url);
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
