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
    CurvedAnimation curvedAnimation = new CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceInOut,
    );
    animation = new Tween(
      begin: 0.0,
      end: 400.0,
    ).animate(curvedAnimation)
      ..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.dismissed) {
          animationController.forward();
        } else if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation_widget'),
      ),
      body: Center(
          child:AnimationText(animation),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: (){
            animationController.forward(from:0.0);
          }
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

}

class AnimationText extends AnimatedWidget{

  AnimationText(Animation<double> animation) : super(listenable:animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Image.asset(
      'images/meinv2.jpg',
      width: animation.value,
      height: animation.value,
    );
  }

}