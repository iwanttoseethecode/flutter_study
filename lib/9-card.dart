import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'materialApp',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Card示例'),
        leading: Icon(Icons.payment,color: Colors.red,),
      ),
      body: ListView(
        children: <Widget>[
          MyCard(),
          MyCard(),
          MyCard(),
          MyCard(),
        ],
      ),
    );
  }
}

class MyCard extends StatelessWidget {
  const MyCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(const Radius.circular(20.0))
        ),
        child:Card(
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/images/rose720.jpg',
                width: double.infinity,
                height: 150.0,
                fit: BoxFit.cover,
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      child: Icon(Icons.home),
                    ),
                  ),
                  Expanded(child: Column(
                    children: <Widget>[
                      Text('棒棒的',style: TextStyle(fontSize: 20.0),),
                      Text('555',style: TextStyle(fontSize: 14.0),),
                    ],
                  ),),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.favorite,color: Colors.red,),
                        Text('66',style: TextStyle(fontSize: 14.0),),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}
