import 'dart:convert';

import '../database/client.dart';
import 'package:http/http.dart' as http;

Future<String> LikeImage(
    String id, String name, String image, int postNo) async {
  final String url = Host + "/api/like/" + id + "/" + postNo.toString();
  final response = await http.patch(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "name": name,
      "image": image,
    }),
  );

  var data = json.decode(json.encode(response.body));
  return data;
}
