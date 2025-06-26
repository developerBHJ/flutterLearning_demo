import 'package:bottomnavigationbar/pages/category_page.dart';
import 'package:bottomnavigationbar/pages/home_page.dart';
import 'package:bottomnavigationbar/pages/profile_page.dart';
import 'package:bottomnavigationbar/pages/shop_car_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<StatefulWidget> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    CategoryPage(),
    ShopCarPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: IndexedStack(children: pages, index: currentIndex)),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: _bottomBarItems(),
          currentIndex: this.currentIndex,
          // selectedLabelStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.redAccent),
          // unselectedLabelStyle: TextStyle(fontSize: 14, color: Colors.grey),
          selectedIconTheme: IconThemeData(color: Colors.redAccent),
          unselectedIconTheme: IconThemeData(color: Colors.grey),
          onTap: (index) {
            setState(() {
              this.currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomBarItems() {
    List<BottomNavigationBarItem> items = [];
    items.add(
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: "首页"),
    );
    items.add(
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.search), label: "分类"),
    );
    items.add(
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart),
        label: "购物车",
      ),
    );
    items.add(
      BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.profile_circled),
        label: "我的",
      ),
    );
    return items;
  }
}
