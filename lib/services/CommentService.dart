import 'dart:convert';

import 'package:http/http.dart' as http;
import '../database/client.dart';

Future<dynamic> AddCommentService(
    String id, String image, String name, String comment, int postNo) async {
  try {
    final String Url = Host + "/api/comment/" + id;

    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "image": image,
        "name": name,
        "comment": comment,
        "postNo": postNo
      }),
    );

    return "success";
  } catch (e) {
    print(e);
  }
}
