import 'package:flutter_nasr_52_multiple_pages/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDataBase{

  Future<Database> openDB() async{
    String path = await getDatabasesPath();
    Database myDB = await openDatabase(
      join(path, "abdo.db"),
      version: 1,
      onCreate: (db, version) {
        db.execute('CREATE TABLE contacts(name TEXT, phone TEXT)');
      }
    );
    return myDB;
  }

  Future<void> insertContact(Contact c) async{ // c -> abdo, 01010210212
    Database my_DB = await openDB();
    my_DB.insert('contacts', c.toMap());
  }

  Future<List<Contact>> getContacts() async{
    Database my_DB = await openDB();
    List<Map<String, dynamic>> data = await my_DB.query('contacts'); // [ {name: abdo, phone: 012232424} ,  {name: omar, phone: 010123813} ]
    List<Contact> contacts = [];
    for(var singleMap in data){
      Contact newContact = Contact.fromMap(singleMap);
      contacts.add(newContact);
    }
    return contacts;
  }

  Future<void> deleteContact(Contact c) async{
    Database my_DB = await openDB();
    await my_DB.delete("contacts", where: "phone = ?" , whereArgs: [c.phone]);
  }

  Future<void> updateContact(Contact c) async{
    Database my_DB = await openDB();
    await my_DB.update('contacts', c.toMap(), where: 'phone = ?' , whereArgs: [c.phone]);
  }

}