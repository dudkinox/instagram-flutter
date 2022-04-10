// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../features/auth/signin/sign_in_page.dart';
import '../features/authorized/authorized_navigation.dart';
import '../services/AccountService.dart';

Future<void> LoginController(
    String email, String password, BuildContext context) async {
  var result = await Login(email, password);
  if (result.email != "") {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
              },
            )
          ],
        );
      },
    );
  }
}
