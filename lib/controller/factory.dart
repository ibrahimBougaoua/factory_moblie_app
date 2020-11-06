import 'package:http/http.dart' as http;
import 'package:factory_moblie_app/config/config.dart';
import 'package:factory_moblie_app/controller/sharedPreferences.dart';
import 'dart:convert';

class Factory {

  void create(String name,String desc,String phone,String logo,int id) {
    http.post(Config.createFactory, headers: {
      'Accept': 'application/json',
      'token': 'jhkhlhlhlhlhlkhlkhlh'
    },
        body: {
          'name': name,
          'desc': desc,
          'phone': phone,
          'logo': logo,
          'employee_id': id,
        }).then((response) {
      print('response : ${response.body}');
    });
  }

}