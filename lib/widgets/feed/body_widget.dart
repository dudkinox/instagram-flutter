import 'package:flutter/material.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.network(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
