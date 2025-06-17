import 'package:flutter/material.dart';


// TODO: 状态管理
// TODO: 1 Widget 管理自己的状态
/*
Widget 管理子Widget状态
混合管理（父Widget和子Widget都管理状态）
如果是用户数据（复选框选中、滑块位置等）：最好由父Widget 管理
如果是有关界面效果的（例如颜色、动画）最好由Widget自己管理
如果某个状态是由不同Widget共享的最好由父Widget管理

在Widget内部管理状态封装性会好点，而在父Widget中管理会比较灵活，不确定的时候推荐首选父Widget管理状态
 */
class TapBoxA extends StatefulWidget{
  const TapBoxA({Key? key}): super(key: key);

  @override
  State<StatefulWidget> createState() => _TapBoxAState();
}

class _TapBoxAState extends State<TapBoxA>{
  bool _active = false;
   void _handleTap(){
     setState(() {
       _active = !_active;
     });
   }

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(_active ? 'Active' : 'InActive',
            style: TextStyle(fontSize: 16,color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}

// TODO: 2 父Widget 管理状态
class TapBoxB extends StatelessWidget{
  const TapBoxB({Key? key,this.active = false,required this.onChanged});
  final bool active;
  final ValueChanged<bool> onChanged;

  void handleTap(){
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: handleTap,
      child: Container(
        child: Center(
          child: Text(active ? 'Active' : 'InActive',style: TextStyle(
            fontSize: 16,color: Colors.white
          ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget{
  const ParentWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ParentState();
}

class _ParentState extends State<ParentWidget>{

  bool _active = false;

  void _handleTapBoxBChanged(bool value){
    setState(() {
      _active = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: TapBoxB(
        active: _active,
        onChanged: _handleTapBoxBChanged,
      ),
    );
  }
}
// TODO: 3 混合状态管理
class TapBoxC extends StatefulWidget{
  const TapBoxC({super.key,required this.active,required this.onChanged});
  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  State<StatefulWidget> createState() => _TapBoxCState();
}

class _TapBoxCState extends State<TapBoxC>{

  bool _hilighted = false;

  void _handleTapDown(TapDownDetails details){
    setState(() {
      _hilighted = true;
    });
  }

  void _handleTapUp(TapUpDetails details){
    setState(() {
      _hilighted = false;
    });
  }

  void _handleTapCancel(){
    setState(() {
      _hilighted = false;
    });
  }

  void _handleTap(){
    setState(() {
      widget.onChanged(!widget.active);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      onTapUp: _handleTapUp,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      child: Container(
        child: Center(
          child: Text(widget.active ? 'Active' : 'InActive',style: TextStyle(
              fontSize: 16,color: Colors.white
          ),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: BoxDecoration(
            color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _hilighted ? Border.all(color: Colors.yellow,width: 5) : null
        ),
      ),
    );
  }
}

class ParentWidgetC extends StatefulWidget{
  const ParentWidgetC({super.key});
  @override
  State<StatefulWidget> createState() => _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC>{
  bool _active = false;
  void _handleTapBoxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Center(
        child: TapBoxC(active: _active,
            onChanged: _handleTapBoxChanged),
      ),
        width: 200,
      height: 200,
    );
  }
}

// TODO: 4 全局状态管理 Provider： ProductListPage
/*
组件开发
Provider ： google官方推荐的状态管理工具，基于InheritedWidget,
简化了共享状态的代码
 */
// TODO: 5 全局状态管理:Riverpod
/*
Provider 的升级版，支持更好的类型安全和全局状态管理
不依赖 BuildContext。更灵活
 */
// TODO: 6 全局状态管理: Bloc
/*
基于事件驱动的状态管理
适合管理复杂的业务逻辑
 */

