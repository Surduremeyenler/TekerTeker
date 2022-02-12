import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUserService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String? uid = FirebaseAuth.instance.currentUser?.uid;

  Future<dynamic> getUser() async {
    final response = await firestore
        .collection('bicycles')
        .doc(uid)
        .get()
        .then((value) => value.data());
    return response;
  }
}
