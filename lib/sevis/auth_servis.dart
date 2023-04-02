import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServis {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String email = 'johha@demo.com';
  String password = '12345678';

  sign() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firestore
          .collection('users')
          .add({'email': email, 'password': password});
    } catch (e) {}
  }
}
