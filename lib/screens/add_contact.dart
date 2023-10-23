import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  String? name;
  String? phone;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  onSaved: (value){
                    name = value;
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter name';
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'name',
                  ),
                ),
                SizedBox(height: 15,),
                TextFormField(
                  onSaved: (value){
                    phone = value;
                  },
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Enter phone';
                    }
                    else if(value.length != 11){
                      return 'Invaled phone number';
                    }
                    else{
                      return null;
                    }
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'phone',
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async{
                    bool valid = formKey.currentState!.validate();
                    if(valid){
                      formKey.currentState!.save();
                      var box = Hive.box('contacts');
                      await box.add({
                        'name' : name,
                        'phone': phone,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green ,content: Text('Added succesfully'),));
                    }
                  },
                  child : Text('add'),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}