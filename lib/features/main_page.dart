import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'bottom_nav/bottom_nav_page.dart';

class MainPage extends StatefulWidget {
  final String id;
  final String name;
  final String image;
  final String email;
  const MainPage(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.email})
      : super(key: key);
  static const ROUTE_NAME = 'MainPage';
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const TAG = 'MainPage';
  late PageController _pageController;
  int currentPage = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (current) {
              currentPage = current;
            },
            children: <Widget>[
              BottomNavPage(widget.id, widget.name, widget.image, widget.email),
            ],
          ),
        ),
        onWillPop: () async {
          if (currentPage == 0) {
            _pageController.animateToPage(1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn);
            return false;
          } else {
            return true;
          }
        });
  }
}
