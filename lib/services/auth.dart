import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth{
  Auth({
    @required this.googleSignIn,
    @required this.firebaseAuth,
});
  GoogleSignIn googleSignIn;
  FirebaseAuth firebaseAuth;

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =   await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final AuthResult result = await firebaseAuth.signInWithCredential(credential);
    final FirebaseUser currentUser = await firebaseAuth.currentUser();
    return currentUser;
  }
}