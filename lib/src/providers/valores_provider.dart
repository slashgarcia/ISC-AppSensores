import 'package:flutter/material.dart';
import 'package:sist_prog_app/src/models/valores_model.dart';

import 'package:sist_prog_app/src/utility/api.dart';
import 'package:sist_prog_app/src/models/temperatura_model.dart';
import 'package:sist_prog_app/src/models/alcohol_model.dart';
import 'package:sist_prog_app/src/models/agua_model.dart';
import 'package:sist_prog_app/src/models/presencia_model.dart';
import 'package:sist_prog_app/src/models/gas_model.dart';

import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class ValoresProvider extends ChangeNotifier {
  var temperaturaModel = BehaviorSubject<TemperaturaValue>();
  var alcoholModel = BehaviorSubject<AlcoholValue>();
  var aguaModel = BehaviorSubject<AguaValue>();
  var presenciaModel = BehaviorSubject<PresenciaValue>();
  var gasModel = BehaviorSubject<GasValue>();
  var valoresModel = BehaviorSubject<ValoresModel>();

  ValoresProvider() {
    getTemperaturaValue();
    getAlcoholValue();
    getAguaValue();
    getValues();
    // getTemperaturaValue();
    // getTemperaturaValue();
  }

  getTemperaturaValue() async {
    print("Haciendo petición a la API");
    final request = await http.get("http://192.168.1.202:3000/temperatura/get");
    TemperaturaValue temperaturaValue = temperaturaValueFromJson(request.body);
    temperaturaModel.sink.add(temperaturaValue);
  }

  getAlcoholValue() async {
    print("Haciendo petición a la API");
    final request = await http.get("http://192.168.1.202:3000/alcohol/get");
    AlcoholValue alcoholValue = alcoholValueFromJson(request.body);
    alcoholModel.sink.add(alcoholValue);
  }

  getAguaValue() async {
    print("Haciendo petición a la API");
    final request = await http.get("http://192.168.1.202:3000/agua/get");
    AguaValue aguaValue = aguaValueFromJson(request.body);
    aguaModel.sink.add(aguaValue);
  }

  getPresenciaValue() async {
    print("Haciendo petición a la API");
    final request = await http.get("http://192.168.1.202:3000/presencia/get");
    PresenciaValue presenciaValue = presenciaValueFromJson(request.body);
    presenciaModel.sink.add(presenciaValue);
  }

  getGasValue() async {
    print("Haciendo petición a la API");
    final request = await http.get("http://192.168.1.202:3000/gas/get");
    GasValue gasValue = gasValueFromJson(request.body);
    gasModel.sink.add(gasValue);
  }

  getValues() async {
    print("Haciendo la petición a la API");
    final request = await http.get("http://192.168.1.202:3000/valores/get");
    ValoresModel valores = valoresModelFromJson(request.body);
    valoresModel.sink.add(valores);
  }

  close() {
    temperaturaModel.close();
    alcoholModel.close();
    aguaModel.close();
    presenciaModel.close();
    gasModel.close();
  }
}
