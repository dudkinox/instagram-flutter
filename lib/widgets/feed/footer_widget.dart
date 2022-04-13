import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../res/icons_app.dart';
import 'package:http/http.dart' as http;

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          IconButton(
              icon: SvgPicture.asset(
                IconsApp.icFavorite,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset(
                IconsApp.icComment,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () {}),
          IconButton(
              icon: SvgPicture.asset(
                IconsApp.icSend,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              onPressed: () async {
                final url = Uri.parse(image);
                final response = await http.get(url);
                final bytes = response.bodyBytes;

                final temp = await getTemporaryDirectory();
                final path = '${temp.path}/image.png';
                File(path).writeAsBytesSync(bytes);

                Share.shareFiles([path], text: 'My share image');
              }),
        ],
      ),
    );
  }
}
