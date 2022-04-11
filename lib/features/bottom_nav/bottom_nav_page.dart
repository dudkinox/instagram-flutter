import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tuple/tuple.dart';
import 'dart:developer' as developer;

import '../../res/icons_app.dart';
import '../account/account_page.dart';
import '../activity/activity_page.dart';
import '../home/home_page.dart';
import '../post/post_page.dart';
import '../search/search_pages.dart';
import 'bottom_navigation_item.dart';

class BottomNavPage extends StatefulWidget {
  static const ROUTE_NAME = 'BottomNavPage';

  final VoidCallback onCameraClick;
  final String id;
  final String name;
  final String image;

  const BottomNavPage(this.onCameraClick, this.id, this.name, this.image,
      {Key? key})
      : super(key: key);

  @override
  _BottomNavPageState createState() => _BottomNavPageState();
}

class _BottomNavPageState extends State<BottomNavPage> {
  static const TAG = 'BottomNavPage';

  int _currentTabIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Tuple2<String, String>> tabsIcons = [
    const Tuple2(IconsApp.icHome, IconsApp.icHomeSelected),
    const Tuple2(IconsApp.icSearch, IconsApp.icSearchSelected),
    const Tuple2(IconsApp.icCreatePost, IconsApp.icCreatePost),
    const Tuple2(IconsApp.icFavorite, IconsApp.icFavoriteSelected),
    const Tuple2(IconsApp.icAccount, IconsApp.icAccountSelected),
  ];

  @override
  void initState() {
    super.initState();
    developer.log('initState', name: TAG);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          if (index <= 1) {
            setState(() {
              _currentTabIndex = index;
            });
          } else {
            setState(() {
              _currentTabIndex = index + 1;
            });
          }
        },
        children: <Widget>[
          HomePage(widget.onCameraClick),
          SearchPages(),
          ActivityPage(),
          AccountPage(id: widget.id, name: widget.name, image: widget.image),
        ],
      ),
      bottomNavigationBar: Material(
        elevation: 4,
        color: Theme.of(context).bottomAppBarColor,
        child: SafeArea(
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: Divider.createBorderSide(context))),
            height: 56,
            child: Row(
              children: <Widget>[
                Expanded(
                    child: BottomNavigationItem(
                        tabsIcons[0], 0 == _currentTabIndex, onPress: () {
                  setState(() {
                    _currentTabIndex = 0;
                    _pageController.jumpToPage(0);
                  });
                })),
                Expanded(
                  child: BottomNavigationItem(
                      tabsIcons[1], 1 == _currentTabIndex, onPress: () {
                    setState(() {
                      _currentTabIndex = 1;
                      _pageController.jumpToPage(1);
                    });
                  }),
                ),
                Expanded(
                    child: BottomNavigationItem(
                        tabsIcons[2], 2 == _currentTabIndex, onPress: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PostPage()));
                })),
                Expanded(
                    child: BottomNavigationItem(
                        tabsIcons[3], 3 == _currentTabIndex, onPress: () {
                  setState(() {
                    _currentTabIndex = 3;
                    _pageController.jumpToPage(2);
                  });
                })),
                Expanded(
                    child: BottomNavigationItem(
                        tabsIcons[4], 4 == _currentTabIndex, onPress: () {
                  setState(() {
                    _currentTabIndex = 4;
                    _pageController.jumpToPage(3);
                  });
                })),
              ],
            ),
          ),
          bottom: true,
        ),
      ),
    );
  }
}
