import 'package:flutter/material.dart';
import 'package:flutter_navigator/model/video_model.dart';

class HomePage extends StatefulWidget {
  final ValueChanged<VideoModel>? onPushDetail;

  const HomePage({this.onPushDetail});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("首页")),
      body: Container(
        child: MaterialButton(
          onPressed: () {
            if (widget.onPushDetail != null) {
              widget.onPushDetail!(VideoModel("111"));
            }
          },
          child: Text("跳转详情"),
        ),
      ),
    );
  }
}
