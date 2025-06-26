import 'package:flutter/material.dart';

class WebviewPage extends StatefulWidget {
  final String title;
  const WebviewPage({required this.title});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text(widget.title)));
  }
}
