import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:navegacao_indor_ia/app/controllers/home_controller.dart';
import 'package:navegacao_indor_ia/app/models/user_options.dart';
import 'package:navegacao_indor_ia/app/views/home/dropdown_local_final.dart';

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
    List<Estabelecimento> listEstabelecimento = result.map((e) => Estabelecimento.fromJson(e)).toList();
    listEstabelecimento.removeWhere((element) => element.name == "#");
    listEstabelecimento.sort((a, b) => a.name.compareTo(b.name));

    controller = HomeController(listEstabelecimento: listEstabelecimento);
  }

  List<String> listInteresses = ["TECNOLOGIA", "COMIDA", "MODA", "MERCADO", "AUTOMÓVEIS", "BEBIDA", "ACADEMIA", "JOGOS"];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) => Scaffold(
        appBar: AppBar(
          backgroundColor: defaultColor,
          title: const Text('Navegação indoor', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: const [CircleAvatar(child: Icon(Icons.question_mark)), SizedBox(width: 10)],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                defaultSpace(),
                Text("PREENCHA OS CAMPOS ABAIXO PARA COMEÇAR A NAVEGAR",
                    textAlign: TextAlign.center, style: TextStyle(color: defaultColor, fontSize: 15, fontWeight: FontWeight.w600)),
                defaultSpace(),
                DropdownLocalPartida(
                  title: "Onde você está?*",
                  listEstabelecimento: controller.listEstabelecimento,
                  userOptions: controller.userOptions,
                ),
                defaultSpace(),
                DropdownLocalFinal(
                  title: "Para onde você quer ir?*",
                  listEstabelecimento: controller.listEstabelecimento,
                  userOptions: controller.userOptions,
                ),
                defaultSpace(),
                DropdownAlgoritmo(
                  title: "Selecione um algoritmo de busca*",
                  userOptions: controller.userOptions,
                ),
                defaultSpace(),
                Divider(color: defaultColor, thickness: 3),
                defaultSpace(),
                const Text(
                  "SELECIONE AS CATEGORIAS QUE VOCÊ TEM INTERESSE DE VISITAR (OPCIONAL)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                defaultSpace(),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 4.4 / 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                  itemCount: listInteresses.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => controller.setInterest(listInteresses[index]),
                      child: Container(
                        decoration: BoxDecoration(
                            color: controller.userOptions.interesses.contains(listInteresses[index]) ? defaultColor : const Color(0xFF92D8FF),
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: defaultColor, width: 2)),
                        child: Center(
                          child: Text(listInteresses[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: controller.userOptions.interesses.contains(listInteresses[index]) ? Colors.white : Colors.black, fontSize: 13, fontWeight: FontWeight.w500)),
                        ),
                      ),
                    );
                  },
                ),
                defaultSpace(),
                const Text(
                  "POR QUANTOS LOCAIS DE INTERESSE VOCÊ DESEJA PASSAR ANTES DE CHEGAR AO DESTINO?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                defaultSpace(),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) => controller.setQuantidade(int.tryParse(value) ?? 0),
                  decoration: InputDecoration(
                    labelText: 'Quantidade',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: defaultColor, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                defaultSpace(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
