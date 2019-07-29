import 'package:flutter/material.dart';
import 'mock/post_mock.dart';
import 'package:Birb/models/post.dart';
import 'package:Birb/widgets/post_item.dart';
import 'package:Birb/widgets/posts_list.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

void main(){

  testWidgets('Test the post list', (WidgetTester tester) async{
    provideMockedNetworkImages(() async {
    await tester.pumpWidget( MaterialApp(
      home: PostsList(mockPosts(count: 5)),
    ));
    expect(find.text('Loading'),findsOneWidget);
    await tester.pump(Duration.zero);
    expect(find.byType(PostItem),findsNWidgets(5));
    });
  });

  testWidgets('Testing if no content works', (WidgetTester tester) async{
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(MaterialApp(
        home: PostsList(Future<List<Post>>.error('Timeout').asStream()),
      ));
      await tester.pump(Duration.zero);
      expect(find.text('Error: Timeout'), findsOneWidget);
    });
  });



}