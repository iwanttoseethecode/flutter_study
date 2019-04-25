import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('text示例'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球神仙球',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  fontSize: 26.0,
                  decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.dashed,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              RichText(
                text: TextSpan(
                  text: '无形之刃最为致命，开心就好',
                  style: TextStyle(color: Color(0xffff0000),fontSize: 26.0),
                  children: <TextSpan>[
                    TextSpan(
                        text: '提莫队长正在待命！'
                    ),
                    TextSpan(
                        text: '犯我德邦者，虽远必诛！',
                        style: TextStyle(color: Color(0xff0000ff)),
                        recognizer: TapGestureRecognizer()..onTap = () async{
                          String url = 'https://www.dongnaoedu.com/';
                          if(await canLaunch(url)){
                            await launch(url);
                          }else{
                            throw 'error: $url';
                          }
                        }
                    ),
                  ]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
