import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../models/FeedModel.dart';
import '../../services/FeedService.dart';
import 'body_widget.dart';
import 'feedState.dart';
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
      child: FutureBuilder<List<FeedModel>>(
        future: GetAllFeedService(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var res = snapshot.data;

            List<Widget> FeedArray = [];
            for (var i = 0; i < res.length; i++) {
              FeedArray.add(FeedState(
                id: res[i].id,
                name: res[i].name,
                image: res[i].image,
                email: res[i].email,
              ));
            }

            return Container(
              decoration: BoxDecoration(
                  border: Border(top: Divider.createBorderSide(context))),
              padding: const EdgeInsets.only(bottom: 8),
              child: FeedState(id: id, name: name, image: image, email: email),
            );
          } else {
            return const Center(
              child: LinearProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
