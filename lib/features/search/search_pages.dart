import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagream/features/search/search.dart';
import 'package:provider/provider.dart';

import 'package:tuple/tuple.dart';

import '../../data/bloc/local_media_bloc.dart';
import '../../res/icons_app.dart';
import '../../services/AccountService.dart';
import '../../widgets/chip_widget.dart';
import '../explore/explore_page.dart';

class SearchPages extends StatefulWidget {
  static const ROUTE_NAME = 'SearchPages';

  const SearchPages(
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
  _SearchPagesState createState() => _SearchPagesState();
}

class _SearchPagesState extends State<SearchPages> {
  static const TAG = 'SearchPages';
  List<String> name = [];
  List<String> image = [];
  List<String> id = [];
  List<String> email = [];

  @override
  void initState() {
    super.initState();
    getNameFromApi();
  }

  Future<void> getNameFromApi() async {
    var res = await GetAllAccounts();
    for (int i = 0; i < res.length; i++) {
      setState(() {
        name.add(res[i].name);
        image.add(res[i].image);
        id.add(res[i].id);
        email.add(res[i].email);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.search, color: Colors.white),
        title: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Search(
                          name: name, image: image, id: id, email: email)));
            },
            child: const Text(
              'Search',
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
        bottom: PreferredSize(
            child: Container(), preferredSize: Size.fromHeight(10)),
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4, crossAxisSpacing: 2, mainAxisSpacing: 2),
          itemCount: context.watch<LocalMediaBloc>().files.length * 6,
          itemBuilder: (context, index) {
            return InkResponse(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ExplorePage(
                        id: widget.id,
                        name: widget.name,
                        image: widget.image,
                        email: widget.email)));
              },
            );
          }),
    );
  }
}
