import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class StorageMethods {
  final FirebaseStorage storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //image to storage
  Future<String> uploadImageToStorage(
      String childName, Uint8List file, bool isPost) async {
    Reference ref =
        storage.ref().child(childName).child(_auth.currentUser!.uid);

    if (isPost) {
      String id = const Uuid().v1();
      ref.child(id);
    }

    UploadTask uploadTask = ref.putData(file);

    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();

    //update firestore photoUrl
    if (!isPost) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'photoUrl': downloadUrl});
    }

    return downloadUrl;
  }
}
