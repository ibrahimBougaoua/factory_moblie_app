import 'package:http/http.dart' as http;
import 'package:factory_moblie_app/config/config.dart';
import 'package:factory_moblie_app/controller/sharedPreferences.dart';
import 'package:factory_moblie_app/model/factory.dart';
import 'dart:convert';

class PointOfSale {

  bool statue;

  create(String name,String address,String factory_id)  async {
    await http.post(Config.createPointOfSale, headers: {
      'Accept': 'application/json',
    }, body: {
      "name": name,
      "address": address,
      "factory_id": factory_id,
    }).then((response) {
      print('response : ${response.body}');
      Map mapValue = json.decode(response.body);
      var values = mapValue.values.toList();
      statue = response.body.contains('message');
      SharedPreferencesHilper sharedPreferencesHilper = new SharedPreferencesHilper();
      sharedPreferencesHilper.storeToken(values[0]);
    });
  }

  Future<List> getAllPointOfSaleById() async {
    http.Response response = await http.get(Config.allPointOfSales, headers: {
      'Accept': 'application/json'
    });
    return json.decode(response.body);
  }

  deletePointOfSaleById(int id) async{
    await http.delete(Config.deletePointOfSaleById, headers: {
      'Accept': 'application/json'
    }).then((response) {
      print('response : ${response.body}');
      Map mapValue = json.decode(response.body);
      var values = mapValue.values.toList();
      statue = response.body.contains('message');
    });
  }

}