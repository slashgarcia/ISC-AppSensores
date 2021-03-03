import 'dart:convert';

AlcoholValue alcoholValueFromJson(String str) =>
    AlcoholValue.fromJson(json.decode(str));

String alcoholValueToJson(AlcoholValue data) => json.encode(data.toJson());

class AlcoholValue {
  AlcoholValue({
    this.id,
    this.value,
  });

  int id;
  String value;

  factory AlcoholValue.fromJson(Map<String, dynamic> json) => AlcoholValue(
        id: json["id"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
      };
}
