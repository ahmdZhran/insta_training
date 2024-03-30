import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

 class Firestore {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<bool> createUser({
    required String email,
    required String userName,
    required String bio,
    required String profile,
  }) async {
    await _firebaseFirestore
        .collection("users")
        .doc(_auth.currentUser!.uid)
        .set({
      'email': email,
      "userName": userName,
      "bio": bio,
      profile: profile,
      "following": [],
      "follower": [],
    });
    return true;
  }
}
