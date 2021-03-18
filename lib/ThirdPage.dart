import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

//UI 练习
class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UI展示界面'),
      ),
      body: _column,
    );
  }
}

Widget _column = new Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    _container,
    _textWidget,
    _imageWidget,
    Expanded(child: _listView),
  ],
);

Widget _container = new Container(
  width: 100,
  height: 100,
  margin: EdgeInsets.only(top: 20),
  child: Text(
    '我是Container容器',
    style: TextStyle(
      color: Colors.white,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
    ),
  ),
  alignment: Alignment.center,
  padding: EdgeInsets.all(20),
  decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.horizontal(
          left: Radius.circular(10), right: Radius.circular(10))),
);

Widget _textWidget = new Text.rich(new TextSpan(
  style: TextStyle(fontSize: 18.0),
  children: [
    TextSpan(
        text: '我是textSpan，背景色红色',
        recognizer: TapGestureRecognizer()
          ..onTap = () {
            Fluttertoast.showToast(msg: '我被点击了');
          },
        style: TextStyle(
            background: Paint()..color = Colors.red, color: Colors.white)),
    WidgetSpan(
      child: new Padding(
        child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))))),
          child: Text("我是圆角背景"),
        ),
        padding: EdgeInsets.only(left: 8),
      ),
      alignment: PlaceholderAlignment.middle,
      baseline: TextBaseline.ideographic,
    )
  ],
));

Widget _imageWidget = new Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Image.asset('images/lake.jpg', width: 100, height: 100, fit: BoxFit.cover),
    Image.network(
      'http://www.46y.com/upload/13720/2020/05-06/20200506210539_2995vxb5395ir_small.jpg',
      width: 100,
      height: 100,
      fit: BoxFit.scaleDown,
    ),
    FadeInImage.assetNetwork(
      placeholder: 'images/lake.jpg',
      width: 100,
      height: 100,
      fit: BoxFit.cover,
      image:
          'http://www.46y.com/upload/13720/2020/05-06/20200506210539_2995vxb5395ir_small.jpg',
      fadeOutDuration: Duration(milliseconds: 200),
    )
  ],
);

Widget _listView = ListView.separated(
  itemBuilder: (BuildContext context, int index) => ListTile(
    title: Text('我是标题 $index'),
    subtitle: Text('副标题 $index'),
  ),
  itemCount: 50,
  separatorBuilder: (BuildContext context, int index) => index % 2 == 0 ? Divider(color: Colors.grey) : Divider(color: Colors.red),
);
