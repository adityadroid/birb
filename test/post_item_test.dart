import 'package:flutter/material.dart';
import 'package:flutter_app/models/post_mock.dart';
import 'package:flutter_app/post.dart';
import 'package:flutter_app/post_item.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets('Testing posts',(WidgetTester tester) async{
    final Post post = mockPost();
    await tester.pumpWidget( MaterialApp(
      home: PostItem(post),
    ));
    expect(find.byType(Card), findsOneWidget);
    expect(find.text(post.username), findsOneWidget);
  });
}