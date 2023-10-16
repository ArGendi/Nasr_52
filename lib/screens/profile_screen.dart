import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  double width = 100;
  double height = 100;
  bool changeColor = false;
  double opacityPercent = 1;
  bool reverse = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: opacityPercent,
              child: Container(
                width: 100,
                height: 100,
                color:Colors.red,
              ),
            ),
            TextButton(
              onPressed: (){
                setState(() {
                  opacityPercent = 0;
                });
              }, 
              child: Text("Change container"),
            ),
            Hero(
              tag: 'myContainer',
              child: Container(
                width: 200,
                height: 200,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 10,),
            Text(
              "Welcome to my profile",
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            IconButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              icon: Icon(Icons.arrow_back_ios),
            )
          ],
        ),
      ),
    );
  }
}