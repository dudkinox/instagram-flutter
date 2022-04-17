import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../res/icons_app.dart';
import 'package:http/http.dart' as http;

import '../../services/LikeService.dart';

class FooterWidget extends StatefulWidget {
  FooterWidget({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.postNo,
    required this.caption,
    required this.countLike,
    required this.like,
  }) : super(key: key);
  final String id;
  final String image;
  final String name;
  final int postNo;
  final String caption;
  final String countLike;
  bool like;

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  static const TAG = 'FooterWidget';
  TextEditingController controller = TextEditingController();
  int count = 0;
  bool isPressed = false;
  bool isShowComment = false;
  bool isComment = false;
  Map<String, String> comment = {};

  void setIsLike() async {
    setState(() {
      widget.like = !widget.like;
      isPressed = !isPressed;
    });
    var data =
        await LikeImage(widget.id, widget.name, widget.image, widget.postNo);
  }

  void setIsShowCommented() {
    setState(() {
      isShowComment = !isShowComment;
    });
  }

  String countToString() {
    if (isPressed && widget.like) {
      return (int.parse(widget.countLike) + 1).toString();
    } else if (isPressed && !widget.like) {
      return (int.parse(widget.countLike) - 1).toString();
    }
    return widget.countLike;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: <Widget>[
              IconButton(
                  icon: widget.like
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
                  onPressed: setIsShowCommented),
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
                      isPressed || widget.like || !widget.like
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
                Visibility(
                  visible: !isShowComment,
                  child: InkWell(
                    child: Container(
                      child: Text(
                        'View all 4 comment',
                        style: Theme.of(context).textTheme.caption,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    onTap: setIsShowCommented,
                  ),
                ),
                Visibility(
                  visible: isShowComment,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < comment.length; i++)
                          getComment(comment.keys.elementAt(i),
                              comment.values.elementAt(i)),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.7,
                              child: TextFormField(
                                controller: controller,
                                minLines: 1,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration: InputDecoration(
                                  hintText: 'Write a comment...',
                                  hintStyle:
                                      Theme.of(context).textTheme.caption,
                                  enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 8),
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    comment
                                        .addAll({"Newiihuhu": controller.text});
                                    isComment = true;
                                    print(comment);
                                    for (int i = 0; i < comment.length; i++) {
                                      print(comment.keys.elementAt(i));
                                      print(comment.values.elementAt(i));
                                    }

                                    controller.clear();
                                  });
                                },
                                child: const Text('Post',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getComment(String name, String Comment) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Container(
        //   child: RichText(
        //     text: TextSpan(children: [
        //       TextSpan(
        //           text: 'by ชื่อควที่คอมเม้นนนนน',
        //           style: Theme.of(context).textTheme.bodyText2),
        //       TextSpan(
        //           text: ' คอมเม้นอะไรรรร ',
        //           style: Theme.of(context)
        //               .textTheme
        //               .bodyText1
        //               ?.copyWith(fontWeight: FontWeight.w400)),
        //     ]),
        //   ),
        //   padding: const EdgeInsets.symmetric(vertical: 4),
        // ),
        Visibility(
            child: Container(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: name, style: Theme.of(context).textTheme.bodyText2),
                  TextSpan(
                      text: ' $Comment ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontWeight: FontWeight.w400)),
                ]),
              ),
              padding: const EdgeInsets.symmetric(vertical: 4),
            ),
            visible: isComment),
      ],
    );
  }
}
