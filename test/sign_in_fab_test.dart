import 'package:Birb/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:Birb/sign_in_fab.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock/firebase_mock.dart';

void main(){
  testWidgets('Testing sign in fab',(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SignInFab(auth: Auth(
        firebaseAuth: FirebaseAuthMock(),
        googleSignIn: GoogleSignInMock()
      )),
    ));
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Image),findsOneWidget);
  });
}