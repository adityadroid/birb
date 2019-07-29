import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth.dart';

class SignInFab extends StatelessWidget {
  const SignInFab();
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: signInWithGoogle,
        icon: Image.asset('assets/ic_g_login.png', height: 24),
        label: Text('Sign in with Google'));
  }


  void signInWithGoogle() {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();
    Auth auth = Auth(
        firebaseAuth: firebaseAuth,
        googleSignIn:  googleSignIn);
    auth.signInWithGoogle()
    .then((user){
      print('Hi ${user.displayName}');
    });
  }

}