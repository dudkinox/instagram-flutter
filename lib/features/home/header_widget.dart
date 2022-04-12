import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:developer' as developer;

import 'package:url_launcher/url_launcher.dart';

import '../../res/icons_app.dart';

class HeaderWidget extends StatelessWidget with PreferredSizeWidget {
  final VoidCallback onCameraClick;

  HeaderWidget(this.onCameraClick, {Key? key}) : super(key: key);

  Future openBrowserURL({required String url, bool inApp = false}) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: inApp,
        forceWebView: inApp,
        enableJavaScript: true,
      );
    }
  }

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
                  onPressed: () async {
                    const url = 'https://chat-instagram.herokuapp.com';
                    openBrowserURL(url: url, inApp: true);
                  })
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
