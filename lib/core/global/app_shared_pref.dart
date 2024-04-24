import 'package:shared_preferences/shared_preferences.dart';

const String API_TOKEN = "MyToken";

class AppPreferences{

  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  void addToken({required String token}){
    _sharedPreferences.setString(API_TOKEN, token);
  }

  String? getToken(){
    return _sharedPreferences.getString(API_TOKEN);
  }
}