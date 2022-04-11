import 'package:flutter/material.dart';
import 'package:instagream/app_context.dart';
import 'dart:developer' as developer;

import '../../widgets/bottomsheet/bottom_sheet_action.dart';
import 'app_bar_account.dart';
import 'header_account_widget.dart';
import 'tab_bar_sliver_persistent_header_delegate.dart';

class AccountPage extends StatefulWidget {
  static const ROUTE_NAME = 'AccountPage';
  final String id;
  final String name;
  final String image;
  final String email;

  const AccountPage(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.email})
      : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  static const TAG = 'AccountPage';

  late VoidCallback _onShowMenu;

  @override
  void initState() {
    super.initState();
    _onShowMenu = () {
      context.showBottomSheet([
        BottomSheetAction(
            iconData: Icons.logout_outlined, title: 'Logout', id: 1),
      ]);
    };
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                AppBarAccount(_onShowMenu,
                    id: widget.id,
                    name: widget.name,
                    image: widget.image,
                    email: widget.email),
                SliverToBoxAdapter(
                  child: HeaderAccountWidget(
                      id: widget.id, name: widget.name, image: widget.image),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: TabBarSliverPersistentHeaderDelegate(
                    child: Container(
                      height: 48,
                      child: TabBar(
                        indicatorColor:
                            Theme.of(context).colorScheme.onBackground,
                        tabs: const [
                          Tab(
                            icon: Icon(Icons.grid_on),
                          ),
                          Tab(
                            icon: Icon(Icons.person_outline),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ];
            },
            body: TabBarView(children: [
              GridView.builder(
                  padding: const EdgeInsets.all(2),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: 40,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/sample/search_demo1.jpg',
                      fit: BoxFit.cover,
                    );
                  }),
              GridView.builder(
                  padding: const EdgeInsets.all(2),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: 40,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      'assets/sample/search_demo1.jpg',
                      fit: BoxFit.cover,
                    );
                  })
            ])),
      ),
    );
  }
}
