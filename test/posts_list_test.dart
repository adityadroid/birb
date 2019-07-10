import 'package:flutter/material.dart';
import 'package:flutter_app/posts_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('Test the post list', (WidgetTester tester) async{
    await tester.pumpWidget(const MaterialApp(
      home: PostsList(),
    ));
    expect(find.byType(Card),findsNWidgets(2));
    expect(find.text('Prim Birb'),findsNWidgets(2));
  });
}