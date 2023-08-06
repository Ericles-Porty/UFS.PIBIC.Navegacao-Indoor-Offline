import 'package:flutter/material.dart';
import 'package:navegacao_indoor_ia/app/models/user_options.dart';

import '../../models/estabelecimento.dart';
import '../../shared/colors.dart';
import '../../shared/mock/locals.dart';

class Navigation extends StatefulWidget {
  final UserOptions userOptions;
  final List<Estabelecimento> listaEstabelecimentos;

  const Navigation({super.key, required this.listaEstabelecimentos, required this.userOptions});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _counter = 0;

  TextStyle defaultTextStyle = const TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF1A41A7));

  void _incrementCounter() {
    setState(() {
      if (_counter < route.length - 2) {
        _counter++;
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(title: Text("VOCÊ CHEGOU AO DESTINO!!", style: defaultTextStyle.copyWith(color: Colors.white)),
            backgroundColor: const Color(0xFF555D73),
            content: const Text(
              'DESEJA GERAR NOVA\nROTA DE NAVEGAÇÃO?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 17),
            ),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: <Widget>[
              Container(
                width: 70,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: const Color(0xFF92D7FF)),
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('NÃO', style: TextStyle(color: defaultColor, fontWeight: FontWeight.w500)),
                ),
              ),
              Container(
                width: 70,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: defaultColor),
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: const Text('SIM', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        );
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.keyboard_arrow_left, color: Colors.white)),
        title: const Text("NAVEGAÇÃO INDOOR", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
        centerTitle: true,
        backgroundColor: defaultColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Navegação', style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: defaultColor)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(widget.userOptions.estabelecimentoPartida.name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: defaultColor)),
                          Icon(Icons.arrow_forward_outlined, size: 20, weight: 1, color: defaultColor),
                          Text(widget.userOptions.estabelecimentoChegada.name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15, color: defaultColor)),
                        ],
                      )
                    ],
                  ),
                  Text('Passo: ${_counter + 1} / ${route.length} ', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text("VOCÊ ESTÁ EM ", style: defaultTextStyle),
                    Text(widget.listaEstabelecimentos[route[_counter]].name != "#" ? widget.listaEstabelecimentos[route[_counter]].name : "Encruzilhada",
                        style: defaultTextStyle.copyWith(color: Colors.black))
                  ]),
                  Text('VÁ EM DIREÇÃO A', style: defaultTextStyle),
                ],
              ),
            ),
            Text(
              widget.listaEstabelecimentos[route[_counter + 1]].name != "#" ? widget.listaEstabelecimentos[route[_counter + 1]].name : "Encruzilhada",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            Container(
              height: size.height * 0.3,
              child: Column(
                children: [
                  Text("CHEGOU NO LOCAL ACIMA?", style: TextStyle(color: defaultColor, fontWeight: FontWeight.w300, fontSize: 23)),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: size.height * 0.07,
                    width: size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () => _incrementCounter(),
                      style: ElevatedButton.styleFrom(
                        shadowColor: defaultColor,
                        elevation: 6,
                        backgroundColor: defaultColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "PRÓXIMO",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Poppins',
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                            size: 35,
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: size.height * 0.05,
                    width: 230,
                    child: _counter > 0
                        ? ElevatedButton(
                            onPressed: () => _decrementCounter(),
                            style: ElevatedButton.styleFrom(
                              shadowColor: defaultColor,
                              elevation: 6,
                              backgroundColor: Colors.lightBlueAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  Icons.arrow_back,
                                  color: Color(0xFF1A41A7),
                                  size: 25,
                                ),
                                Text(
                                  "LUGAR ANTERIOR",
                                  style: TextStyle(
                                    color: defaultColor,
                                    fontFamily: 'Poppins',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          "ESTOU PERDIDO",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15, decoration: TextDecoration.underline, color: defaultColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
