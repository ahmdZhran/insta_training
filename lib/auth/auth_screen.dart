import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:insta_training/auth/cubit/cubit/auth_cubit.dart';
import 'package:insta_training/auth/sign_in.dart';
import 'package:insta_training/auth/sign_up.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLoginScreenVisible = true;

  void toggleLoginScreenVisibility() {
    setState(() {
      isLoginScreenVisible = !isLoginScreenVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoginScreenVisible
        ? SignInView(toggleLoginScreenVisibility)
        : BlocProvider(
            create: (context) => AuthCubit(),
            child: SignUpView(toggleLoginScreenVisibility),
          );
  }
}
