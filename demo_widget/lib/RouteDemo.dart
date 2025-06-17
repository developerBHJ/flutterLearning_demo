import 'package:flutter/material.dart';

/*
  MaterialPageRoute({
    WidgetBuilder builder,
    RouteSettings settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  })

  builder: 构建路由页面的内容，返回一个Widget实例
  settings：路由的配置信息，比如：路由名称、是否初始路由（首页）等
  maintainState：默认情况下当入栈一个新路由时，原路由仍然会被保留在内存中，如果想在路由没用的时候释放其资源可以设置为false；
  fullscreenDialog：表示新的路由是否是一个全屏的路由
 */
class RouteDemo extends StatelessWidget{
  const RouteDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('RouteDemo'),),
      body: Center(
        child: TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (cotext){
            return NewRoutePage();
          }));
        }, child: Text('Route Test')),
      ),
      );
  }
}

class NewRoutePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Text('This is a route'),
    );
  }
}
// TODO: Route 传值
class TipRoute extends StatelessWidget{
   const TipRoute({super.key,required this.text});
   final String text;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route 传值'),
      ),
      body: Container(
        child: Column(
          children: [
            Text(text),
            ElevatedButton(onPressed: () => {
              Navigator.pop(context,"我是返回值")
            },
                child: Text('返回'))
          ],
        ),
      ),
    );
  }
}


class TipRouteTest extends StatelessWidget{
  const TipRouteTest({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: () async {
        var result = await Navigator.push(context, MaterialPageRoute(builder: (context){
        return TipRoute(text: "我是提示Route测试");
        }));
      }, child: Text('打开提示页')),
    );
  }
}
