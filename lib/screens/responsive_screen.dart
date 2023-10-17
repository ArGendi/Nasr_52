import 'package:flutter/material.dart';

class ResponsiveScreen extends StatefulWidget {
  const ResponsiveScreen({super.key});

  @override
  State<ResponsiveScreen> createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * 0.75,
              height: 150 ,
              color: Colors.green,
            ),
            Container(
              width: 200,
              height: 150,
              color: Colors.red,
            ),
            Container(
              width: 200,
              height: 150,
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(
                width: size.width,
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text("Hello"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}