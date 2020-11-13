import 'package:factory_moblie_app/config/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor)..rotateY(isOpen? -0.5:0),
      duration: Duration(milliseconds: 250),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              isOpen ?
                 IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
                 setState(() {
                   xOffset = 0;
                   yOffset = 0;
                   scaleFactor = 1;
                   isOpen = false;
              });
              },):
                IconButton(icon: Icon(Icons.menu),onPressed: (){
                setState(() {
                  xOffset = 230;
                  yOffset = 150;
                  scaleFactor = 0.6;
                  isOpen = true;
                });
              },),
              Column(
                children: <Widget>[
                  Text('Location'),
                  Row(
                    children: <Widget>[
                      Icon(Icons.location_on,color: Colors.pink,),
                      Text('Algeria'),
                    ],
                  )
                ],
              ),
              CircleAvatar()
            ],
          ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
            margin: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.search),
                Text('Search...'),
                Icon(Icons.settings)
              ],
            ),
          ),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: Config.images.length,
              itemBuilder: (context,index) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(left: 20,),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))],
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Image.asset(Config.images[index]['iconPath'],
                        height: 58,
                        width: 50,
                        color: Colors.grey,
                        ),
                      ),
                      Text(Config.images[index]['name'])
                    ],
                  ),
                );
              },
            ),
          ),

          Container(
            height: 240,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.blueAccent,borderRadius: BorderRadius.circular(20),boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))]),
                        margin: EdgeInsets.only(top: 40,),
                      ),
                      Align(
                        child: Image.asset('assets/images/logo.png'),
                      )
                    ],
                  ),
                ),
                Expanded(child: Container(
                  margin: EdgeInsets.only(top: 40,bottom: 20),
                  decoration: BoxDecoration(color: Colors.white,
                  boxShadow: [BoxShadow(color: Colors.grey[300], blurRadius: 30, offset: Offset(0, 10))],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                  ),
                  ),
                ),)
              ],
            ),
          )


        ],
      ),
    );
  }

}