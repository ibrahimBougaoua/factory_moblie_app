import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:factory_moblie_app/controller/factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class All extends StatefulWidget {

  All({Key key,this.title}) : super(key : key);
  final String title;

  @override
  State<StatefulWidget> createState() => AllState();

}

class AllState extends State<All> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    var assetsImage = new AssetImage('assets/images/logo.png'); //<- Creates an object that fetches an image.
    var image = new Image(image: assetsImage, fit: BoxFit.cover);


    // TODO: implement build
    return MaterialApp(
      title: 'All factories',
      home: Scaffold(
        //appBar: AppBar(
        //  title: Text('Signin'),
        //),
        body: Container(
          decoration: new BoxDecoration(color: new Color(4280381900)),
          child: ListView(
            children: <Widget>[

            ],
          ),
        ),
      ),
    );

  }

}