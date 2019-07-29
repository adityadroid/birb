import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:Birb/services/auth.dart';
import 'package:Birb/models/post.dart';
import 'package:Birb/widgets/posts_list.dart';
import 'package:Birb/widgets/sign_in_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = GoogleSignIn();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(widget.title),
          ),
          elevation: 0.0,
        ),
        body:  PostsList(loadPosts(context)),
        floatingActionButton: SignInFab(
            auth: Auth(
              firebaseAuth: FirebaseAuth.instance,
              googleSignIn: GoogleSignIn(),
            )));
  }

  Stream<List<Post>> loadPosts(BuildContext context){
    return DefaultAssetBundle.of(context)
        .loadString('assets/posts.json')
        .then<List<dynamic>>((String value)=>json.decode(value))
        .asStream()
        .map(convertToPosts);
  }

  List<Post> convertToPosts(List<dynamic> data) {
    return data.map((dynamic item)=> Post.fromMap(item)).toList();
  }
}
