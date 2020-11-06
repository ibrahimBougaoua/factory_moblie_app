import 'package:flutter/material.dart';
import 'package:factory_moblie_app/controller/api.dart';
import 'package:factory_moblie_app/view/signin.dart';
import 'package:factory_moblie_app/view/signup.dart';
import 'package:factory_moblie_app/view/home.dart';
import 'package:factory_moblie_app/view/factory/create.dart';

void main() async {
  Api i = new Api();
  i.signin('adminstrator@gmail.comd','dddd');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String title = '';
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Colors.amber
      ),
        home: Signin(title: 'Signin'),
        routes: <String,WidgetBuilder>{
          '/signin' : (BuildContext context) => Signin(title:title),
          '/signup' : (BuildContext context) => Signup(title:title),
          '/home' : (BuildContext context) => Home(title:title),
          '/createfactory' : (BuildContext context) => Create(title:title),
        }
    );
  }
}