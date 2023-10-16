import 'package:flutter/material.dart';
import 'package:flutter_nasr_52_multiple_pages/screens/profile_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.network(
              "https://lottie.host/76c34c52-6f3f-4d32-8706-2c20c107d291/VKb9YJEwL1.json",
              width: 100,
            ),
            Hero(
              tag: 'myContainer',
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Home Screen",
              style: TextStyle(
                fontSize: 24,
              ),
            ).animate().moveX(duration: Duration(seconds: 3)),
            TextButton(
              onPressed: (){
                //Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                Navigator.push(context, PageTransition(child: ProfileScreen(), type: PageTransitionType.bottomToTop));
              }, 
              child: Text("Go to your profile"),
            )
          ],
        )
      ),
    );
  }
}