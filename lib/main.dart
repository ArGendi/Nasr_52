import 'package:flutter/material.dart';
import 'package:flutter_nasr_52_multiple_pages/local/shared_preference.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/add_contact.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/add_contact_with_sqflite.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/home_screen.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/profile_screen.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/responsive_screen.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/shared_pref_screen.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/show_contact.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/splash_screen.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/text_formfeild_screen.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/textfield_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('contacts');
  MySharedPref.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SharedPrefScreen(),
        'add contact sqflite': (context) => AddContactWithSQFLiteScreen(),
        'add contact': (context) => AddContactScreen(),
        'text form field': (context) => TextFormFieldScreen(),
        'text field': (context) => TextFieldScreen(),
        'responsive': (context) => ResponsiveScreen(),
        'splash' : (context) => SplashScreen(),
        'home': (context) => HomeScreen(),
        'profile': (context) => ProfileScreen(),
      },
    );
  }
}