import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int number = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: AppBar(
        title: Text("第二个界面"),
      ),
      body: RaisedButton(
        onPressed: () {
          Navigator.pop(context,102);
        },
        child: Text("接收的数据：$number,点击退回"),
      ),
    );
  }
}
