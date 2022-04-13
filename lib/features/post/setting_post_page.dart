import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagream/features/post/post_create_view_model.dart';
import 'package:provider/provider.dart';

import '../../services/PostService.dart';
import '../bottom_nav/bottom_nav_page.dart';
import 'write_caption_widget.dart';

class SettingPostPage extends StatefulWidget {
  static const ROUTE_NAME = 'SettingPostPage';

  const SettingPostPage({
    Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.email,
  }) : super(key: key);

  final String id;
  final String name;
  final String image;
  final String email;

  @override
  _SettingPostPageState createState() => _SettingPostPageState();
}

class _SettingPostPageState extends State<SettingPostPage> {
  static const TAG = 'SettingPostPage';
  TextEditingController controller = TextEditingController();
  late File file;
  bool isFile = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ModalRoute.of(context)!.overlayEntries.forEach((element) {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostCreateViewModel(),
      lazy: false,
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('New Post'),
              actions: [
                FlatButton(
                    onPressed: () async {
                      await PostService(widget.id, file, controller.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BottomNavPage(widget.id,
                              widget.name, widget.image, widget.email),
                        ),
                      );
                    },
                    child: Text(
                      'Post',
                      style: Theme.of(context)
                          .primaryTextTheme
                          .subtitle1
                          ?.copyWith(color: Colors.white),
                    ))
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WriteCaptionWidget(
                    id: widget.id,
                    name: widget.name,
                    image: widget.image,
                    email: widget.email,
                    controller: controller,
                  ),
                  const Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: const Text('Gallery'),
                      onTap: () async {
                        var image = await ImagePicker().getImage(
                          source: ImageSource.gallery,
                        );
                        setState(() {
                          file = File(image!.path);
                          isFile = true;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      child: const Text('Camera'),
                      onTap: () async {
                        var image = await ImagePicker().getImage(
                          source: ImageSource.camera,
                        );
                        setState(() {
                          file = File(image!.path);
                          isFile = true;
                        });
                      },
                    ),
                  ),
                  const Divider(
                    height: 1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  isFile
                      ? Image.file(
                          file,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2,
                        )
                      : Container(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
