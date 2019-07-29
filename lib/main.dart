
import 'package:Birb/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/register_page.dart';

void main(){
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarDividerColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark
  ));
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Birb',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        accentColor: Colors.white
      ),
      home: const HomePage(title: 'Birb'),
      routes: <String, WidgetBuilder>{
        RegisterPage.routeName: (BuildContext context) => const RegisterPage(),
      },
    );
  }
}

