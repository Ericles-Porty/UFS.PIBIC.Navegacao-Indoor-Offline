import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:navegacao_indoor_ia/app/controllers/home_controller.dart';
import 'package:navegacao_indoor_ia/app/views/home/dropdown_local_final.dart';

import '../../models/estabelecimento.dart';
import '../../shared/colors.dart';
import '../../shared/mock/locals.dart';
import '../../shared/widget/default_space.dart';
import 'dropdown_algoritmo.dart';
import 'dropdown_local_partida.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late HomeController controller;

  @override
  void initState() {
    super.initState();
    List<dynamic> result = json.decode(jsonStateList);
    List<Estabelecimento> listEstabelecimento =
        result.map((e) => Estabelecimento.fromJson(e)).toList();
    listEstabelecimento.removeWhere((element) => element.name == "#");
    listEstabelecimento.sort((a, b) => a.name.compareTo(b.name));

    controller = HomeController(listEstabelecimento: listEstabelecimento);
  }

  List<String> listInteresses = [
    "TECNOLOGIA",
    "COMIDA",
    "MODA",
    "MERCADO",
    "AUTOMÓVEIS",
    "BEBIDA",
    "ACADEMIA",
    "JOGOS"
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) => Scaffold(
        appBar: AppBar(
          backgroundColor: defaultColor,
          title: const Text(
            'NAVEGAÇÃO INDOOR',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
          centerTitle: true,
          actions: [
            CircleAvatar(
                backgroundColor: defaultColor,
                child: const Icon(
                  Icons.question_mark_rounded,
                  color: Colors.white,
                )),
            const SizedBox(width: 10)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              children: [
                defaultSpace(),
                Text("PREENCHA OS CAMPOS ABAIXO PARA COMEÇAR A NAVEGAR",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: defaultColor,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
                defaultSpace(),
                DropdownLocalPartida(
                  title: "ONDE VOCÊ ESTÁ?",
                  listEstabelecimento: controller.listEstabelecimento,
                  userOptions: controller.userOptions,
                ),
                defaultSpace(),
                DropdownLocalFinal(
                  title: "PARA ONDE VOCÊ VAI?",
                  listEstabelecimento: controller.listEstabelecimento,
                  userOptions: controller.userOptions,
                ),
                defaultSpace(),
                DropdownAlgoritmo(
                  title: "QUAL ALGORITMO DESEJA UTILIZAR?",
                  listAlgoritmo: controller.listAlgoritmo,
                  userOptions: controller.userOptions,
                ),
                defaultSpace(),
                Divider(color: defaultColor, thickness: 3),
                defaultSpace(),
                const Text(
                  "SELECIONE AS CATEGORIAS QUE VOCÊ TEM INTERESSE DE VISITAR (OPCIONAL)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                defaultSpace(),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 4.4 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: listInteresses.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () =>
                          controller.setInterest(listInteresses[index]),
                      child: Container(
                        decoration: BoxDecoration(
                            color: controller.userOptions.interesses
                                    .contains(listInteresses[index])
                                ? defaultColor
                                : const Color(0xFF92D8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: defaultColor, width: 2)),
                        child: Center(
                          child: Text(listInteresses[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: controller.userOptions.interesses
                                          .contains(listInteresses[index])
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                    );
                  },
                ),
                defaultSpace(),
                const Text(
                  "POR QUANTOS LOCAIS DE INTERESSE VOCÊ DESEJA PASSAR ANTES DE CHEGAR AO DESTINO?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
                defaultSpace(),
                SizedBox(
                  height: size.height * 0.05,
                  child: TextFormField(
                    cursorHeight: size.height * 0.025,
                    keyboardType: TextInputType.number,
                    onChanged: (value) =>
                        controller.setQuantidade(int.tryParse(value) ?? 0),
                    decoration: InputDecoration(
                      labelText: 'Quantidade',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: defaultColor, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                defaultSpace(),
                defaultSpace(),
                SizedBox(
                  
                  height: size.height * 0.05,
                  width: size.width * 0.5,
                  child: ElevatedButton(
                    
                    onPressed: () => {},
                    style: ElevatedButton.styleFrom(
                      shadowColor: defaultColor,
                      elevation: 6,
                      backgroundColor: defaultColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      "INICIAR TRAJETO",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                defaultSpace(),
                defaultSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
