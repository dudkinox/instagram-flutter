import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../features/comment/comment_page.dart';
import '../../res/icons_app.dart';
import 'package:http/http.dart' as http;

import '../../services/LikeService.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.postNo,
    required this.caption,
    required this.countLike,
  }) : super(key: key);
  final String id;
  final String image;
  final String name;
  final int postNo;
  final String caption;
  final String countLike;

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  static const TAG = 'FooterWidget';
  bool isLike = false;
  int count = 0;

  void setIsLike() async {
    setState(() {
      isLike = !isLike;
    });
    var data =
        await LikeImage(widget.id, widget.name, widget.image, widget.postNo);
    print(data);
  }

  String countToString() {
    count = int.parse(widget.countLike) + 1;
    return count.toString();
  }

  @override
  Widget build(BuildContext context) {
    print("isLike: " + isLike.toString());
    final onOpenComment = () {
      Navigator.pushNamed(context, CommentPage.ROUTE_NAME, arguments: '112034');
    };
    return Container(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              IconButton(
                  icon: isLike
                      ? SvgPicture.asset(
                          IconsApp.icFavoriteSelected,
                          color: Theme.of(context).colorScheme.onPrimary,
                        )
                      : SvgPicture.asset(
                          IconsApp.icFavorite,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                  onPressed: setIsLike),
              IconButton(
                  icon: SvgPicture.asset(
                    IconsApp.icComment,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {}),
              IconButton(
                  icon: SvgPicture.asset(
                    IconsApp.icSend,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () async {
                    final url = Uri.parse(widget.image);
                    final response = await http.get(url);
                    final bytes = response.bodyBytes;

                    final temp = await getTemporaryDirectory();
                    final path = '${temp.path}/image.png';
                    File(path).writeAsBytesSync(bytes);

                    Share.shareFiles([path], text: 'My share image');
                  }),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text(
                      isLike
                          ? countToString() + ' likes'
                          : widget.countLike + ' likes',
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: 'by ' + widget.name,
                          style: Theme.of(context).textTheme.bodyText2),
                      TextSpan(
                          text: '  ' + widget.caption,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(fontWeight: FontWeight.w400)),
                    ]),
                  ),
                ),
                InkWell(
                  child: Container(
                    child: Text(
                      'View all 4 comment',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 4),
                  ),
                  onTap: onOpenComment,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
