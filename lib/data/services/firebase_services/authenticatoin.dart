// import 'dart:typed_data';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:insta_training/data/services/firebase_services/storage.dart';
// import 'package:insta_training/utils/exception.dart';

// class Authentication {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   Future<void> signUp({
//     required String email,
//     required String username,
//     required String bio,
//     required String password,
//     required Uint8List profileImage,
//   }) async {
//     try {
//       if (email.isNotEmpty &&
//           username.isNotEmpty &&
//           bio.isNotEmpty &&
//           password.isNotEmpty &&
//           bio.isNotEmpty) {
//         UserCredential credential = await _auth.createUserWithEmailAndPassword(
//           email: email.trim(),
//           password: password.trim(),
//         );

//         String imageUrl = await StorageMethod()
//             .uploadImageToStorage('profileImage', profileImage, false);

//         await _firestore.collection('users').doc(credential.user!.uid).set({
//           'email': email,
//           "username": username,
//           "bio": bio,
//           "uid": credential.user!.uid,
//           "following": [],
//           "follower": [],
//           "imageUrl": imageUrl,
//         });
//       } else {
//         print('something is went wrong and this is replace exception');
//       }
//     } on FirebaseAuthException catch (e) {
//       throw exception(message: e.toString());
//     }
//   }
// }
