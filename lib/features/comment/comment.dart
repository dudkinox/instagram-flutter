import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/CommentModel.dart';

class CommentOnPost extends StatelessWidget {
  const CommentOnPost({
    Key? key,
    required this.resComment,
  }) : super(key: key);

  final CommentModel resComment;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: resComment.list.map((comment) {
          return Container(
            child: Row(
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(comment.image),
                  ),
                  width: 40,
                  height: 40,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                  ),
                  child: Text(
                    comment.name,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                  ),
                  child: Text(
                    comment.comment,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                  ),
                  child: Text(
                    comment.createAt + " " + comment.createTime + " น.",
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
            ),
          );
        }).toList(),
      ),
    );
  }
}
