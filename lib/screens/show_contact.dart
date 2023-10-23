import 'package:flutter/material.dart';
import 'package:flutter_nasr_52_multiple_pages/models/contact.dart';

class ShowContactsScreen extends StatefulWidget {
  const ShowContactsScreen({super.key});

  @override
  State<ShowContactsScreen> createState() => _ShowContactsScreenState();
}

class _ShowContactsScreenState extends State<ShowContactsScreen> {
  List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, i){
          return Column(
            children: [
              Text(
                contacts[i].name.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                contacts[i].phone.toString(),
                style: TextStyle(),
              ),
            ],
          );
        },  
        separatorBuilder: (context, i){
          return SizedBox(height: 10,);
        }, 
        itemCount: contacts.length,
      ),
    );
  }
}