
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SimpleDialog(
              title: Text('对话框标题'),
              children: <Widget>[
                SimpleDialogOption(
                  child: Text('选项1'),
                  onPressed: (){
                    print('选项1');
                  },
                ),
                SimpleDialogOption(
                  child: Text('选项2'),
                  onPressed: (){
                    print('选项2');
                  },
                ),
              ],
            ),
            RaisedButton(
              child: Text('删除'),
              onPressed: (){
                showDialog(context: context,builder: (BuildContext context){
                  return AlertDialog(
                    title: Text('提示'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('是否删除？'),
                          Text('删除后不可恢复！'),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('确定'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('取消'),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
