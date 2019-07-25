import 'package:flutter/material.dart';
import 'package:flutter_app/models/post_mock.dart';
import 'package:flutter_app/post.dart';
import 'package:flutter_app/post_item.dart';
import 'package:flutter_app/posts_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){

  testWidgets('Test the post list', (WidgetTester tester) async{
    await tester.pumpWidget( MaterialApp(
      home: PostsList(mockPosts(count: 5)),
    ));
    expect(find.text('Loading'),findsOneWidget);
    await tester.pump(Duration.zero);
    expect(find.byType(PostItem),findsNWidgets(5));
  });

  testWidgets('Testing if no content works', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(
      home: PostsList(Future<List<Post>>.error('Timeout').asStream()),
    ));
    await tester.pump(Duration.zero);
    expect(find.text('Error: Timeout'), findsOneWidget);
  });



}