import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Container(
        color: Colors.lightBlue,
        child: Center(child: Text("首页")),
      ),
    );
  }
}
