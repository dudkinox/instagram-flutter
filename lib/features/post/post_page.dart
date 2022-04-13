import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:provider/provider.dart';

import '../../data/bloc/local_media_bloc.dart';
import 'setting_post_page.dart';

class PostPage extends StatefulWidget {
  static const ROUTE_NAME = 'PostPage';

  const PostPage(
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
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  static const TAG = 'PostPage';
  @override
  Widget build(BuildContext context) {
    final decoration =
        BoxDecoration(shape: BoxShape.circle, color: Colors.black54);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingPostPage(
                      id: widget.id,
                      name: widget.name,
                      image: widget.image,
                      email: widget.email,
                    ),
                  ),
                );
              },
              child: Text(
                'Next',
                style: Theme.of(context)
                    .primaryTextTheme
                    .subtitle1
                    ?.copyWith(color: Colors.blue),
              ))
        ],
      ),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: Colors.grey,
              child: Stack(
                children: [
                  Positioned.fill(
                      child: Image.asset(
                    'assets/sample/search_demo1.jpg',
                    fit: BoxFit.cover,
                  )),
                  Positioned(
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Container(
                              child: IconButton(
                                  icon: Icon(
                                    Icons.zoom_out_map,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {}),
                              decoration: decoration),
                          Expanded(child: Container()),
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.camera,
                                      size: 16, color: Colors.white),
                                  onPressed: () {}),
                              decoration: decoration),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.format_shapes,
                                      size: 16, color: Colors.white),
                                  onPressed: () {}),
                              decoration: decoration),
                          SizedBox(
                            width: 16,
                          ),
                          Container(
                              child: IconButton(
                                  icon: Icon(Icons.content_copy,
                                      size: 16, color: Colors.white),
                                  onPressed: () {}),
                              decoration: decoration)
                        ],
                      ),
                    ),
                    bottom: 0,
                    left: 0,
                    right: 0,
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: context.watch<LocalMediaBloc>().files.length * 2,
                  itemBuilder: (context, index) {
                    return InkResponse(
                      child: Image.asset(
                        context.watch<LocalMediaBloc>().files[index % 8],
                        fit: BoxFit.cover,
                      ),
                      onTap: () {},
                    );
                  }))
        ],
      ),
    );
  }
}
