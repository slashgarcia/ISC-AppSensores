import 'dart:convert';

TemperaturaValue temperaturaValueFromJson(String str) =>
    TemperaturaValue.fromJson(json.decode(str));

String temperaturaValueToJson(TemperaturaValue data) =>
    json.encode(data.toJson());

class TemperaturaValue {
  TemperaturaValue({
    this.id,
    this.value,
  });

  int id;
  String value;

  factory TemperaturaValue.fromJson(Map<String, dynamic> json) =>
      TemperaturaValue(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
