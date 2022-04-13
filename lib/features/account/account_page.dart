import 'package:flutter/material.dart';
import 'package:instagream/app_context.dart';

import '../../services/PostService.dart';
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
  final bool me;

  const AccountPage(
      {Key? key,
      required this.id,
      required this.name,
      required this.image,
      required this.email,
      required this.me})
      : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  static const TAG = 'AccountPage';
  int countPost = 0;
  List<String> imageList = [];
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
    getImageByID();
  }

  void getImageByID() async {
    String id = widget.id;
    var res = await GetAllPostByIdService(id);
    setState(() {
      for (int i = 0; i < res.list.length; i++) {
        imageList.add(res.list[i].image);
      }
      countPost = res.list.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                AppBarAccount(
                  _onShowMenu,
                  id: widget.id,
                  name: widget.name,
                  image: widget.image,
                  email: widget.email,
                  me: widget.me,
                ),
                SliverToBoxAdapter(
                  child: HeaderAccountWidget(
                      id: widget.id,
                      name: widget.name,
                      image: widget.image,
                      me: widget.me,
                      countPost: countPost),
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
                  itemCount: countPost,
                  itemBuilder: (context, index) {
                    return Image.network(
                      imageList[index],
                      fit: BoxFit.cover,
                    );
                  }),
            ])),
      ),
    );
  }
}
