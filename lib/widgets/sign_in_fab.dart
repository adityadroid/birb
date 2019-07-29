import 'package:Birb/ui/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:Birb/services/auth.dart';

class SignInFab extends StatelessWidget {
  SignInFab({
    @required this.auth
  });
  Auth auth;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: ()=>signInWithGoogle(context),
        icon: Image.asset('assets/ic_g_login.png', height: 24),
        label:const Text('Sign in with Google'));
  }


  void signInWithGoogle(BuildContext context) {
    auth.signInWithGoogle()
    .then((FirebaseUser user){
      if(isExistingUser(user)){
      showSnackBar(context, user);
      }else{
        navigateToRegister(context);
      }
    });
  }

  void showSnackBar(BuildContext context, FirebaseUser user) {
    final SnackBar snackBar = SnackBar(content: Text('Welcome, ${user.displayName}'));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  bool isExistingUser(FirebaseUser user) {return true;}
  void navigateToRegister(BuildContext context){
    Navigator.pushNamed(context, RegisterPage.routeName);
  }
}