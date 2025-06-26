import 'dart:ffi';

import 'package:flutter/material.dart';

/// 路由跳转工具类
class RouterUtil {
  RouterUtil._();

  static final navigatorKey = GlobalKey<NavigatorState>();
  // App 根节点context
  static BuildContext get context => navigatorKey.currentContext!;
  // currentState
  static NavigatorState get state => navigatorKey.currentState!;

  /*
普通动态跳转
page: - 目标页面
fullscreenDialog：
settings：
maintainState
*/
  static Future push(
    BuildContext context,
    Widget page, {
    bool? fullscreenDialog,
    RouteSettings? settings,
    bool maintainState = true,
  }) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => page,
        fullscreenDialog: fullscreenDialog ?? false,
        settings: settings,
        maintainState: maintainState,
      ),
    );
  }

  /*
根据路由name跳转
context：
name: 路由Name
arguments：参数
*/
  static Future pushForName(
    BuildContext context,
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(context, name, arguments: arguments);
  }

  /*
自定义路由跳转
context：
route：
*/
  static Future pushForPageRouter(BuildContext context, Route route) {
    return Navigator.push(context, route);
  }

  /*
  清空栈，只留目标页面
context：
name: 路由Name
arguments：参数
*/
  static Future pushNameAndRemoveUtil(
    BuildContext context,
    String name, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      name,
      (ruote) => false,
      arguments: arguments,
    );
  }

  /*
用新的路由替换当前路由
context：
route：
result：
*/
  static Future pushReplacement(
    BuildContext context,
    Route route, {
    Object? result,
  }) {
    return Navigator.pushReplacement(context, route, result: result);
  }

  /*
用新的路由（名称）替换当前路由
context：
name:
result：
arguments:参数
*/
  static Future pushReplacementNamed(
    BuildContext context,
    String name, {
    Object? result,
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed(
      context,
      name,
      result: result,
      arguments: arguments,
    );
  }

  /*
关闭当前页面
context：
*/
  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  /*
关闭当前页面,带返回值
context：
data: 返回值
*/
  static void popOfData<T extends Object?>(BuildContext context, {T? data}) {
    Navigator.of(context).pop(data);
  }
}
