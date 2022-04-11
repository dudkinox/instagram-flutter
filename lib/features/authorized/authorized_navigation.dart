// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../comment/comment_page.dart';
import '../main_page.dart';

class AuthorizedNavigation extends StatefulWidget {
  AuthorizedNavigation(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.email})
      : super(key: key);
  String id;
  String name;
  String image;
  String email;

  @override
  _AuthorizedNavigationState createState() => _AuthorizedNavigationState();
}

class _AuthorizedNavigationState extends State<AuthorizedNavigation> {
  GlobalKey<NavigatorState> navigator = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Navigator(
          key: navigator,
          onGenerateRoute: (setting) {
            switch (setting.name) {
              case CommentPage.ROUTE_NAME:
                return MaterialPageRoute(
                    builder: (context) =>
                        CommentPage(setting.arguments as String),
                    settings: setting);
              default:
                return MaterialPageRoute(
                    builder: (context) => MainPage(
                        id: widget.id,
                        name: widget.name,
                        image: widget.image,
                        email: widget.email));
            }
          },
          initialRoute: MainPage.ROUTE_NAME,
        ),
        onWillPop: () async {
          return !(await navigator.currentState!.maybePop());
        });
  }
}
