import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nasr_52_multiple_pages/cubits/contact_cubit.dart';
import 'package:flutter_nasr_52_multiple_pages/models/contact.dart';

class UpdateContactScreen extends StatefulWidget {
  final int index;
  const UpdateContactScreen({super.key, required this.index});

  @override
  State<UpdateContactScreen> createState() => _UpdateContactScreenState();
}

class _UpdateContactScreenState extends State<UpdateContactScreen> {
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
                  initialValue: BlocProvider.of<ContactCubit>(context).contacts[widget.index].name,
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
                  initialValue: BlocProvider.of<ContactCubit>(context).contacts[widget.index].phone,
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
                      BlocProvider.of<ContactCubit>(context).updateContact(widget.index, contact);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green ,content: Text('Updated ya m3lm'),));
                    }
                  },
                  child : Text('Update'),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}