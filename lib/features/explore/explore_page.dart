import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../widgets/feed/feed_widget.dart';

class ExplorePage extends StatefulWidget {
  static const ROUTE_NAME = 'ExplorePage';

  const ExplorePage(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.email})
      : super(key: key);

  final String id;
  final String name;
  final String image;
  final String email;

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  static const TAG = 'ExplorePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Explore'),
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => FeedWidget(
                    id: widget.id,
                    name: widget.name,
                    image: widget.image,
                    email: widget.email),
                childCount: 10),
          )
        ],
      ),
    );
  }
}
