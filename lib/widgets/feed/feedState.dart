import 'package:flutter/material.dart';

import 'body_widget.dart';
import 'footer_widget.dart';
import 'header_widget.dart';
import 'info_widget.dart';

class FeedState extends StatelessWidget {
  const FeedState({
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
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      HeaderWidget(id: id, name: name, image: image, email: email),
      BodyWidget(image: image),
      FooterWidget(),
      InfoWidget(name: name, caption: "caption")
    ]);
  }
}
