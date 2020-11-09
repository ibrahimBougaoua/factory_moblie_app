import 'package:flutter/services.dart';
import 'package:factory_moblie_app/controller/pointOfSale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreatePointOfSale extends StatefulWidget {

  CreatePointOfSale({Key key,this.title}) : super(key : key);
  final String title;

  @override
  State<StatefulWidget> createState() => CreatePointOfSaleState();

}

class CreatePointOfSaleState extends State<CreatePointOfSale> {

  PointOfSale p = new PointOfSale();

  final TextEditingController name = new TextEditingController();
  final TextEditingController address = new TextEditingController();

  _pressed(){
    setState(() {
      if(name.text.trim().toLowerCase().isNotEmpty && address.text.trim().toLowerCase().isNotEmpty)
      {
        p.create(name.text.trim().toLowerCase(), address.text.trim(),'1').whenComplete((){
          if(p.statue)
          {
            print('okkkkkkkkkkkkkkkkkk');
          } else {
            Navigator.pushReplacementNamed(context, '/allPointOfSale');
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
      title: 'Signin',
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
                      icon: new Icon(Icons.texture,color: Colors.white)
                  ),
                ),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: address,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'Address',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.text_format,color: Colors.white)
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 30)),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: _pressed,
                  color: Colors.blueAccent,
                  child: new Text('Create',style: new TextStyle(color: Colors.white)),
                ),
              ),
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