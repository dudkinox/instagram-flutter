import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagream/models/ProfileModel.dart';

import '../../components/Loading.dart';
import '../../models/AccountModel.dart';
import '../../services/AccountService.dart';

class EditProfile extends StatefulWidget {
  final String id;
  const EditProfile({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late File file;
  bool isFile = false;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isPasswordValid(String password) => password.length >= 6;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return FutureBuilder<ProfileModel>(
        future: GetAccountByIDService(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var res = snapshot.data;
            _nameController.text = res!.name;
            _emailController.text = res.email;
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 64,
                          ),
                          const Text("Edit Profile",
                              style: TextStyle(fontSize: 30)),
                          const SizedBox(
                            height: 64,
                          ),
                          IconButton(
                            onPressed: () async {
                              var image = await ImagePicker().getImage(
                                source: ImageSource.gallery,
                              );
                              setState(() {
                                file = File(image!.path);
                                isFile = true;
                              });
                            },
                            icon: !isFile
                                ? Image.network(res.image)
                                : Image.file(file),
                            iconSize: 130,
                            padding: EdgeInsets.zero,
                          ),
                          Text(
                            'Upload a profile picture',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              hintText: 'Full Name',
                              border: inputBorder,
                              focusedBorder: inputBorder,
                              enabledBorder: inputBorder,
                              filled: true,
                              contentPadding: const EdgeInsets.all(8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              border: inputBorder,
                              focusedBorder: inputBorder,
                              enabledBorder: inputBorder,
                              filled: true,
                              contentPadding: const EdgeInsets.all(8),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                border: inputBorder,
                                focusedBorder: inputBorder,
                                enabledBorder: inputBorder,
                                filled: true,
                                contentPadding: const EdgeInsets.all(8)),
                            obscureText: true,
                            validator: (password) {
                              if (isPasswordValid(password!)) {
                                return null;
                              } else {
                                return 'Password must be at least 6 characters';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Confirm Password',
                              border: inputBorder,
                              focusedBorder: inputBorder,
                              enabledBorder: inputBorder,
                              filled: true,
                              contentPadding: const EdgeInsets.all(8),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please confirm your password';
                              } else if (value != _passwordController.text) {
                                return 'Password do not match';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          InkWell(
                            child: Container(
                              child: Text(
                                'Save',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.copyWith(color: Colors.white),
                              ),
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const ShapeDecoration(
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
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return LoadingCircle();
          }
        });
  }
}
