import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/mockito.dart';

class FirebaseAuthMock extends Mock implements FirebaseAuth{}
class GoogleSignInMock extends Mock implements GoogleSignIn{}
class GoogleSignInAccountMock extends Mock implements GoogleSignInAccount{}

class GoogleSignInAuthenticationMock extends Mock implements GoogleSignInAuthentication{
  @override
  // TODO: implement accessToken
  String get accessToken => 'access';
  @override
  // TODO: implement idToken
  String get idToken => 'id';
}
class AuthCredentialMock extends Mock implements AuthCredential{}
class FirebaseUserMock extends Mock implements FirebaseUser{
  @override
  String get displayName => 'John Doe';
}
