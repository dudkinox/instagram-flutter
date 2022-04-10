import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../widgets/feed/feed_widget.dart';
import 'header_widget.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = 'HomePage';

  final VoidCallback onCameraClick;

  HomePage(this.onCameraClick);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const TAG = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(widget.onCameraClick),
      body: RefreshIndicator(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[FeedWidget(), FeedWidget()],
            ),
          ),
          onRefresh: () async {}),
    );
  }
}
