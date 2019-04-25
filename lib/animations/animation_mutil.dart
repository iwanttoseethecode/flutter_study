import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return HomeApp();
  }

}

class HomeApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return HomeAppState();
  }

}

class HomeAppState extends State<HomeApp> with TickerProviderStateMixin{

  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
    );
    animation = new CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceInOut
    )..addStatusListener((AnimationStatus status){
      if(status == AnimationStatus.dismissed){
        animationController.forward();
      }else if(status == AnimationStatus.completed){
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
        child: AnimationText(animation),
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

class AnimationText extends AnimatedWidget{
  static final _sizeTween = new Tween(begin: 0.0,end: 440.0);
  static final _opacityTween = new Tween(begin: 0.1,end: 1.0);

  AnimationText(Animation<double> animation): super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Image.asset(
        'images/meinv2.jpg',
        width: _sizeTween.evaluate(animation),
        height: _sizeTween.evaluate(animation),
      ),
    );
  }

}