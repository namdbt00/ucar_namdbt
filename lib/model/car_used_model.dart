// To parse this JSON data, do
//
//     final carBrand = carBrandFromJson(jsonString);

import 'dart:convert';

CarUsed carUsedFromJson(String str) => CarUsed.fromJson(json.decode(str));

String carUsedToJson(CarUsed data) => json.encode(data.toJson());

class CarUsed {
  CarUsed(
      {this.image,
      this.name,
      this.price,
      this.date,
      this.kmUsed,
      this.installment});

  String? image;
  String? name;
  String? price;
  String? date;
  String? kmUsed;
  String? installment;

  factory CarUsed.fromJson(Map<String, dynamic> json) => CarUsed(
        image: json["image"],
        name: json["name"],
        price: json["price"],
        date: json["date"],
        kmUsed: json["kmUsed"],
        installment: json["installment"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "price": price,
        "date": date,
        "kmUsed": kmUsed,
        "installment": installment
      };
}
