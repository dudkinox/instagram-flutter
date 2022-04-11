import 'package:flutter/material.dart';

import '../../application.dart';

class AppBarAccountDelegate extends SliverPersistentHeaderDelegate {
  final double topPadding;
  final String id;
  final String name;
  final String image;
  final String email;

  AppBarAccountDelegate(
      this.topPadding, this.id, this.name, this.image, this.email);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Material(
      color: Theme.of(context).primaryColor,
      child: Container(
        height: kToolbarHeight + topPadding,
        padding: EdgeInsets.only(top: topPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                children: <Widget>[
                  Text(
                    email,
                    style: Theme.of(context).primaryTextTheme.subtitle2,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Application()))
              },
            )
          ],
        ),
      ),
      elevation:
          (overlapsContent || (shrinkOffset > maxExtent - minExtent)) ? 4 : 0,
    );
  }

  @override
  double get maxExtent => kToolbarHeight + topPadding;

  @override
  double get minExtent => kToolbarHeight + topPadding;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
