import 'package:cloud_firestore/cloud_firestore.dart';

class Items {
  //String uid;
  late String description;
  late String name;
  late String photoUrl;
  late double price;

  Items.fromMap(Map<String, dynamic> data) {
    description = data['description'];
    name = data['name'];
    photoUrl = data['photoUrl'];
    price = data['price'];
  }
}
