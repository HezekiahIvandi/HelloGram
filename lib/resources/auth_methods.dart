import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_uts/model/user.dart' as model;

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(snap);
  }

  //SIGNUP
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
  }) async {
    String alert = "Some error occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty || username.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        // String photoUrl = await StorageMethods()
        //     .uploadImageToStorage('profilePics', file!, false);

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          bio: bio,
          photoUrl: '',
          followers: [],
          following: [],
        );

        //add user to the database
        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        alert = "Success";
      } else {
        alert = "Please enter the empty field";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == "invalid-email") {
        //do something if email is invalid
        alert = "Invalid email address";
      } else if (err.code == 'weak-password') {
        //do something if password too weak (pass below  6 letters)
        alert = "Password is too short";
      }
      //etc
    } catch (err) {
      alert = err.toString();
    }
    return alert;
  }

  //login
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = 'Some error occured';

    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = 'Success';
      } else {
        res = "Please enter the empty field";
      }
    } on FirebaseAuthException catch (err) {
      if (err.code == 'user-not-found') {
        res = "User doesn't exist";
      } else if (err.code == 'wrong-password') {
        res = "Wrong password";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  //signout
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Like Update
  Future<void> likePost(String postId, String uid, List likes) async {}
}
