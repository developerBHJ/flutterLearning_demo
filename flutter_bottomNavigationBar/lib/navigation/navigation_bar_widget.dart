import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatefulWidget {
  /// 页面数组
  final List<Widget> pages;
  /// 底部标题
  final List<String> labels;
  /// 导航栏的图标-未选中
  final List<Widget> icons;
  /// 导航栏的图标-选中
  final List<Widget>? activeIcons;
  /// 点击事件
  final ValueChanged<int>? onTapped;
  /// 选中下标
  int? currentIndex;

  NavigationBar({
    required this.pages,
    required this.labels,
    required this.icons,
    this.activeIcons,
    this.onTapped,
    this.currentIndex,
  });

  @override
  State<StatefulWidget> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          children: widget.pages,
          index: widget.currentIndex ?? 0,
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _bottomBarItems(),
          currentIndex: widget.currentIndex ?? 0,
          // selectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.redAccent),
          // unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.grey),
          selectedIconTheme: IconThemeData(color: Colors.redAccent),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          onTap: (index) {
            setState(() {
              widget.currentIndex = index;
              widget.onTapped?.call(index);
              setState(() {});
            });
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomBarItems() {
    List<BottomNavigationBarItem> items = [];
    for (int i = 0; i < widget.pages.length; i++) {
      items.add(
        BottomNavigationBarItem(
          icon: widget.icons[i],
          label: widget.labels[i],
          activeIcon: widget.activeIcons?[i],
        ),
      );
    }
    return items;
  }
}
