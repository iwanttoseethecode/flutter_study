import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image示例demo'),
        ),
        body: Center(
          child: Column(
//            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                'http://www.baidu.com/img/bd_logo1.png?where=super',
                width: 100.0,
                height: 100.0,
              ),
              Image.asset(
                'assets/images/rose720.jpg',
                width: 100.0,
                height: 100.0,
              ),
              MemoryImageWidget(),
              FileImageWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FileImageWidget extends StatefulWidget {
  @override
  _FileImageWidgetState createState() => _FileImageWidgetState();
}

class _FileImageWidgetState extends State<FileImageWidget> {
  File imageFile;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: imageFile == null
              ? Text('未选择图片!')
              : Image.file(
                  imageFile,
                  width: 100,
                  height: 100,
                ),
        ),
        FlatButton(
          onPressed: getImage,
          child: Text('选择图片',style: TextStyle(color: Colors.green,fontSize: 20.0)),
        ),
      ],
    );
  }
}

class MemoryImageWidget extends StatefulWidget {
  @override
  _MemoryImageWidgetState createState() => _MemoryImageWidgetState();
}

class _MemoryImageWidgetState extends State<MemoryImageWidget> {
  Uint8List bytes;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/images/rose720.jpg').then((data) {
      if (mounted) {
        setState(() {
          bytes = data.buffer.asUint8List();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final _decoration = BoxDecoration(
        image:
            bytes == null ? null : DecorationImage(image: MemoryImage(bytes)));
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: _decoration,
    );
  }
}
