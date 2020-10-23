import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHilper {

  storeToken(String token) async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

   getToken() async
  {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.get('token'));
  }

}