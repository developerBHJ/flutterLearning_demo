import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CommonWidget extends StatefulWidget{

  const CommonWidget({super.key});

  @override
  State<StatefulWidget> createState() => _CommonWidgetState();
}

class _CommonWidgetState extends State<CommonWidget>{
  bool _switchValue = false;
  bool _checkBoxValue = false;
  double _progressValue = 0.3;
  double _progressValue1 = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础组件'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 16, 16, 20),
        child: Column(
          children: [
            // TODO: Text
            Text('这是一个普通文本',style: TextStyle(fontSize: 22,color: Colors.deepOrangeAccent)),
            Spacer(),
            Text.rich(TextSpan(
                children: [
                  TextSpan(text: '这是链接：'),
                  TextSpan(text: 'https://www.baidu.com',style: TextStyle(
                      color: Colors.blue
                  )
                  )
                ]
            )),
            Spacer(),
            ElevatedButton(onPressed: (){}, child: Text('ElevatedButton')),
            Spacer(),
            TextButton(onPressed: (){}, child: Text('TextButton')),
            Spacer(),
            OutlinedButton(onPressed: (){}, child: Text('OutlinedButton')),
            // IconButton
            IconButton(onPressed: (){}, icon: Icon(Icons.account_circle_outlined)),
            // 带图标的按钮
            TextButton.icon(onPressed: (){}, label: Text('TextButton'),icon: Icon(Icons.account_circle),),
            Spacer(),
            Image(image: NetworkImage('http://img1.baidu.com/it/u=3029803730,1839079174&fm=253&app=138&f=JPEG?w=800&h=1422'),height: 40,width: 160,),
            Spacer(),
            Icon(Icons.add_box),
            Spacer(),
            Switch(
                value: _switchValue,
                activeColor: Colors.red,
                activeTrackColor: Colors.grey,
                onChanged: (value){
              setState(() {
                _switchValue = value;
              });
            }),
            Spacer(),
            Checkbox(
                value: _checkBoxValue,
                activeColor: Colors.red,
                onChanged: (value1){
              setState(() {
                _checkBoxValue = value1 ?? false;
              });
            }),
            Spacer(),
            LinearProgressIndicator(
              // value: _progressValue,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
            Spacer(),
            SizedBox(
              child:CircularProgressIndicator(
                value: .5,
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.red),
              ),
              width: 40,
              height: 40,
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}