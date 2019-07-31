import 'package:Birb/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:Birb/widgets/sign_in_fab.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'mock/firebase_mock.dart';
import 'services/services_mock.dart';

void main() {
  final Auth mock = AuthMock();
  final FirebaseUserMock user = FirebaseUserMock();
  final MaterialApp app = MaterialApp(
    home: Scaffold(
      body: SignInFab(auth: mock),
    ),
  );

  testWidgets('Renders Sign In', (WidgetTester tester) async {
    await tester.pumpWidget(app);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(FloatingActionButton),findsOneWidget);
    expect(find.text('Sign in with Google'), findsOneWidget);
    expect(find.byType(SnackBar), findsNothing);


  });
//  testWidgets('Calls signin when tapped',(WidgetTester tester) async{
//    when(mock.signInWithGoogle()).thenAnswer((_)=>Future<FirebaseUserMock>.value(user));
//    await tester.pumpWidget(app);
//    expect(find.byType(Image), findsOneWidget);
//    expect(find.byType(FloatingActionButton),findsOneWidget);
//    await tester.tap(find.byType(FloatingActionButton));
//    verify(mock.signInWithGoogle()).called(1);
//
//  });
//  testWidgets('Testing the rendering of snackbar',(WidgetTester tester) async {
//    await tester.pumpWidget(app);
//    expect(find.byType(SnackBar),findsNothing);
//    await tester.tap(find.byType(FloatingActionButton));
//    await tester.pump(Duration.zero);
//    expect(find.byType(SnackBar),findsOneWidget);
//    expect(find.text('Welcome, ${user.displayName}'),findsOneWidget);
//
//  });
}
