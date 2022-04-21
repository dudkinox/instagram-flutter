import 'package:flutter/material.dart';

import '../../features/comment/comment_page.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {Key? key,
      required this.name,
      required this.caption,
      required this.countLike})
      : super(key: key);

  final String name;
  final String caption;
  final String countLike;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_function_declarations_over_variables
    final onOpenComment = () {
      Navigator.pushNamed(context, CommentPage.ROUTE_NAME, arguments: '112034');
    };

    return Container(
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
                countLike + ' likes',
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
                    text: 'by ' + name,
                    style: Theme.of(context).textTheme.bodyText2),
                TextSpan(
                    text: '  ' + caption,
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
    );
  }
}
