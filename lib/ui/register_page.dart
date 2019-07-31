import 'package:Birb/widgets/register_form.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget{
  const RegisterPage({Key key}): super(key: key);
  static const String routeName = '/register';
  @override
  State<StatefulWidget> createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Register Page'),
          centerTitle: true,
          elevation: 0.0),
      body: const SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 18),
          child: RegisterForm()),
      )
      ,);
  }
}

