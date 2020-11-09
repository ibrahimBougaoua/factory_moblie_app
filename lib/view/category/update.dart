import 'package:flutter/services.dart';
import 'package:factory_moblie_app/controller/category.dart';
import 'package:factory_moblie_app/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Update extends StatefulWidget {

  Update({Key key,this.title}) : super(key : key);
  final String title;

  @override
  State<StatefulWidget> createState() => UpdateState();

}

class UpdateState extends State<Update> {

  Category c = new Category();

  final TextEditingController name = new TextEditingController();
  final TextEditingController slug = new TextEditingController();
  final TextEditingController desc = new TextEditingController();

  _pressed(){
    setState(() {
      if(name.text.trim().toLowerCase().isNotEmpty && slug.text.trim().toLowerCase().isNotEmpty && desc.text.trim().toLowerCase().isNotEmpty)
      {
        c.update(name.text.trim().toLowerCase(), slug.text.trim(),desc.text.trim(),'1').whenComplete((){
          if(c.statue)
          {
            print('okkkkkkkkkkkkkkkkkk');
          } else {
            Navigator.pushReplacementNamed(context, '/allCategories');
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    var assetsImage = new AssetImage('assets/images/logo.png'); //<- Creates an object that fetches an image.
    var image = new Image(image: assetsImage, fit: BoxFit.cover);

    // TODO: implement build
    return MaterialApp(
      title: 'Update',
      home: Scaffold(
        //appBar: AppBar(
        //  title: Text('Signin'),
        //),
        body: Container(
          decoration: new BoxDecoration(color: new Color(4280381900)),
          child: ListView(
            padding: const EdgeInsets.only(top: 60,left: 15,right: 15,bottom: 30),
            children: <Widget>[
              Container(
                  child: image
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Name',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.email,color: Colors.white)
                  ),
                ),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: slug,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Slug',
                      hintText: 'Slug',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.vpn_key,color: Colors.white)
                  ),
                ),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: desc,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Description',
                      hintText: 'Description',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.vpn_key,color: Colors.white)
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 30)),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: _pressed,
                  color: Colors.blueAccent,
                  child: new Text('Update',style: new TextStyle(color: Colors.white)),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 30)),
              Container(
                height: 40,
                child: new Text(
                  '',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }

}