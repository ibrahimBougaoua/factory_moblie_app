import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHilper {

  _storeToken(String token) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  Future<String> getToken() async
  {
    final prefs = await SharedPreferences.getInstance();
    return prefs.get('token');
  }

}