// To parse this JSON data, do
//
//     final carBrand = carBrandFromJson(jsonString);

import 'dart:convert';

CarBrand carBrandFromJson(String str) => CarBrand.fromJson(json.decode(str));

String carBrandToJson(CarBrand data) => json.encode(data.toJson());

class CarBrand {
  CarBrand({this.logo, this.name, this.model, this.desc});

  String? logo;
  String? name;
  int? model;
  String? desc;

  factory CarBrand.fromJson(Map<String, dynamic> json) => CarBrand(
      logo: json["logo"],
      name: json["name"],
      model: json["model"],
      desc: json["desc"]);

  Map<String, dynamic> toJson() =>
      {"logo": logo, "name": name, "model": model, "desc": desc};
}
