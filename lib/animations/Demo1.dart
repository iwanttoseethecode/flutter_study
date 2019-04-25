import 'package:flutter/material.dart';

void main() => runApp(SnackBarDemo());

class SnackBarDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SncakBar Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SnackBar Demo'),
        ),
        body: SnackBarPage(),
      ),
    );
  }
}

class SnackBarPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child:FlatButton(
          onPressed: (){
            SnackBar snackBar = SnackBar(
              content: Text('Yay! A SnackBar!'),
              action: SnackBarAction(
                  label: 'Undo',
                  onPressed: (){

                  },
              ),
            );
            
            Scaffold.of(context).hideCurrentSnackBar();

            Scaffold.of(context).showSnackBar(snackBar);
            
          },
          child: Text('Show SnackBar'),
      ),
    );
  }

}