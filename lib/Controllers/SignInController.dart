// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../features/auth/signin/sign_in_page.dart';
import '../features/authorized/authorized_navigation.dart';
import '../services/AccountService.dart';

Future<void> LoginController(
    String email,
    String password,
    BuildContext context,
    void Function(void Function() fn) setState,
    bool isLoading) async {
  var result = await LoginService(email, password);
  if (result.email != "") {
    setState(() {
      isLoading = false;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AuthorizedNavigation(
                  id: result.id,
                  name: result.name,
                  image: result.image,
                  email: result.email,
                )));
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Error"),
          content: const Text("Email or password is wrong"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInPage()));
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
