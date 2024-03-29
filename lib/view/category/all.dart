import 'package:flutter/services.dart';
import 'package:factory_moblie_app/controller/category.dart';
import 'package:factory_moblie_app/view/pointOfSale/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:convert';

class AllCategory extends StatefulWidget {

  AllCategory({Key key,this.title}) : super(key : key);
  final String title;

  @override
  State<StatefulWidget> createState() => CategoryState();

}

class CategoryState extends State<AllCategory> {

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    var assetsImage = new AssetImage('assets/images/logo.png'); //<- Creates an object that fetches an image.
    var image = new Image(image: assetsImage, fit: BoxFit.cover);

    Category c = Category();

    // TODO: implement build
    return MaterialApp(
      title: 'All Point Of Sale',
      home: Scaffold(
          appBar: AppBar(
            title: Text('All Point Of Sale'),
          ),
          body: new FutureBuilder<List>(
            future: c.getAllCategories(),
            builder: (context ,snapshot){
              if(snapshot.hasError) print(snapshot.error);
              var list = snapshot.data;
              return snapshot.hasData
                  ? new ListView.builder(
                  itemCount: list==null?0:list.length,
                  itemBuilder: (context,i){
                    return new Container(
                        margin: const EdgeInsets.all(5.0),
                        padding: const EdgeInsets.all(5),
                        child: new Card(
                          child: new ListTile(
                            leading: image,
                            title: new Text(list[i]['name'],style: new TextStyle(fontSize: 15)),
                            subtitle: new Text(list[i]['slug'],style: new TextStyle(fontSize: 12)),
                            trailing:  RaisedButton(
                              onPressed: () => Navigator.of(context).push(
                                  new MaterialPageRoute(
                                      builder: (BuildContext context) => new View(list:list , index:i)
                                  )
                              ),
                              color: new Color(4280381900),
                              child: new Text('More',style: new TextStyle(color: Colors.white,fontSize: 12)),
                            ),
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