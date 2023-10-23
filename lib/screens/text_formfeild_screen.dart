import 'package:flutter/material.dart';

class TextFormFieldScreen extends StatefulWidget {
  const TextFormFieldScreen({super.key});

  @override
  State<TextFormFieldScreen> createState() => _TextFormFieldScreenState();
}

class _TextFormFieldScreenState extends State<TextFormFieldScreen> {
  bool hidden = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? email;
  String? pass;

  @override
  Widget build(BuildContext context) {
     var screenSize = MediaQuery.of(context).size; // variable knows screen size (width and height)
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField( // email textfield
                  onSaved: (value){
                    email = value;
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter your email';
                    }
                    else if(!value.contains('@') || !value.contains(".com")){
                      return 'Invaled Email';
                    }
                    else{
                      return null;
                    }
                  },
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
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.red,
                      )
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.red,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                
                TextFormField( // password textfield
                  onSaved: (value){
                    pass = value;
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter password';
                    }
                    else if(value.length < 6){
                      return 'Weak password';
                    }
                    else{
                      return null;
                    }
                  },
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
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.red,
                      )
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Colors.red,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                SizedBox(
                  width: screenSize.width * 0.75, // width = 75% of screen width
                  child: ElevatedButton(
                    onPressed: (){
                      bool valid = formKey.currentState!.validate();
                      if(valid){
                        formKey.currentState!.save();
                        print("$email , $pass");
                        Navigator.pushNamed(context, "home");
                      }
                      
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
      ),
    );
  }
}