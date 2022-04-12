// ignore_for_file: must_be_immutable

import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import '../../../Controllers/SignInController.dart';
import '../../../components/Loading.dart';

import '../signup/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  static const ROUTE_NAME = 'SignInPage';
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ResultFuture<bool>? singingFuture;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return isLoading
        ? LoadingCircle()
        : Scaffold(
            body: IgnorePointer(
              child: SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  width: double.infinity,
                  child: Column(
                    children: [
                      Flexible(
                        child: Container(),
                        flex: 1,
                      ),
                      SvgPicture.asset(
                        'assets/icons/BAMU_LOGO.svg',
                        height: 150,
                      ),
                      Flexible(
                        child: Container(),
                        flex: 1,
                      ),
                      Text(
                        'Sign in and use more feature',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        height: 64,
                      ),
                      TextFormField(
                        controller: widget.email,
                        decoration: InputDecoration(
                          hintText: 'email or username',
                          border: inputBorder,
                          focusedBorder: inputBorder,
                          enabledBorder: inputBorder,
                          filled: true,
                          contentPadding: EdgeInsets.all(8),
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        controller: widget.password,
                        decoration: InputDecoration(
                            hintText: 'password',
                            border: inputBorder,
                            focusedBorder: inputBorder,
                            enabledBorder: inputBorder,
                            filled: true,
                            contentPadding: EdgeInsets.all(8)),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      InkWell(
                        child: Container(
                          child: (singingFuture == null ||
                                  singingFuture!.isComplete)
                              ? Text(
                                  'Sign in',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.white),
                                )
                              : CupertinoActivityIndicator(),
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                              ),
                              gradient: LinearGradient(colors: [
                                Color(0xFF405de6),
                                Color(0xFF833ab4),
                                Color(0xFFe1306c),
                              ])),
                        ),
                        onTap: () {
                          setState(() {
                            isLoading = true;
                          });
                          LoginController(
                              widget.email.text,
                              widget.password.text,
                              context,
                              setState,
                              isLoading);
                        },
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Forgot for login details? get help signing in',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 10),
                      ),
                      Flexible(
                        child: Container(),
                        flex: 2,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpPage()));
                                },
                                child: Text(
                                  "Sign up",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.copyWith(color: Colors.blue),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ignoring: singingFuture != null && !singingFuture!.isComplete,
            ),
          );
  }
}
