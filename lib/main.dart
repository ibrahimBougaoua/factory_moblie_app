import 'package:flutter/material.dart';
import 'package:factory_moblie_app/controller/api.dart';
import 'package:factory_moblie_app/controller/factory.dart';
import 'package:factory_moblie_app/view/signin.dart';
import 'package:factory_moblie_app/view/signup.dart';
//import 'package:factory_moblie_app/view/home.dart';
import 'package:factory_moblie_app/view/factory/create.dart';
import 'package:factory_moblie_app/view/factory/all.dart';
import 'package:factory_moblie_app/view/pointOfSale/all.dart';
import 'package:factory_moblie_app/view/pointOfSale/create.dart';

import 'screen.dart';
import 'home.dart';

void main() async {

  //Api i = new Api();
  //i.signin('adminstrator@gmail.comd','dddd');

  //Factory f = new Factory();
  //f.create('name','desc','phone','logo','1');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //final String title = '';
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      Scaffold(
      body: Stack(
        children: <Widget>[
          Screen(),
          Home(),
        ],
      ),
    ),
    );

//    return MaterialApp(
//      title: 'Flutter',
//        theme: ThemeData(
//        primaryColor: Colors.amber
//      ),
//        home: Signin(title: 'Signin'),
//        routes: <String,WidgetBuilder>{
//          '/signin' : (BuildContext context) => Signin(title:title),
//          '/signup' : (BuildContext context) => Signup(title:title),
//          '/home' : (BuildContext context) => Home(title:title),
//          '/createfactory' : (BuildContext context) => Create(title:title),
//          '/all' : (BuildContext context) => All(title:title),
//          '/allPointOfSale' : (BuildContext context) => AllPointOfSale(),
//          '/createPointOfSale' : (BuildContext context) => CreatePointOfSale(),
//        }
//    );
  }
}