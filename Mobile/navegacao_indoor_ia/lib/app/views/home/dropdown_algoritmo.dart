import 'package:flutter/material.dart';

import '../../models/user_options.dart';
import '../../shared/colors.dart';

class DropdownAlgoritmo extends StatefulWidget {
  final UserOptions userOptions;
  final List<String> listAlgoritmo;
  final String title;

  const DropdownAlgoritmo(
      {required this.userOptions,
      required this.listAlgoritmo,
      required this.title,
      super.key});

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
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: RichText(
            text: TextSpan(
              text: widget.title,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              children: const <TextSpan>[
                TextSpan(
                    text: ' *',
                    style: TextStyle(
                        color: Colors.red,
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
        SizedBox(height: size.height * 0.005),
        Container(
          height: 30,
          width: size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              border: Border.all(color: defaultColor)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
              value: widget.userOptions.algoritmo,
              icon: const Icon(Icons.arrow_drop_down,
                  size: 30, color: Colors.black),
              iconSize: 24,
              elevation: 16,
              isExpanded: true,
              style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
              underline: Container(),
              onChanged: (String? newValue) => setState(() {
                widget.userOptions.setAlgoritmo(newValue!);
              }),
              items: widget.listAlgoritmo
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: const TextStyle(
                          fontFamily: 'Poppins', color: Colors.black)),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
