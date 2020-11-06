import 'package:flutter/services.dart';
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

  List<String> options = <String>['man', 'woman'];
  String dropdownValue = 'man';

  List<String> optionsC = <String>['alger','oran','constantine','annaba','blida','batna','djelfa','setif','sidi bel abbes','biskra','tebessa','el oued','skikda','tiaret','bejaia','tlemcen','ouargla','bechar','mostaganem','bordj bou arreridj','chlef','souk ahras','medea','setif','ouargla','ghardaia','saida','laghouat','m\'Sila','jijel','relizane','guelma','oum el bouaghi','khenchela','m\'sila','mascara','tizi ouzou'];
  String dropdownValueC = 'alger';

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
                  controller: first_name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'First name',
                      hintText: 'First name',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.texture,color: Colors.white)
                  ),
                ),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: last_name,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Last name',
                      hintText: 'Last name',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.texture,color: Colors.white)
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
                      hintText: 'Email',
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
                      hintText: 'Password',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.vpn_key,color: Colors.white)
                  ),
                ),
              ),
              Container(
                //alignment: Alignment.center,
                //color: Colors.white,
                padding: const EdgeInsets.only(top: 20,left: 40,right: 0,bottom: 0),
                child: DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  style: TextStyle(color: Colors.blue),
                  selectedItemBuilder: (BuildContext context) {
                    return options.map((String value) {
                      return Text(
                        dropdownValue,
                        style: TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                  items: options.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                width: 0,
                height: 0,
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.only(top: 0),
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.merge_type,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),

              Container(
                //alignment: Alignment.center,
                //color: Colors.white,
                padding: const EdgeInsets.only(top: 20,left: 40,right: 0,bottom: 0),
                child: DropdownButton<String>(
                  value: dropdownValueC,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValueC = newValue;
                    });
                  },
                  style: TextStyle(color: Colors.blue),
                  selectedItemBuilder: (BuildContext context) {
                    return optionsC.map((String value) {
                      return Text(
                        dropdownValueC,
                        style: TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                  items: optionsC.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                width: 0,
                height: 0,
                margin: EdgeInsets.all(2),
                padding: EdgeInsets.only(top: 0),
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.location_city,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: phone,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      hintText: 'Phone',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.phone_iphone,color: Colors.white)
                  ),
                ),
              ),
              Container(
                height: 60,
                child: new TextField(
                  controller: address,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'Address',
                      hintText: 'Address',
                      labelStyle: TextStyle(color: Colors.white,),
                      icon: new Icon(Icons.add_location,color: Colors.white)
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 50)),
              Container(
                height: 50,
                child: new RaisedButton(
                  onPressed: _pressed,
                  color: Colors.blueAccent,
                  child: new Text('Sign un',style: new TextStyle(color: Colors.white),),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 30)),
              Container(
                height: 60,
                child: new FlatButton(
                  onPressed: () => Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => new Signin()
                      )
                  ),
                  child: new Text('Do you have an account ? Sign in',style: new TextStyle(color: Colors.white),),
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