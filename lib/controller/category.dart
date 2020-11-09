import 'package:http/http.dart' as http;
import 'package:factory_moblie_app/config/config.dart';
import 'package:factory_moblie_app/controller/sharedPreferences.dart';
import 'package:factory_moblie_app/model/factory.dart';
import 'dart:convert';

class Category {

  bool statue;

  create(String name,String slug,String desc)  async {
    await http.post(Config.createCategory, headers: {
      'Accept': 'application/json',
    }, body: {
      "name": name,
      "slug": slug,
      "description": desc
    }).then((response) {
      print('response : ${response.body}');
      Map mapValue = json.decode(response.body);
      var values = mapValue.values.toList();
      statue = response.body.contains('message');
      SharedPreferencesHilper sharedPreferencesHilper = new SharedPreferencesHilper();
      sharedPreferencesHilper.storeToken(values[0]);
    });
  }

  Future<List> getAllCategories() async {
    http.Response response = await http.get(Config.allCategories, headers: {
      'Accept': 'application/json'
    });
    return json.decode(response.body);
  }

  deleteCategoryById(int id) async{
    await http.delete(Config.deleteCategoryById, headers: {
      'Accept': 'application/json'
    }).then((response) {
      print('response : ${response.body}');
      Map mapValue = json.decode(response.body);
      var values = mapValue.values.toList();
      statue = response.body.contains('message');
    });
  }

}