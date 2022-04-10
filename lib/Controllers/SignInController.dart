// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../features/authorized/authorized_navigation.dart';
import '../services/AccountService.dart';

Future<void> LoginController(
    String email,
    String password,
    BuildContext context,
    void setState(void Function() fn),
    bool isLoading) async {
  var result = await Login(email, password);
  if (result.email != "") {
    setState(() {
      isLoading = false;
    });
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => AuthorizedNavigation()));
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text("Email or password is wrong"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  isLoading = false;
                });
              },
            )
          ],
        );
      },
    );
  }
}
