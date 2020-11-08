import 'package:flutter/services.dart';
import 'package:factory_moblie_app/controller/factory.dart';
import 'package:factory_moblie_app/model/factory.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

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

    Factory f = Factory();

    // TODO: implement build
    return MaterialApp(
      title: 'All factories',
      home: Scaffold(
        appBar: AppBar(
          title: Text('All factories'),
        ),
        body: new FutureBuilder<List>(
          future: f.getAllFactorisById(),
          builder: (context ,snapshot){
            if(snapshot.hasError) print(snapshot.error);

            var list = snapshot.data;
            return snapshot.hasData
                ? new ListView.builder(
                itemCount: list==null?0:list.length,
                itemBuilder: (context,i){
                  return new Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new Card(
                        child: new ListTile(
                          title: new Text(list[i]['name']),
                          leading: new Icon(Icons.image),
                          subtitle: new Text('name : ${list[i]['name']}'),
                        ),
                      )
                  );

                }
            )
                : new Center(child: new CircularProgressIndicator(),);
          },
        )
      ),
    );

  }

}