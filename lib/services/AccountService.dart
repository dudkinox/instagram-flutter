// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../database/client.dart';
import '../models/AccountModel.dart';
import '../models/ProfileModel.dart';

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

Future<ProfileModel> GetAccountByIDService(String id) async {
  final String url = Host + "/api/account/" + id;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return ProfileModel.fromJson(jsonDecode(response.body));
}

Future<String> UpdateAccount(
    String id, String email, String name, String password, String image) async {
  final String url = Host + "/api/account/" + id;
  final response = await http.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "email": email,
      "name": name,
      "password": password,
      "image": image,
    }),
  );

  var data = json.decode(json.encode(response.body));
  return data;
}

Future<String> UpdateImageAccount(String id, File image) async {
  final String Url = Host + "/api/account/update-image/" + id;

  var request = http.MultipartRequest('PUT', Uri.parse(Url));
  request.files.add(await http.MultipartFile.fromPath('img', image.path));
  request.headers.addAll({
    'Access-Control-Allow-Origin': '*',
    'Content-Type': 'multipart/form-data; charset=UTF-8',
  });

  request.send();

  return "success";
}
