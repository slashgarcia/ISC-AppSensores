import 'package:flutter/material.dart';

import 'package:sist_prog_app/src/utility/api.dart';
import 'package:sist_prog_app/src/models/temperatura_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class TemperaturaProvider extends ChangeNotifier {
  var temperaturaModel = BehaviorSubject<TemperaturaValue>();

  getTemperaturaValue() async {
    print("Haciendo petición a la API");
    final request = await http.get(API.temperaturaValue);
    TemperaturaValue temperaturaValue = temperaturaValueFromJson(request.body);
    temperaturaModel.sink.add(temperaturaValue);
  }

  close() {
    temperaturaModel.close();
  }
}
