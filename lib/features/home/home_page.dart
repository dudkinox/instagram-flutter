import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../widgets/feed/feed_widget.dart';
import 'header_widget.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = 'HomePage';

  final String id;
  final String name;
  final String image;
  final String email;

  const HomePage(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.email})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TAG = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(),
      body: RefreshIndicator(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FeedWidget(
                    id: widget.id,
                    name: widget.name,
                    image: widget.image,
                    email: widget.email),
                FeedWidget(
                    id: widget.id,
                    name: widget.name,
                    image: widget.image,
                    email: widget.email),
              ],
            ),
          ),
          onRefresh: () async {}),
    );
  }
}
