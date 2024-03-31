import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_training/auth/networking/firebase_helper.dart';
import 'package:insta_training/data/models/user_mode.dart';
import 'package:insta_training/data/services/firebase_services/storage.dart';
import 'package:insta_training/utils/exception.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  String? username;
  String? email;
  String? password;
  String? uid;
  String? bio;

  Uint8List? profileImage;
  FirebaseHelper? firebaseHelper;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  signUpWithEmailAndPassword(Uint8List profileImage) async {
    emit(SignUpLoading());
    try {
      UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email!, password: password!);
      String imageUrl = await StorageMethod()
          .uploadImageToStorage('ProfileImage', profileImage, false);
      UserModel userModel = UserModel(
        email: email!,
        username: username!,
        bio: bio!,
        uid: credential.user!.uid,
        following: [],
        imageUrl: imageUrl,
        password: password!,
        followers: [],
      );

      await firestore
          .collection("users")
          .doc(credential.user!.uid)
          .set(userModel.toJson());
      emit(SignUpSuccess());
    } on FirebaseAuthException catch (e) {
      throw exception(message: e.toString());
    }
  }
}
