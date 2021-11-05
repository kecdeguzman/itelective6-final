import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference itemList =
      FirebaseFirestore.instance.collection('items');

  Future<void> createItemData(String description, String name, String photoUrl,
      String uid, double price) async {
    return await itemList.doc(uid).set({
      'description': description,
      'name': name,
      'photoUrl': photoUrl,
      'price': price
    });
  }

  Future updateItemList(String description, String name, String photoUrl,
      String uid, double price) async {
    return await itemList.doc(uid).update({
      'description': description,
      'name': name,
      'photoUrl': photoUrl,
      'price': price
    });
  }

  Future getItemList() async {
    List itemsList = [];

    try {
      await itemList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
