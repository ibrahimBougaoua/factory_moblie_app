import 'package:factory_moblie_app/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Screen extends StatefulWidget {
  @override
  ScreenState createState() => ScreenState();
}

class ScreenState extends State<Screen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50),
      color: Colors.teal,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Ibrahim Bougaoua',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  Text('Flutter Tech',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
          Column(
              children: Config.listItems.map(
              (e) =>
                Row(
                children: <Widget>[
                  Icon(e['icon'],color: Colors.white,size: 30,),
                  Text(e['title'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))
                ],
                )
              ).toList()
          ),
          Row(
            children: <Widget>[
              Icon(Icons.settings,color: Colors.white,),
              Text('Settings',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
              SizedBox(width: 10,),
              Container(
                height: 20,
                width: 5,
              ),
              SizedBox(width: 10,),
              Text('Log Out',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
    );
  }

}