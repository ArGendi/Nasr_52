import 'package:bloc/bloc.dart';
import 'package:flutter_nasr_52_multiple_pages/cubits/contact_state.dart';
import 'package:flutter_nasr_52_multiple_pages/local/my_database.dart';
import 'package:flutter_nasr_52_multiple_pages/models/contact.dart';

class ContactCubit extends Cubit<ContactState>{
  List<Contact> contacts = [];

  ContactCubit() : super(InitContactState());

  void addContact(Contact newContact) async{
    contacts.add(newContact);
    MyDataBase myDataBase = MyDataBase();
    await myDataBase.insertContact(newContact);

    emit(AddContactState());
  }

  void getDataFromSQFLite() async{
    emit(LoadingContactState());
    await Future.delayed(Duration(seconds: 3), () async{
      MyDataBase myDataBase = MyDataBase();
      contacts = await myDataBase.getContacts();
    });
    emit(GetDataState());
  }

  void deleteContact(int i) async{
    MyDataBase myDB = MyDataBase();
    await myDB.deleteContact(contacts[i]);
    contacts.removeAt(i);
    emit(DeleteContactState());
  }

  void updateContact(int i, Contact updatedContact) async{
    MyDataBase myDB = MyDataBase();
    // old -> beshoy , 0111111111111 (contacts[i])
    // new -> besho , 0111111111123 (updatedContact)
    await myDB.updateContact(contacts[i], updatedContact); 
    contacts[i] = updatedContact;
    emit(UpdateContactState());
  }
}