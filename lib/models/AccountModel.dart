// To parse this JSON data, do
//
//     final accountModel = accountModelFromJson(jsonString);

import 'dart:convert';

AccountModel accountModelFromJson(String str) =>
    AccountModel.fromJson(json.decode(str));

String accountModelToJson(AccountModel data) => json.encode(data.toJson());

class AccountModel {
  AccountModel({
    required this.email,
    required this.password,
    required this.name,
    required this.image,
  });

  String email;
  String password;
  String name;
  String image;

  factory AccountModel.fromJson(Map<String, dynamic> json) => AccountModel(
        email: json["email"],
        password: json["password"],
        name: json["name"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "name": name,
        "image": image,
      };
}
