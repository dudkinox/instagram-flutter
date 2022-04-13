import 'dart:io';

import '../database/client.dart';
import 'package:http/http.dart' as http;

Future<dynamic> PostService(String id, File imageURL, String caption) async {
  try {
    final String Url = Host + "/api/post-feed/" + id;

    var request = http.MultipartRequest('POST', Uri.parse(Url));
    request.files.add(await http.MultipartFile.fromPath('img', imageURL.path));
    request.fields['caption'] = caption;
    request.headers.addAll({
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'multipart/form-data; charset=UTF-8',
    });

    request.send();

    return "post feed success";
  } catch (e) {
    print(e);
  }
}
