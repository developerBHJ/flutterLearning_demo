import 'package:flutter/material.dart';
import '../model/video_model.dart';

class DetailPage extends StatefulWidget {
  final VideoModel videoModel;

  const DetailPage({required this.videoModel});

  @override
  State<StatefulWidget> createState() {
    return _DetailPageState();
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("详情页")),
      body: Container(child: Text("详情页 vId:${widget.videoModel.vid}")),
    );
  }
}
