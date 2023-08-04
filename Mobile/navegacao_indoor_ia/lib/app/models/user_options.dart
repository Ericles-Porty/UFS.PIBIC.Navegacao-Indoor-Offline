import 'estabelecimento.dart';

class UserOptions{
  Estabelecimento estabelecimentoPartida;
  Estabelecimento estabelecimentoChegada;
  String algoritmo;
  List<String> interesses;
  int quantidade_interesses;


  UserOptions({required this.estabelecimentoPartida,required this.estabelecimentoChegada, required this.algoritmo, required this.interesses, required this.quantidade_interesses});

  void setEstabelecimentoPartida(Estabelecimento estabelecimento){
    estabelecimentoPartida = estabelecimento;
  }

  void setEstabelecimentoChegada(Estabelecimento estabelecimento){
    estabelecimentoChegada = estabelecimento;
  }

  void setAlgoritmo(String algoritmo){
    algoritmo = algoritmo;
  }
}