import 'package:flutter/material.dart';

class ShopCarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("购物车")),
      body: Container(
        color: Colors.cyanAccent,
        child: Center(child: Text("购物车")),
      ),
    );
  }
}
