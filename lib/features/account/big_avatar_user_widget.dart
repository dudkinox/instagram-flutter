import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class BigAvatarUserWidget extends StatefulWidget {
  static const ROUTE_NAME = 'BigAvatarUserWidget';
  final String id;
  final String name;
  final String image;

  const BigAvatarUserWidget(
      {Key? key, required this.id, required this.name, required this.image})
      : super(key: key);
  @override
  _BigAvatarUserWidgetState createState() => _BigAvatarUserWidgetState();
}

class _BigAvatarUserWidgetState extends State<BigAvatarUserWidget> {
  static const TAG = 'BigAvatarUserWidget';
  @override
  Widget build(BuildContext context) {
    print(widget.image);
    return Container(
      width: 80,
      height: 80,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
              child: CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(widget.image),
            backgroundColor: Colors.transparent,
          )),
          Positioned(
            child: ClipOval(
              child: Container(
                decoration: ShapeDecoration(
                    color: Colors.blueAccent,
                    shape: CircleBorder(
                      side: Divider.createBorderSide(context,
                          width: 2, color: Theme.of(context).cardColor),
                    )),
                padding: const EdgeInsets.all(2),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.add,
                  size: 12,
                  color: Colors.white,
                ),
              ),
            ),
            right: 0,
            bottom: 0,
          )
        ],
      ),
    );
  }
}
