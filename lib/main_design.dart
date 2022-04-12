// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'features/explore/explore_page.dart';

void main() {
  runApp(MyDesignTest());
}

class MyDesignTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(cardColor: const Color(0xFF121212)),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: const ExplorePage(id: "", name: "", image: "", email: ""),
        ),
      ),
    );
  }
}
