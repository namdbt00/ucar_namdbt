// To parse this JSON data, do
//
//     final carBrand = carBrandFromJson(jsonString);

import 'dart:convert';

CarType carTypeFromJson(String str) => CarType.fromJson(json.decode(str));

String carTypeToJson(CarType data) => json.encode(data.toJson());

class CarType {
  CarType({this.logo, this.name});

  String? logo;
  String? name;

  factory CarType.fromJson(Map<String, dynamic> json) => CarType(
        logo: json["logo"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {"logo": logo, "name": name};
}
