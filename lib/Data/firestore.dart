import 'package:cloud_firestore/cloud_firestore.dart';

class UploadImage {
  Future<void> addData(textdata) async {
    Firestore.instance.collection("data").add(textdata).catchError((e) {
      print(e);
    });
  }

  getdData(String text) async {
    return await Firestore.instance.collection("data").snapshots();
  }
}
