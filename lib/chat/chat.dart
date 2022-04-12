import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ChatPrivate extends StatefulWidget {
  const ChatPrivate({Key? key}) : super(key: key);

  @override
  ChatPrivateState createState() => ChatPrivateState();
}

class ChatPrivateState extends State<ChatPrivate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const WebView(
      initialUrl: 'https://chat-instagram.herokuapp.com',
    );
  }
}
