import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as developer;

import 'package:google_fonts/google_fonts.dart';

import '../../chat/chat.dart';
import '../../res/icons_app.dart';
import '../direct/direct_page.dart';

class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback onCameraClick;

  HeaderWidget(this.onCameraClick);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).primaryColor,
      elevation: 2,
      child: SafeArea(
        child: Container(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: SvgPicture.asset(
                  IconsApp.logoBUMU,
                  height: 150,
                ),
              )),
              IconButton(
                  icon: SvgPicture.asset(
                    IconsApp.icSend,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (context) => const ChatPrivate()));
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48);
}
