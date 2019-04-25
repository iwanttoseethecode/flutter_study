import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeAppState();
  }

}

class HomeAppState extends State<HomeApp> with TickerProviderStateMixin{

  double animationValue = 100.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation_widget'),
      ),
      body: Column(
        children: <Widget>[
          AnimatedContainer(
            curve: Curves.bounceInOut,
            duration: Duration(milliseconds: 3000),
            child:Image.asset('images/meinv2.jpg',width: 300.0,height: 200.0,),
            padding:EdgeInsets.only(bottom: animationValue),
          ),
          RaisedButton(
            child: Text('开始'),
            onPressed: (){
              setState(
                  () => animationValue = animationValue == 0 ? 100.0 : 0.0
              );
            },
          )
        ],
      ),
    );
  }

}