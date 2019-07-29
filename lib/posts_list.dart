import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'no_content.dart';
import 'post.dart';
import 'post_item.dart';

class PostsList extends StatelessWidget{
  const PostsList(this.posts);
  final Stream<List<Post>> posts;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Post>>(
      stream: posts,
      builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot){
        if(snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        switch(snapshot.connectionState){
          case ConnectionState.waiting:
            return const Text('Loading');
          default:
            if(snapshot.data.isEmpty){
              return const NoContent();
            }
            return itemList(snapshot.data);

        }
      },
    );
  }

  Widget itemList(List<Post> items){
    return ListView(
        children: items.map((Post post){
          return  Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child:PostItem(post)
          );
        }).toList());
  }
}
