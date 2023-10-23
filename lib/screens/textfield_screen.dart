import 'package:flutter/material.dart';

class TextFieldScreen extends StatefulWidget {
  const TextFieldScreen({super.key});

  @override
  State<TextFieldScreen> createState() => _TextFieldScreenState();
}

class _TextFieldScreenState extends State<TextFieldScreen> {
  bool hidden = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  List<String> names = ["abdo", "mohamed", "ahmed", "mariam", "mai", "beshoy"];
  List<String> filteredList = [];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size; // variable knows screen size (width and height)
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                filteredList.join(" "),
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20,),
              TextField( // email textfield
                onChanged: (value){
                  // use on change to do search job
                  // filter Names list to get filtered list
                  setState(() {
                    filteredList = names.where((element) => element.contains(value)).toList();
                  });
                },
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              TextField( // password textfield
                controller: passController,
                obscureText: hidden, // password
                keyboardType: TextInputType.text, // keyboard type,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        hidden = !hidden;
                      });
                    },
                    icon: Icon(
                      hidden ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  // contentPadding: EdgeInsets.all(2),
                  //textfield unFocused
                  enabledBorder: OutlineInputBorder(
                    //borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    )
                  ),
                  //textfield Focused
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.black,
                    )
                  ),
                ),
              ),
              SizedBox(height: 15,),
              SizedBox(
                width: screenSize.width * 0.75, // width = 75% of screen width
                child: ElevatedButton(
                  onPressed: (){
                    print(emailController.text);
                    print(passController.text);
                    Future.delayed(Duration(seconds: 3), (){
                      emailController.clear();
                      passController.clear();
                    });
                  }, 
                  child: Text("login"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}