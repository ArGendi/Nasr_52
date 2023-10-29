import 'package:flutter/material.dart';
import 'package:flutter_nasr_52_multiple_pages/local/shared_preference.dart';

class SharedPrefScreen extends StatefulWidget {
  const SharedPrefScreen({super.key});

  @override
  State<SharedPrefScreen> createState() => _SharedPrefScreenState();
}

class _SharedPrefScreenState extends State<SharedPrefScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: IconButton(
        onPressed: (){
          String? email = MySharedPref.getEmail();
          if(email != null){
            print("Go to home page");
          }
          else{
            print("Go to Login page");
          }
        },
        icon: Icon(Icons.home),
      )),
    );
  }
}