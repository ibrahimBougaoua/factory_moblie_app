import 'package:flutter/services.dart';
import 'package:factory_moblie_app/controller/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Create extends StatefulWidget {

  Create({Key key,this.title}) : super(key : key);
  final String title;

  @override
  State<StatefulWidget> createState() => CreateState();

}

class CreateState extends State<Create> {

  Api i = new Api();

  final TextEditingController name = new TextEditingController();
  final TextEditingController desc = new TextEditingController();
  final TextEditingController phone = new TextEditingController();

  _pressed(){
    setState(() {
      if(name.text.trim().toLowerCase().isNotEmpty && desc.text.trim().toLowerCase().isNotEmpty && phone.text.trim().toLowerCase().isNotEmpty)
      {
        i.createFactory(name.text.trim().toLowerCase(), desc.text.trim(), phone.text.trim(),'logo',1).whenComplete((){
          if(i.statue)
          {
            print('okkkkkkkkkkkkkkkkkk');
          } else {
            Navigator.pushReplacementNamed(context, '/home');
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
                      icon: new Icon(Icons.email,color: Colors.white)
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
              Container(
                height: 60,
                child: new TextField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Phone',
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