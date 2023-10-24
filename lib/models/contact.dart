class Contact{
  dynamic key;
  String? name;
  String? phone;

  Contact({this.name, this.phone});
  Contact.fromMap(Map m){
    name = m['name'];
    phone = m['phone'];
  }

  Map<String, dynamic> toMap(){
    return {
      'name': name,
      'phone': phone,
    };
  }
}
