import 'package:xml/xml.dart';

class StateModel{
  late String id;
  late String name;
  late double x;
  late double y;
  late String? label;
  late bool? initial;

  StateModel({required XmlElement element}){
    id = element.getAttribute('id')??'';
    name = element.getAttribute('name')??'';
    x = double.parse(element.findElements('x').first.text);
    y = double.parse(element.findElements('y').first.text);
    label = element.findElements('label').first.text;
    initial = element.findElements('initial').isNotEmpty ? true : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['x'] = x;
    data['y'] = y;
    data['label'] = label;
    data['initial'] = initial;
    return data;
  }
}