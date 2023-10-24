import 'package:flutter/material.dart';
import 'package:flutter_nasr_52_multiple_pages/models/contact.dart';
import 'package:hive/hive.dart';

class ShowContactsScreen extends StatefulWidget {
  const ShowContactsScreen({super.key});

  @override
  State<ShowContactsScreen> createState() => _ShowContactsScreenState();
}

class _ShowContactsScreenState extends State<ShowContactsScreen> {
  List<Contact> contacts = [];

  void getDataFromDB(){
   Box box = Hive.box("contacts");
   List keys = box.keys.toList(); // ex. [0,1,2]
   List<Contact> readedContact = [];
   for(var key in keys){
    Map valueAsMap = box.get(key);
    Contact contact = Contact.fromMap(valueAsMap);
    contact.key = key;
    readedContact.add(contact);
   }
   setState(() {
     contacts = readedContact;
   });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushNamed(context, 'add contact');
            }, 
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView.separated(
          itemBuilder: (context, i){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () async{
                    Box box = Hive.box("contacts");
                    setState(() { // To change it instantly in UI
                      contacts[i].name = 'Mai'; 
                    });
                    await box.put(contacts[i].key, contacts[i].toMap()); // to save it in database
                  }, 
                  icon: Icon(Icons.update),
                ),
                Column(
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
                ),
                IconButton(
                  onPressed: (){
                    Box box = Hive.box("contacts");
                    box.delete(contacts[i].key); // delete from database
                    setState(() {
                      contacts.removeAt(i); // delete from list
                    });
                  }, 
                  icon: Icon(Icons.delete),
                ),
              ],
            );
          },  
          separatorBuilder: (context, i){
            return SizedBox(height: 10,);
          }, 
          itemCount: contacts.length,
        ),
      ),
    );
  }
}
