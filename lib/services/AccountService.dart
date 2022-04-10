// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'package:http/http.dart' as http;

import '../database/client.dart';
import '../models/AccountModel.dart';

Future<AccountModel> Login(String email, String password) async {
  final String url = Host + "/api/account/" + email + "/" + password;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return AccountModel.fromJson(jsonDecode(response.body));
}

Future<dynamic> Register(
    String email, String password, String name, String imageURL) async {
  try {
    final String Url = Host + "/api/account";
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
        "name": name,
        "image": imageURL
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    String data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}
