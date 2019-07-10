import 'package:flutter/material.dart';
import 'package:flutter_app/post_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('Testing posts',(WidgetTester tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: PostItem(),
    ));
    expect(find.byType(Card), findsOneWidget);
    expect(find.text('Prim Birb'), findsOneWidget);
  });
}