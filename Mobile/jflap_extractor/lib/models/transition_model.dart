import 'package:xml/xml.dart';

class TransitionModel {
  late int from;
  late int to;
  late String read;

  TransitionModel({required XmlElement element}) {
    from = int.parse(element.findElements('from').first.text);
    to = int.parse(element.findElements('to').first.text);
    read = element.findElements('read').first.text;
  }

  Map<String, dynamic> toJson() => {
        "from": from,
        "to": to,
        "read": read,
      };
}
