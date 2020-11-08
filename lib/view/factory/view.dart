import 'package:flutter/services.dart';
import 'package:factory_moblie_app/controller/factory.dart';
import 'package:factory_moblie_app/model/factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class View extends StatefulWidget {

  List list;
  int index;
  View({this.index , this.list});

  @override
  State<StatefulWidget> createState() => ViewState();

}

class ViewState extends State<View> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    var assetsImage = new AssetImage('assets/images/logo.png'); //<- Creates an object that fetches an image.
    var image = new Image(image: assetsImage, fit: BoxFit.cover);

    Factory f = Factory();

    // TODO: implement build
    return MaterialApp(
      title: 'Single factory',
      home: Scaffold(
          body:
          Container(
          decoration: new BoxDecoration(color: new Color(4280381900)),
          child: ListView(
          padding: const EdgeInsets.only(top: 60,left: 15,right: 15,bottom: 30),
          children: <Widget>[
            Container(
                child: image
            ),
            Container(
              height: 50,
              child: new ListTile(
                title: Text('Name : ${ widget.list[widget.index]['name']}'),
              ),
            ),
            Container(
              height: 50,
              child: new ListTile(
                title: Text('Destiption : ${ widget.list[widget.index]['desc']}'),
              ),
            ),
            Container(
              height: 50,
              child: new ListTile(
                title: Text('Phone : ${ widget.list[widget.index]['phone']}'),
              ),
            ),
            Container(
              height: 50,
              child: new ListTile(
                title: Text('Created at : ${ widget.list[widget.index]['created_at']}'),
              ),
            ),
          ],
          ),
          ),
      ),
    );

  }

}