import 'package:flutter/material.dart';
import 'package:flutter_app/SecondPage.dart';
import 'package:flutter_app/ThirdPage.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: { //定义路由表
        "third_page":(context)=>ThirdPage(),
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //标题
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                padding: EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Oeschinen Lake Campground',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                'Kandersteg, Switzerland',
                style: TextStyle(color: Colors.grey[500]),
              )
            ]),
          ),
          // Icon(
          //   Icons.star,
          //   color: Colors.red[400],
          // ),
          // Text("41")
          FavoriteWidget()
        ],
      ),
    );

    Column buildButton(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Text(label,
                style: TextStyle(
                    color: color, fontSize: 12.0, fontWeight: FontWeight.w400)),
          )
        ],
      );
    }

    //按钮
    Widget buttonSection = new Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildButton(Icons.call, "电话"),
          buildButton(Icons.near_me, '地址'),
          buildButton(Icons.share, '分享')
        ],
      ),
    );
    //文字介绍
    Widget textSection = Container(
      padding: EdgeInsets.all(32.0),
      child: Text(
        '''
        Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              height: 240.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
            new Row(
              children: [
                new TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) {
                              return new SecondPage();
                            },
                            //传递值
                            settings: new RouteSettings(arguments: 100)))
                        .then((value) => Fluttertoast.showToast(
                        msg: '回传的数据：$value', gravity: ToastGravity.BOTTOM));
                  },
                  child: new Text("跳转到下个界面"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
                new TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'third_page');
                  },
                  child: new Text("跳转到第三个界面"),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

//收藏按钮
class FavoriteWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoriteState();
}

class _FavoriteState extends State<FavoriteWidget> {
  var _isFavorite = true;
  int count = 41;

  void toggle() {
    if (_isFavorite) {
      _isFavorite = false;
      count--;
    } else {
      _isFavorite = true;
      count++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: [
        GestureDetector(
          child: Icon(
            _isFavorite ? Icons.star : Icons.star_border,
            color: Colors.red[400],
          ),
          onTap: toggle,
        ),
        Text(count.toString())
      ],
    );
  }
}
