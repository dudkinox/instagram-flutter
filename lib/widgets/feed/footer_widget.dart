import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../res/icons_app.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

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
              onPressed: () {}),
        ],
      ),
    );
  }
}
