import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:folding_cell/folding_cell.dart';
import 'package:factory_moblie_app/controller/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {

  Home({Key key,this.title}) : super(key : key);
  final String title;

  @override
  State<StatefulWidget> createState() => HomeState();

}

class HomeState extends State<Home> {

  Api i = new Api();


  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    var assetsImage = new AssetImage('assets/images/logo.png'); //<- Creates an object that fetches an image.
    var image = new Image(image: assetsImage, fit: BoxFit.cover);

    final _foldingCellKey = GlobalKey<SimpleFoldingCellState>();

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
            scrollDirection: Axis.vertical,
            children: <Widget>[
              Element()
            ],
          ),
        ),
      ),
    );

  }

  Container Element() {
  return Container(
  child: SimpleFoldingCell(
  //key: _foldingCellKey,
  frontWidget: FrontWidget(),
  innerTopWidget: InnerTopWidget(),
  innerBottomWidget: InnerBottomWidget(),
  cellSize: Size(MediaQuery.of(context).size.width,175),
  padding: EdgeInsets.all(10.0),
  animationDuration: Duration(milliseconds: 300),
  borderRadius: 10,
  onOpen: () => print('cell opened'),
  onClose: () => print('cell closed'),
  )
  );
  }

  Container InnerTopWidget() {
    return Container(
      color: Colors.black12,
    );
  }

  Container InnerBottomWidget() {
    return Container(
      color: Colors.brown,
    );
  }

  Container FrontWidget()
  {
    return Container(
      color: Colors.indigo,
      alignment: Alignment.center,
      child: Row(children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.amber
            ),
          ),
        ), Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white
            ),
          ),
        ),
      ],),
    );
  }

}