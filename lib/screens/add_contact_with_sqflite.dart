import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nasr_52_multiple_pages/cubits/contact_cubit.dart';
import 'package:flutter_nasr_52_multiple_pages/local/my_database.dart';
import 'package:flutter_nasr_52_multiple_pages/models/contact.dart';
import 'package:hive/hive.dart';

class AddContactWithSQFLiteScreen extends StatefulWidget {
  const AddContactWithSQFLiteScreen({super.key});

  @override
  State<AddContactWithSQFLiteScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactWithSQFLiteScreen> {
  Contact contact = Contact();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                    contact.name = value;
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
                  initialValue: '',
                  onSaved: (value){
                    contact.phone = value;
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
                      BlocProvider.of<ContactCubit>(context, listen: false).addContact(contact);
                      formKey.currentState!.reset();
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