// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import '../database/client.dart';
import 'package:http/http.dart' as http;

import '../models/FeedModel.dart';

Future<FeedModel> GetAllFeedService(String id) async {
  final String url = Host + "/api/feed/all";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  return FeedModel.fromJson(jsonDecode(response.body));
}
