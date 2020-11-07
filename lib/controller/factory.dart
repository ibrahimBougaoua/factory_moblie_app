import 'package:http/http.dart' as http;
import 'package:factory_moblie_app/config/config.dart';
import 'package:factory_moblie_app/controller/sharedPreferences.dart';
import 'package:factory_moblie_app/model/factory.dart';
import 'dart:convert';

class Factory {

  bool statue;

  create(String name,String desc,String phone,String logo,String id)  async {
    await http.post(Config.createFactory, headers: {
      'Accept': 'application/json',
    }, body: {
      "name": name,
      "desc": desc,
      "phone": phone,
      "logo": logo,
      "employee_id": id,
    }).then((response) {
      print('response : ${response.body}');
      Map mapValue = json.decode(response.body);
      var values = mapValue.values.toList();
      statue = response.body.contains('message');
      SharedPreferencesHilper sharedPreferencesHilper = new SharedPreferencesHilper();
      sharedPreferencesHilper.storeToken(values[0]);
    });
  }

  Future<List<FactoryModel>> getAllFactorisById() async {
    http.Response response = await http.get(Config.allFactories, headers: {
      'Accept': 'application/json'
    });

    Map mapValue = json.decode(response.body);
    final elments = mapValue.values.toList();
    print(elments[0]);

    for(var i = 0;i<elments.length;i++)
      {
        print(elments[i]);
      }

    return json.decode(response.body);
  }

}