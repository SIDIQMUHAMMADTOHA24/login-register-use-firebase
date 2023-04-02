import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabase {
  //! Add Database
  Future database(
      {required String userName,
      required String email,
      required String password}) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .add({'user_name': userName, 'email': email, 'password': password});
    } catch (e) {
      print(e.toString());
    }
  }
}
