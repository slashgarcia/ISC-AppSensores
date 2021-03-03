import 'package:flutter/material.dart';

import 'package:sist_prog_app/src/utility/api.dart';
import 'package:sist_prog_app/src/models/alcohol_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class AlcoholProvider extends ChangeNotifier {
  var alcoholModel = BehaviorSubject<AlcoholValue>();

  getTemperaturaValue() async {
    print("Haciendo petición a la API");
    final request = await http.get(API.alcoholValue);
    AlcoholValue alcoholValue = alcoholValueFromJson(request.body);
    alcoholModel.sink.add(alcoholValue);
  }

  close() {
    alcoholModel.close();
  }
}
