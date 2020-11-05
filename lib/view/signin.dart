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

    // TODO: implement build
    return MaterialApp(
      title: 'Signin',
      home: Scaffold(
        //appBar: AppBar(
        //  title: Text('Signin'),
        //),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 70,left: 15,right: 15,bottom: 8),
            children: <Widget>[
              Container(
                height: 60,
                child: new TextField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'email',
                    icon: new Icon(Icons.email)
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
                      icon: new Icon(Icons.vpn_key)
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 50)),
              Container(
                height: 60,
                child: new RaisedButton(
                  onPressed: _pressed,
                  color: Colors.blueAccent,
                  child: new Text('signin',style: new TextStyle(color: Colors.white,backgroundColor: Colors.blueAccent),),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 50)),
              Container(
                height: 60,
                child: new Text(
                  'message',
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              new Padding(padding: new EdgeInsets.only(top: 50)),
              Container(
                height: 60,
                child: new FlatButton(
                  onPressed: () => Navigator.of(context).push(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new Signup()
                    )
                  ),
                  color: Colors.blueAccent,
                  child: new Text('sign up',style: new TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
          ),
        ),
      );

  }

}