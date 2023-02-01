import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jflap_extractor/models/state_model.dart';
import 'package:xml/xml.dart';

import 'models/transition_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _incrementCounter() {
    final file = File('assets/salvo.jff');
    final document = XmlDocument.parse(file.readAsStringSync());
    List<XmlElement> extractedStates = document.findAllElements('state').toList();
    List<XmlElement> extractedTransitions = document.findAllElements('transition').toList();

    List<StateModel> statesConverteds = extractedStates.map((e) => StateModel(element: e)).toList();
    List<TransitionModel> transitionsConverteds = extractedTransitions.map((e) => TransitionModel(element: e)).toList();

    print(statesConverteds);
    print(transitionsConverteds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
