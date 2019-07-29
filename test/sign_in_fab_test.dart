import 'package:flutter/material.dart';
import 'package:Birb/sign_in_fab.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('Testing sign in fab',(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SignInFab(),
    ));
    expect(find.byType(Text), findsOneWidget);
    expect(find.byType(Image),findsOneWidget);
  });
}