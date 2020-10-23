import 'package:flutter/material.dart';
import 'package:factory_moblie_app/controller/api.dart';

void main() async {
  Api i = new Api();
  //i.signin();
  runApp(
    Center(
      child: Text(
        'Hello, world!',
        textDirection: TextDirection.ltr,
      ),
    ),
  );
}