// ignore_for_file: non_constant_identifier_names

import 'dart:convert';


import '../database/client.dart';
import 'package:http/http.dart' as http;

import '../models/FeedModel.dart';


Future<List<FeedModel>> GetAllFeedService(String id) async {
  final String url = Host + "/api/feed/all/" + id;
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => FeedModel.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load feeds');
  }
}
