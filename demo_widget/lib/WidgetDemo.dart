import 'package:flutter/material.dart';

// TODO：1、flutter 四棵树
/*
flutter 中widget只是描述一个UI元素的配置信息，真正的布局、绘制由谁来完成？
flutter框架的处理流程如下：
1、根据Widget树生成一个Element树，Element树中的节点都继承自Element类；
2、根据Element树生成Render树（渲染树），Render树中的节点都继承自RenderObject类；
3、根据Render树生成Layer树，然后显示在屏幕上，Layer树中的节点都继承自Layer类

真正的布局和渲染逻辑在Render树中，Element和Widget是RenderObject的粘合剂；

tips:
1、Widget和Element一一对应；但并不和RenderObject一一对应，StatelessWidget和StatefullWidget都没有对应的RenderObject
2、Render树在上屏前会生成一个Layer树
*/

// TODO: 2、StatelessWidget
/*
StatelessWidget 继承自Widget，重写了createElement()方法
StatelessElement 间接继承自Element
 */
class WidgetDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  StatelessElement createElement() {
    return super.createElement();
  }
}
// TODO: 2.1 Context
/*
每个Widget都会对应一个Context，它是BuildContext类的一个实例
它表示当前Widget在Widget树中的上下文；
实际上Context是Widget在Widget树中执行相关操作的句柄；
比如它提供了从当前Widget开始向上遍历Widget树以及按照Widget类型查找父级Widget类的方法：
 */
class ContextDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context 测试'),
      ),
      body: Container(
        child: Builder(builder: (context){
          // 在Widget树中查找父级 Scaffold Widget
          Scaffold? scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
          return (scaffold?.appBar as AppBar).title ?? Text('Context');
        }),
      ),
    );
  }
}

// TODO: 3 StatefullWidget
/*
StatefullWidget 同样继承自Widget，重写了createElement()方法
StatefullElement 间接继承自Element

createState() 方法用于创建StatefullWidget相关的状态
createState() 方法在StatefullWidget声明周期中可能会被多次调用
State 对像和SatefullWidget具有一一对应的关系
 */
class StatefullWidgetDemo extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  StatefulElement createElement() {
    // TODO: implement createElement
    return super.createElement();
  }
}
// TODO: 3.1 State
/*
一个StatefullWidget对应一个State
State中保存的状态：
1、在widget构建时可以被同步读取；
2、在Widget生命周期中可以被改变，当State被改变时，可以手动调用其setState()方法通知Flutter框架状态发生改变；Flutter框架收到消息后会重新调用build方法重建Widget树，从而更新UI
State中有两个常用的属性：
1、Widget：它表示与该State实例关联的widget实例，由flutter框架动态设置。注意这种关联并非永久的。
2、context
 */
class StateDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
// TODO: 3.2 State的生命周期
/*
initState(): 当Widget第一次被插入树中时被调用，对于每一个State，flutter框架只会调用一次；
didChangeDependencies()：当对象的依赖发生改变时被调用；
build()： 主要用于构建Widget，会在以下场景被调用
       1）在调用initState之后；
       2）在调用didUpdateWidget之后；
       3）在调用setState之后；
       4）在调用didChangeDependencies之后
       5）在State对象从树中一个位置移除又重新插入到树的其他位置之后
reassemble(): 此回调专门为开发调试提供；在热重载时被调用，在release模式永远不会被调用；
didUpdateWidget(): 在Widget重新构建时flutter会调用widget.canUpdate来检测widget树中同一个位置的新旧节点，然后决定是否需要更新；
deactivate(): 当State对象从树中被移除时调用
dispose()：当State对象从树中被永久移除时调用，释放资源。
 */
class CounterWidget extends StatefulWidget{
  const CounterWidget({Key? key,this.initValue = 0});

  final int initValue;

  // @override
  // State<StatefulWidget> createState() => _CounterWidgetState();
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _CounterWidgetState extends State<CounterWidget>{

  int _count = 0;
  @override
  void initState() {
    // 初始化
    _count = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text('initState'),),
      body: Center(
        child: TextButton(child: Text('$_count'),onPressed: () => setState(
          () => ++_count,
        )),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    print("didChangeDependencies");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    print("reassemble");
  }

  @override
  void didUpdateWidget(covariant CounterWidget oldWidget) {
    // TODO: implement didUpdateWidget
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    print("deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose");
  }
}
// TODO: 3.3 通过RenderObject自定义Widget
/*
StatelessWidget和StatefullWidget 都用于组合其他组件；他们本身没有对应的RenderObject
 */
class CustomWidget extends LeafRenderObjectWidget{

  @override
  RenderObject createRenderObject(BuildContext context) {
    // TODO: implement createRenderObject
    // 创建 RenderObject
    return RenderCustomObject();
  }

  void updateRenderObject(BuildContext context,RenderCustomObject renderObject){
    // 更新 RenderObject
    super.updateRenderObject(context, renderObject);
  }
}

class RenderCustomObject extends RenderBox{

  @override
  void performLayout() {
    // 布局
    super.performLayout();
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    // 绘制
    super.paint(context, offset);
  }
}



