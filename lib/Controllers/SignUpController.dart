// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';

import '../features/auth/signin/sign_in_page.dart';
import '../services/AccountService.dart';

Future<void> RegisterController(String email, String password, String name,
    File image, GlobalKey<FormState> _formKey, BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    await RegisterService(email, password, name, image);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignInPage(),
      ),
    );
  }
}
