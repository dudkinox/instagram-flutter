// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:flutter/material.dart';

import '../services/AccountService.dart';

Future<void> RegisterController(String email, String password, String name,
    File image, GlobalKey<FormState> _formKey) async {
  if (_formKey.currentState!.validate()) {
    var status = await RegisterService(email, password, name, image);
    print("status: " + status);
  }
}
