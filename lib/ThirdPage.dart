import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//UI 练习
class ThirdPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI展示界面'),
      ),
      body: _widget,
    );
  }
}

Widget _widget = new Container(
  child: Text(
    '我是Container容器',
    style: TextStyle(color: Colors.white,fontStyle: FontStyle.italic,),),
  alignment: Alignment.center,
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.horizontal(left: Radius.circular(2),right: Radius.circular(10))
  ),
);