import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseDatabaseServis {
  CollectionReference firebase = FirebaseFirestore.instance.collection('users');

  addOrUpdateUser() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    String userId = "abc123";
    String userName = "agus";
    int age = 25;

    // perbedaan antara set dan update adalah , jika updaate hanya merubah yang ada dialam properti dan jika ada properti baru maka akan menambahkan properti baru lagi , nah dan set ketika

    await firestore
        .collection("users")
        .doc(userId)
        .update({"name": userName, "age": age});

    // await firestore
    //     .collection("users")
    //     .doc(userId)
    //     .set({"na": userName, "age": age, 'jo': 'ad'});
  }
}
