// To parse this JSON data, do
//
//     final carBrand = carBrandFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({this.image, this.name, this.author, this.date});

  String? image;
  String? name;
  String? author;
  String? date;

  factory News.fromJson(Map<String, dynamic> json) => News(
        image: json["image"],
        name: json["name"],
        author: json["author"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "name": name,
        "price": author,
        "date": date,
      };
}
