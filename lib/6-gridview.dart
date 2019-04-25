import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('GridView示例'),
          ),
          body:
//        new countGridView(),
              new builderGridView()),
    );
  }
}

class builderGridView extends StatelessWidget {
  const builderGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10),
        itemBuilder: (context, index) {
          print(index);
          return Container(
            color: Colors.red,
            margin: EdgeInsets.all(10.0),
            child: Text(
              '$index',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        });
  }
}

class countGridView extends StatelessWidget {
  const countGridView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.vertical,
      childAspectRatio: 3 / 4,
      children: List.generate(100, (index) {
        print(index);
        return Container(
          color: Colors.red,
          margin: EdgeInsets.all(10.0),
          child: Text(
            '$index',
            style: TextStyle(fontSize: 20.0),
          ),
        );
      }),
    );
  }
}
