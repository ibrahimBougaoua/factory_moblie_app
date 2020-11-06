import 'package:flutter/services.dart';
import 'package:factory_moblie_app/controller/api.dart';
import 'package:factory_moblie_app/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signin extends StatefulWidget {

  Signin({Key key,this.title}) : super(key : key);
  final String title;

  @override
  State<StatefulWidget> createState() => SigninState();

}

class SigninState extends State<Signin> {

  Api i = new Api();

  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();

  _pressed(){
    setState(() {
      if(email.text.trim().toLowerCase().isNotEmpty && password.text.trim().toLowerCase().isNotEmpty)
        {
          i.signin(email.text.trim().toLowerCase(), password.text.trim()).whenComplete((){
            if(i.statue)
              {
                print('okkkkkkkkkkkkkkkkkk');
              } else {
                Navigator.pushReplacementNamed(context, '/signin');
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
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'email',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.email,color: Colors.white)
                  ),
                ),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: password,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'password',
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
                  child: new Text('Sign in',style: new TextStyle(color: Colors.white)),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 30)),
              Container(
                height: 40,
                child: new FlatButton(
                  onPressed: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Signup()
                    )
                  ),
                  child: new Text('Do you have an account ? Sign up.',style: new TextStyle(color: Colors.white),),
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