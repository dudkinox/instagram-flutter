import 'dart:convert';

import 'package:http/http.dart' as http;
import '../database/client.dart';
import '../models/CommentModel.dart';

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

Future<CommentModel> getCommentByIDService(String token) async {
  final String url = Host + "/api/comment/" + token;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  return CommentModel.fromJson(jsonDecode(response.body));
}
