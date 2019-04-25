import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeAppState();
  }
}

class HomeAppState extends State<HomeApp> with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    animation = new Tween(
      begin: 0.0,
      end: 400.0,
    ).animate(animationController)
      ..addListener(() {
        setState(() {
          print('dongnao ${animation.value}');
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation'),
      ),
      body: Center(
        child: Image.asset(
          'images/meinv2.jpg',
          width: animation.value,
          height: animation.value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
          onPressed: (){
            animationController.forward(from: 0.0);
          },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

}