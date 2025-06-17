import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Car with ChangeNotifier {
  final List<String> _items = [];
  List<String> get items => _items;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }
}

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Car>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text("商品列表"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage())
            );
          }, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: ListView(
        children: [
          for (var product in ["商品1", "商品2", "商品3", "商品4"])
            ListTile(
              title: Text(product),
              trailing: ElevatedButton(
                onPressed: () => cart.addItem(product),
                child: Text('加入购物车'),
              ),
            ),
        ],
      ),
    );
  }
}


class CartPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Car>(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("购物车"),
      ),
      body: ListView(
        children: [
          for (var item in cart.items)
            ListTile(
              title: Text(item),
              trailing: ElevatedButton(onPressed: () => cart.removeItem(item), child: Text("删除")),
            )
        ],
      ),
    );
  }
}