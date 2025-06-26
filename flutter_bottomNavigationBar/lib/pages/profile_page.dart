import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("我的")),
      body: Container(
        color: Colors.yellowAccent,
        child: Center(child: Text("我的")),
      ),
    );
  }
}