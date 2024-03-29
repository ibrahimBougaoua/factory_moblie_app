import 'package:http/http.dart' as http;
import 'package:factory_moblie_app/config/config.dart';
import 'dart:convert';

class Api {

  bool statue;

   signin(String email,String password)  async {
    await http.post(Config.signin, headers: {
      'Accept': 'application/json',
    }, body: {
      "email": email,
      "password": password
    }).then((response) {
      print('response : ${response.body}');
      Map mapValue = json.decode(response.body);
      var values = mapValue.values.toList();
      statue = response.body.contains('message');
    });
  }

  void signup() {
    http.post(Config.signup, headers: {
      'Accept': 'application/json',
    }, body: {
      "email": "mohammed.essa@gmail.com",
      "password": "123456"
    }).then((response) {
      print('response : ${response.body}');
      Map mapValue = json.decode(response.body);
      mapValue.values.toString();
    });
  }

  Future<List> getAllFactoris() async {
    http.Response response = await http.get(Config.factoris, headers: {
      'Accept': 'application/json',
      'token': 'jhkhlhlhlhlhlkhlkhlh'
    });
    return json.decode(response.body);
  }

  void addData() {
    String url = "http://192.168.43.233:5001/signin";
    http.post(url, headers: {
      'Accept': 'application/json',
      'token': 'jhkhlhlhlhlhlkhlkhlh'
    },
        body: {
          'element': 'ggggg'
        }).then((response) {
      print('response : ${response.body}');
    });
  }

  void editData(int id) {
    String url = "http://192.168.43.233:5001/signin/$id";
    http.put(url, headers: {
      'Accept': 'application/json',
      'token': 'jhkhlhlhlhlhlkhlkhlh'
    },
        body: {
          'element': 'ggggg'
        }).then((response) {
      print('response : ${response.body}');
    });
  }

  void deleteData(int id) {
    String url = "http://192.168.43.233:5001/signin/$id";
    http.delete(url, headers: {
      'Accept': 'application/json',
      'token': 'jhkhlhlhlhlhlkhlkhlh'
    }).then((response) {
      print('response : ${response.body}');
    });
  }

}