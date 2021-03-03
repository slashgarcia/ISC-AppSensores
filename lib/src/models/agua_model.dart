import 'dart:convert';

AguaValue aguaValueFromJson(String str) => AguaValue.fromJson(json.decode(str));

String aguaValueToJson(AguaValue data) => json.encode(data.toJson());

class AguaValue {
  AguaValue({
    this.id,
    this.value,
  });

  int id;
  String value;

  factory AguaValue.fromJson(Map<String, dynamic> json) => AguaValue(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
