import 'package:flutter/material.dart';

import 'package:sist_prog_app/src/utility/api.dart';
import 'package:sist_prog_app/src/models/agua_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;

class AguaProvider extends ChangeNotifier {
  var aguaModel = BehaviorSubject<AguaValue>();

  getAguaValue() async {
    print("Haciendo petición a la API");
    final request = await http.get(API.aguaValue);
    AguaValue aguaValue = aguaValueFromJson(request.body);
    aguaModel.sink.add(aguaValue);
  }

  close() {
    aguaModel.close();
  }
}
