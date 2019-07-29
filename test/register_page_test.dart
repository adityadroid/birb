import 'package:Birb/ui/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  MaterialApp app = MaterialApp(
    home: const RegisterPage(),
  );

  testWidgets('Renders register page',(WidgetTester tester) async{
    await tester.pumpWidget(app);

    expect(find.text('Register'), findsNWidgets(2));

  });
}