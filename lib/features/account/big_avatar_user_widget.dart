import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:image_picker/image_picker.dart';

import '../../models/ProfileModel.dart';
import '../../services/AccountService.dart';

class BigAvatarUserWidget extends StatefulWidget {
  static const ROUTE_NAME = 'BigAvatarUserWidget';
  final String id;
  final String name;
  final String image;

  const BigAvatarUserWidget(
      {Key? key, required this.id, required this.name, required this.image})
      : super(key: key);
  @override
  _BigAvatarUserWidgetState createState() => _BigAvatarUserWidgetState();
}

class _BigAvatarUserWidgetState extends State<BigAvatarUserWidget> {
  static const TAG = 'BigAvatarUserWidget';
  late File file;
  bool isFile = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProfileModel>(
        future: GetAccountByIDService(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return SizedBox(
              width: 80,
              height: 80,
              child: Stack(
                children: <Widget>[
                  IconButton(
                    onPressed: () async {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Select choice'),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                GestureDetector(
                                  child: const Text('Gallery'),
                                  onTap: () async {
                                    var image = await ImagePicker().getImage(
                                      source: ImageSource.gallery,
                                    );
                                    setState(() {
                                      file = File(image!.path);
                                      isFile = true;
                                    });
                                    await UpdateImageAccount(widget.id, file);
                                    Navigator.of(context).pop();
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                GestureDetector(
                                  child: const Text('Camera'),
                                  onTap: () async {
                                    var image = await ImagePicker().getImage(
                                      source: ImageSource.camera,
                                    );
                                    setState(() {
                                      file = File(image!.path);
                                      isFile = true;
                                    });
                                    await UpdateImageAccount(widget.id, file);
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    icon: !isFile
                        ? CircleAvatar(
                            radius: 30.0,
                            backgroundImage: NetworkImage(snapshot.data!.image),
                            backgroundColor: Colors.transparent,
                          )
                        : CircleAvatar(
                            radius: 30.0,
                            backgroundImage: FileImage(file),
                            backgroundColor: Colors.transparent,
                          ),
                    iconSize: 130,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            );
          }
        });
  }
}
