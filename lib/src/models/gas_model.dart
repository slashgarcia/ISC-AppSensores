import 'dart:convert';

GasValue gasValueFromJson(String str) => GasValue.fromJson(json.decode(str));

String gasValueToJson(GasValue data) => json.encode(data.toJson());

class GasValue {
  GasValue({
    this.id,
    this.value,
  });

  int id;
  String value;

  factory GasValue.fromJson(Map<String, dynamic> json) => GasValue(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
