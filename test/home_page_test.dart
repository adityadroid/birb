import 'package:Birb/ui/home_page.dart';
import 'package:Birb/widgets/posts_list.dart';
import 'package:Birb/widgets/sign_in_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  const MaterialApp app = MaterialApp(
    home: HomePage(title:'awesome'),
  );

  testWidgets('Renders list of posts',(WidgetTester tester) async{
    await tester.pumpWidget(app);
    expect(find.text('awesome'),findsOneWidget);
    expect(find.byType(PostsList), findsOneWidget);
  });

  testWidgets('Renders sign in FAB', (WidgetTester tester) async{
    await tester.pumpWidget(app);
    expect(find.byType(SignInFab),findsOneWidget);
  });

}