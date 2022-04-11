// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../database/client.dart';
import '../models/AccountModel.dart';

Future<AccountModel> LoginService(String email, String password) async {
  final String url = Host + "/api/account/" + email + "/" + password;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return AccountModel.fromJson(jsonDecode(response.body));
}

Future<dynamic> RegisterService(
    String email, String password, String name, File imageURL) async {
  try {
    final String Url = Host + "/api/account";

    var request = http.MultipartRequest('POST', Uri.parse(Url));
    request.files.add(await http.MultipartFile.fromPath('img', imageURL.path));
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['name'] = name;
    request.headers.addAll({
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'multipart/form-data; charset=UTF-8',
    });

    request.send();

    return "register success";
  } catch (e) {
    print(e);
  }
}
