import 'dart:convert';

ValoresModel valoresModelFromJson(String str) =>
    ValoresModel.fromJson(json.decode(str));

String valoresModelToJson(ValoresModel data) => json.encode(data.toJson());

class ValoresModel {
  ValoresModel({
    this.idValores,
    this.temperatura,
    this.alcohol,
    this.agua,
    this.presencia,
    this.gas,
  });

  int idValores;
  String temperatura;
  String alcohol;
  String agua;
  String presencia;
  String gas;

  factory ValoresModel.fromJson(Map<String, dynamic> json) => ValoresModel(
        idValores: json["id_valores"],
        temperatura: json["temperatura"],
        alcohol: json["alcohol"],
        agua: json["agua"],
        presencia: json["presencia"],
        gas: json["gas"],
      );

  Map<String, dynamic> toJson() => {
        "id_valores": idValores,
        "temperatura": temperatura,
        "alcohol": alcohol,
        "agua": agua,
        "presencia": presencia,
        "gas": gas,
      };
}
