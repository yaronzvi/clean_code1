import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';

Future<dynamic> loadJsonData() async {
  List data;
  var jsonText = await rootBundle.loadString('lib/core/assets/rest_list3.json');
  data = json.decode(jsonText);
  return data;
}
