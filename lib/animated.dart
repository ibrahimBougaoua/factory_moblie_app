import 'package:flutter/material.dart';

import 'screen.dart';
import 'home.dart';

class Animated extends StatelessWidget {
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
  }
}