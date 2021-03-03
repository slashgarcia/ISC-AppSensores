import 'dart:convert';

PresenciaValue presenciaValueFromJson(String str) =>
    PresenciaValue.fromJson(json.decode(str));

String presenciaValueToJson(PresenciaValue data) => json.encode(data.toJson());

class PresenciaValue {
  PresenciaValue({
    this.id,
    this.value,
  });

  int id;
  String value;

  factory PresenciaValue.fromJson(Map<String, dynamic> json) => PresenciaValue(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
