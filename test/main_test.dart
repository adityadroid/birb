import 'package:Birb/main.dart';
import 'package:Birb/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('Testing main page rendering',(WidgetTester tester) async{
    await tester.pumpWidget(MyApp());
    expect(find.text('Birb'), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
  });
}