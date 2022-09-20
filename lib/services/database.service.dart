import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify_clone/constants.dart';

class DatabaseService {
  Future<List<DocumentSnapshot>> fetchDataFromCollection(
      {required collection}) async {
    QuerySnapshot data = await db.collection(collection).get();
    return data.docs;
  }

  Future<DocumentSnapshot> fetchDocFromCollection(
      {required collection, required doc}) async {
    DocumentSnapshot data = await db.collection(collection).doc(doc).get();
    return data;
  }
}
