import 'package:async/async.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  static const TAG = 'SignUpPage';
  ResultFuture<bool>? singingFuture;
  final ImagePicker _picker = ImagePicker();

  void onImageButtonPressed() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
  }
  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    //register form
    return Scaffold(
      body: IgnorePointer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 64,
                  ),
                  SvgPicture.asset(
                    'assets/icons/ic_instagram.svg',
                    color: Theme.of(context).colorScheme.onBackground,
                    height: 32,
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  IconButton(
                    onPressed: () {
                    },
                    icon: Image.asset('assets/images/profile-img.png'),
                    iconSize: 150,
                    padding: EdgeInsets.zero,
                  ),
                  Text(
                    'Upload a profile picture',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'full name',
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
                    decoration: InputDecoration(
                      hintText: 'email',
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
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'confirm password',
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
                  InkWell(
                    child: Container(
                      child:
                          (singingFuture == null || singingFuture!.isComplete)
                              ? Text(
                                  'Sign Up',
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
                            borderRadius: BorderRadius.all(Radius.circular(4)),
                          ),
                          gradient: LinearGradient(colors: [
                            Color(0xFF405de6),
                            Color(0xFF833ab4),
                            Color(0xFFe1306c),
                          ])),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
        ignoring: singingFuture != null && !singingFuture!.isComplete,
      ),
    );
  }
}
