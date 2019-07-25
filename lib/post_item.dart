
import 'package:flutter/material.dart';
import 'package:flutter_app/post.dart';

class PostItem extends StatelessWidget {
  const PostItem(this.post);
  final Post post;
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          height: 100.0,
          child: Center(
            child: Row(
              children: <Widget>[
                Text(post.username)
              ],
            )
          ),
        )
    );
  }
}