import 'package:flutter/material.dart';

import 'package:sist_prog_app/src/utility/api.dart';
import 'package:sist_prog_app/src/models/presencia_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class PresenciaProvider extends ChangeNotifier {
  var presenciaModel = BehaviorSubject<PresenciaValue>();

  getPresenciaValue() async {
    print("Haciendo petición a la API");
    final request = await http.get(API.presenciaValue);
    PresenciaValue presenciaValue = presenciaValueFromJson(request.body);
    presenciaModel.sink.add(presenciaValue);
  }

  close() {
    presenciaModel.close();
  }
}
