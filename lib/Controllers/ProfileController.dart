// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';

import '../features/account/account_page.dart';
import '../services/AccountService.dart';

Future<void> UpdateProfileAccount(BuildContext context, String id, String email,
    String name, String password, String image) async {
  var status = await UpdateAccount(id, email, name, password, image);
  if (status == "success") {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AccountPage(id: id, name: name, image: image, email: email)));
  }
}
