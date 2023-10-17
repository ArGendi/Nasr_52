import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin{
  double width = 100;
  double height = 100;
  bool changeColor = false;
  double opacityPercent = 1;
  bool reverse = false;
  late AnimationController controller;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    
    controller = AnimationController(
      vsync: this, 
      duration: Duration(seconds: 2),
    );
    animation = Tween<Offset>(
      begin: Offset(-3,0),
      end: Offset(0,0),
    ).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
       body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SlideTransition(
              position: animation,
              child: Container(
                width: 100,
                height: 100,
                color:Colors.red,
              ),
            ),
            IconButton(
              onPressed: (){
                controller.forward();
              }, 
              icon: Icon(Icons.play_arrow),
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
            ),

          ],
        ),
      ),
    );
  }
}