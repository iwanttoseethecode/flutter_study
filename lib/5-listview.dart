import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView示例'),
        ),
        body:
//        new NormalListView(),
//          new HorizontalListView(),
          ListView.builder(itemCount: 50,itemBuilder: (context,index){
            print(index);
            if(index.isOdd){
              return Divider();
            }
            return ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text('favorite_border'),
              subtitle: Text('$index'),
              trailing: Icon(Icons.arrow_forward_ios),
            );
          })
      ),
    );
  }
}

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(60, (index){
        return Text('$index',style: TextStyle(fontSize: 20.0),);
      }),
    );
  }
}

class NormalListView extends StatelessWidget {
  const NormalListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.favorite_border),
          title: Text('favorite_border'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
