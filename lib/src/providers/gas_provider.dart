import 'package:flutter/material.dart';

import 'package:sist_prog_app/src/utility/api.dart';
import 'package:sist_prog_app/src/models/gas_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class GasProvider extends ChangeNotifier {
  var gasModel = BehaviorSubject<GasValue>();

  getGasValue() async {
    print("Haciendo petición a la API");
    final request = await http.get(API.gasValue);
    GasValue gasValue = gasValueFromJson(request.body);
    gasModel.sink.add(gasValue);
  }

  close() {
    gasModel.close();
  }
}
