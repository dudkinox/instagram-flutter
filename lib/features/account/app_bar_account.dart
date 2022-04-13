import 'package:flutter/material.dart';

import 'app_bar_account_delegate.dart';

class AppBarAccount extends StatefulWidget {
  final VoidCallback onShowMenu;
  final String id;
  final String name;
  final String image;
  final String email;
  final bool me;

  const AppBarAccount(
    this.onShowMenu, {
    Key? key,
    required this.id,
    required this.name,
    required this.image,
    required this.email,
    required this.me,
  }) : super(key: key);

  @override
  _AppBarAccountState createState() => _AppBarAccountState();
}

class _AppBarAccountState extends State<AppBarAccount> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: AppBarAccountDelegate(MediaQuery.of(context).padding.top,
          widget.id, widget.name, widget.image, widget.email, widget.me),
    );
  }
}
