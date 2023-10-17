import 'package:flutter/material.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/home_screen.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/profile_screen.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/responsive_screen.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/splash_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => ResponsiveScreen(),
        'splash' : (context) => SplashScreen(),
        'home': (context) => HomeScreen(),
        'profile': (context) => ProfileScreen(),
      },
    );
  }
}