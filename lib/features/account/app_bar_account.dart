import 'package:flutter/material.dart';

import 'app_bar_account_delegate.dart';

class AppBarAccount extends StatefulWidget {
  final VoidCallback onShowMenu;

  const AppBarAccount(this.onShowMenu, {Key? key}) : super(key: key);

  @override
  _AppBarAccountState createState() => _AppBarAccountState();
}

class _AppBarAccountState extends State<AppBarAccount> {
  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: AppBarAccountDelegate(MediaQuery.of(context).padding.top),
    );
  }
}
