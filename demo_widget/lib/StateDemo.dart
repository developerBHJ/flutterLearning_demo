import 'package:demo_widget/ProviderDemo.dart';
import 'package:flutter/material.dart';

class StateDemoList extends StatelessWidget{
  const StateDemoList({super.key});
  @override
  Widget build(BuildContext context) {
    final List<String> list = ["setState","InheritedWidget","Provider","Riverpod","Bloc"];
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('状态管理'),
      ),
      body: ListView(
        children: [
          for (var title in list)
            ListTile(title: Text(title),
              trailing: IconButton(onPressed: () => {
                this.onToDemoPage(context,title),
              }, icon: Icon(Icons.arrow_forward_ios)),
            )
        ],
      ),
    );
  }

  void onToDemoPage(BuildContext context,String title){
    if (title == "Provider"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage()));
    }else if (title == "Riverpod"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage()));
    }else if (title == "Bloc"){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage()));
    }
  }
}