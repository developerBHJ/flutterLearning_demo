import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_navigator/model/video_model.dart';
import 'package:flutter_navigator/pages/detail_page.dart';
import 'package:flutter_navigator/pages/error_page.dart';
import 'package:flutter_navigator/pages/home_page.dart';

class RoutePath {
  static const String home = "/";
  static const String detail = "/detail";
}

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePath.home:
        return pageRoute(HomePage());
      case RoutePath.detail:
        return pageRoute(DetailPage(videoModel: VideoModel("111")));
    }
    return pageRoute(ErrorPage());
  }

  static MaterialPageRoute pageRoute(
    Widget page, {
    RouteSettings? settings,
    bool? fullscreenDialog,
    bool? maintainState,
    bool? allowSnapshotting,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return page;
      },
      settings: settings,
      fullscreenDialog: fullscreenDialog ?? false,
      maintainState: maintainState ?? false,
      allowSnapshotting: allowSnapshotting ?? false,
    );
  }
}
