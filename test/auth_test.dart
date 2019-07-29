import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'mock/firebase_mock.dart';
import 'package:Birb/services/auth.dart';
void main(){
  group('Auth',(){

    final FirebaseAuthMock firebaseAuthMock = FirebaseAuthMock();
    final GoogleSignInMock googleSignInMock = GoogleSignInMock();
    final Auth auth = Auth(
        firebaseAuth: firebaseAuthMock,
      googleSignIn: googleSignInMock
    );
    final GoogleSignInAccountMock googleSignInAccountMock = GoogleSignInAccountMock();
    final GoogleSignInAuthenticationMock googleSignInAuthenticationMock = GoogleSignInAuthenticationMock();
    final FirebaseUserMock firebaseUserMock = FirebaseUserMock();

    test('Sign in with google returns a user',  () async {
      when(googleSignInMock.signIn()).thenAnswer((_)=>Future<GoogleSignInAccountMock>.value(googleSignInAccountMock));
      when(googleSignInAccountMock.authentication).thenAnswer((_)=>Future<GoogleSignInAuthenticationMock>.value(googleSignInAuthenticationMock));
      when(firebaseAuthMock.currentUser()).thenAnswer((_)=>Future<FirebaseUserMock>.value(firebaseUserMock));
      expect(await auth.signInWithGoogle(), firebaseUserMock);
      verify(googleSignInMock.signIn()).called(1);
      verify(googleSignInAccountMock.authentication).called(1);
      verify(firebaseAuthMock.currentUser()).called(1);
    });

  });
}