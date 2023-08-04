import 'package:flutter/material.dart';

import '../../models/user_options.dart';
import '../../shared/colors.dart';

class DropdownAlgoritmo extends StatefulWidget {
  final UserOptions userOptions;
  final String title;

  const DropdownAlgoritmo({required this.userOptions, required this.title, super.key});

  @override
  State<DropdownAlgoritmo> createState() => _DropdownAlgoritmoState();
}

class _DropdownAlgoritmoState extends State<DropdownAlgoritmo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Text(widget.title, style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600)),
        ),
        Container(
          height: 50,
          width: size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, border: Border.all(color: defaultColor)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: widget.userOptions.algoritmo,
              icon: const Icon(Icons.arrow_drop_down,size: 30,color: Colors.black),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),
              underline: Container(),
              onChanged: (String? newValue) => setState(() {
                widget.userOptions.setAlgoritmo(newValue!);
              }),
              items: ["Q-Learning", "Op2"].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: const TextStyle(color: Colors.black)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
