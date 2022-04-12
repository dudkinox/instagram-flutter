import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'body_widget.dart';
import 'footer_widget.dart';
import 'header_widget.dart';
import 'info_widget.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.email})
      : super(key: key);
  final String id;
  final String name;
  final String image;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardColor,
      child: Container(
        decoration: BoxDecoration(
            border: Border(top: Divider.createBorderSide(context))),
        padding: EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            HeaderWidget(id: id, name: name, image: image, email: email),
            BodyWidget(),
            FooterWidget(),
            InfoWidget()
          ],
        ),
      ),
    );
  }
}
