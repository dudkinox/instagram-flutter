import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:developer' as developer;

import 'account/account_page.dart';
import 'bottom_nav/bottom_nav_page.dart';
import 'camera/camera_pge.dart';

class MainPage extends StatefulWidget {
  final id;
  final name;
  final image;
  const MainPage(
      {Key? key, required this.id, required this.name, required this.image})
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
              BottomNavPage(() {
                _pageController.animateToPage(0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn);
              }, widget.id, widget.name, widget.image),
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
