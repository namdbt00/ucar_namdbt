// To parse this JSON data, do
//
//     final carBrand = carBrandFromJson(jsonString);

import 'dart:convert';

CarNew carNewFromJson(String str) => CarNew.fromJson(json.decode(str));

String carNewToJson(CarNew data) => json.encode(data.toJson());

class CarNew {
  CarNew({this.image, this.name, this.price});

  String? image;
  String? name;
  String? price;

  factory CarNew.fromJson(Map<String, dynamic> json) => CarNew(
        image: json["image"],
        name: json["name"],
        price: json["price"]
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "price": price
      };
}
