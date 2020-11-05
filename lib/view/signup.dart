import 'package:factory_moblie_app/controller/api.dart';
import 'package:factory_moblie_app/view/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Signup extends StatefulWidget {

  Signup({Key key,this.title}) : super(key : key);
  final String title;

  @override
  State<StatefulWidget> createState() => SignupState();

}

class SignupState extends State<Signup> {

  Api i = new Api();

  final TextEditingController first_name = new TextEditingController();
  final TextEditingController last_name = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController gender = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController city = new TextEditingController();
  final TextEditingController address = new TextEditingController();

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

  int _value = 1;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Signin',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Signin'),
        ),
        body: Container(
          child: ListView(
            padding: const EdgeInsets.only(top: 70,left: 15,right: 15,bottom: 8),
            children: <Widget>[
              Container(
                height: 60,
                child: new TextField(
                  controller: first_name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'first name',
                      hintText: 'first name',
                      icon: new Icon(Icons.title)
                  ),
                ),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: last_name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'last name',
                      hintText: 'last name',
                      icon: new Icon(Icons.title)
                  ),
                ),
              ),
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
              Container(
                height: 60,
                child: DropdownButton(
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("man"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("woman"),
                        value: 2,
                      )
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    }),
              ),Container(
                height: 60,
                child: DropdownButton(
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text("man"),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text("woman"),
                        value: 2,
                      )
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    }),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: phone,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'phone',
                      hintText: 'phone',
                      icon: new Icon(Icons.title)
                  ),
                ),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: address,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'address',
                      hintText: 'address',
                      icon: new Icon(Icons.title)
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 50)),
              Container(
                height: 60,
                child: new RaisedButton(
                  onPressed: _pressed,
                  color: Colors.blueAccent,
                  child: new Text('signun',style: new TextStyle(color: Colors.white,backgroundColor: Colors.blueAccent),),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 50)),
              Container(
                height: 60,
                child: new FlatButton(
                  onPressed: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Signin()
                      )
                  ),
                  color: Colors.blueAccent,
                  child: new Text('sign in',style: new TextStyle(color: Colors.white),),
                ),
              ),
              Container(
                height: 60,
                child: new Text(
                  'message',
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