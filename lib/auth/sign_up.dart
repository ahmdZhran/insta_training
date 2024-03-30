import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_training/auth/cubit/cubit/auth_cubit.dart';
import 'package:insta_training/utils/pick_image_method.dart';

class SignUpView extends StatefulWidget {
  final VoidCallback toggleLoginScreenVisibility;

  const SignUpView(this.toggleLoginScreenVisibility, {Key? key})
      : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  Uint8List? image;
  void selctImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      image != null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: MemoryImage(image!),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey[300],
                              child: Icon(
                                Icons.person,
                                size: 60,
                                color: Colors.grey[600],
                              ),
                            ),
                      Positioned(
                          bottom: -10,
                          left: 195,
                          child: IconButton(
                            icon: const Icon(Icons.add_a_photo),
                            onPressed: selctImage,
                          ))
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    onChanged: (username) {
                      BlocProvider.of<AuthCubit>(context).username = username;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    onChanged: (bio) {
                      BlocProvider.of<AuthCubit>(context).bio = bio;
                    },
                    decoration: const InputDecoration(
                      labelText: 'bio',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    onChanged: (email) {
                      BlocProvider.of<AuthCubit>(context).email = email;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    onChanged: (password) {
                      BlocProvider.of<AuthCubit>(context).password = password;
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 25.0),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<AuthCubit>(context)
                          .signUpWithEmailAndPassword(image!);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                      minimumSize: const Size(double.infinity, 50.0),
                    ),
                    child: const Text('Sign Up'),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                        onPressed: widget.toggleLoginScreenVisibility,
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        child: const Text('Sign In'),
                      ),
                    ],
                  ),
                ]),
          );
        },
      ),
    );
  }
}
