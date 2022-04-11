// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagream/models/ProfileModel.dart';

import '../../Controllers/ProfileController.dart';
import '../../components/Loading.dart';
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.close),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 64,
                          ),
                          const Text("UPDATE PROFILE",
                              style: TextStyle(fontSize: 30)),
                          const SizedBox(
                            height: 64,
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
                              UpdateProfileAccount(
                                context,
                                widget.id,
                                _nameController.text,
                                _emailController.text,
                                res.image,
                                res.image,
                              );
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
