import 'package:flutter/material.dart';

import '../../models/PostModel.dart';
import '../../services/FeedService.dart';
import 'body_widget.dart';
import 'footer_widget.dart';
import 'header_widget.dart';

class FeedWidget extends StatelessWidget {
  const FeedWidget({
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
    return Material(
      color: Theme.of(context).cardColor,
      child: FutureBuilder<List<PostModel>>(
        future: GetAllFeedService(id),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var res = snapshot.data;
            final feedChildren = <Widget>[];
            for (var i = 0; i < res.length; i++) {
              final item = res[i].list;
              for (var j = 0; j < item.length; j++) {
                feedChildren.add(HeaderWidget(
                    id: res[i].id,
                    name: res[i].name,
                    image: res[i].image,
                    email: res[i].email,
                    createAt: item[j].createAt +
                        " เวลา: " +
                        item[j].createTime +
                        " น."));
                feedChildren.add(BodyWidget(image: item[j].image));
                feedChildren.add(FooterWidget(
                  id: res[i].id,
                  image: item[j].image,
                  name: name,
                  postNo: item[j].postNo,
                  caption: item[j].caption,
                  countLike: item[j].countLike.toString(),
                  like: item[j].like,
                ));
              }
            }

            return Container(
              decoration: BoxDecoration(
                  border: Border(top: Divider.createBorderSide(context))),
              padding: const EdgeInsets.only(bottom: 8),
              child: Column(
                  mainAxisSize: MainAxisSize.min, children: feedChildren),
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
