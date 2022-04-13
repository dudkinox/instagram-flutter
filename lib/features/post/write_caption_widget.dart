import 'package:flutter/material.dart';

class WriteCaptionWidget extends StatefulWidget {
  static const ROUTE_NAME = 'WriteCaptionWidget';

  const WriteCaptionWidget(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.email,
      required this.controller})
      : super(key: key);

  final String id;
  final String name;
  final String image;
  final String email;
  final TextEditingController controller;

  @override
  _WriteCaptionWidgetState createState() => _WriteCaptionWidgetState();
}

class _WriteCaptionWidgetState extends State<WriteCaptionWidget> {
  static const TAG = 'WriteCaptionWidget';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.image),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: widget.controller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Write a caption',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Theme.of(context).hintColor)),
            ),
          )),
        ],
      ),
    );
  }
}
