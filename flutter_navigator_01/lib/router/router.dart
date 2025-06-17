import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_navigator/model/video_model.dart';
import 'package:flutter_navigator/pages/detail_page.dart';
import 'package:flutter_navigator/pages/home_page.dart';

/// RouterPath
class BiliRouterPath {
  final String location;

  BiliRouterPath.home() : location = "/";

  BiliRouterPath.detail() : location = "/detail";
}

/// 可缺省，主要用于web,持有RouteInformationProvider 提供的 RouteInformation，可以将其解析为我们定义的数据类型
class BiliRouterInformationParser
    extends RouteInformationParser<BiliRouterPath> {
  Future<BiliRouterPath> parseRouteInformation(
    RouteInformation information,
  ) async {
    final uri = Uri.parse(information.location);
    print(uri);
    if (uri.pathSegments.length == 0) {
      return BiliRouterPath.home();
    } else {
      return BiliRouterPath.detail();
    }
  }
}

/// BiliRouterDelegate
class BiliRouterDelegate extends RouterDelegate<BiliRouterPath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> navigatorKey;

  BiliRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();
  List<MaterialPage> pages = [];
  VideoModel? videoModel;
  BiliRouterPath? path;

  @override
  Widget build(BuildContext context) {
    pages = [
      pageWrap(
        HomePage(
          onPushDetail: (videoModel) {
            this.videoModel = videoModel;
            notifyListeners();
          },
        ),
      ),
      if (videoModel != null) pageWrap(DetailPage(videoModel: videoModel!)),
    ];

    return Navigator(
      key: navigatorKey,
      pages: pages,
      onDidRemovePage: (page) {
        // 这里可以控制是否可以返回
        if (page.canPop) {}
      },
    );
  }

  @override
  Future<void> setNewRoutePath(BiliRouterPath configuration) async {
    this.path = configuration;
  }
}

pageWrap(Widget child) {
  return MaterialPage(child: child, key: ValueKey(child.hashCode));
}
