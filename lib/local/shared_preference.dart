import 'package:shared_preferences/shared_preferences.dart';

class MySharedPref{
  static late SharedPreferences sharedPreferences;

  static void init() async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void saveEmail(){
    sharedPreferences.setString('email', 'abdo@gmail.com');
  }

  static String? getEmail(){
    return sharedPreferences.getString('email');
  }
}