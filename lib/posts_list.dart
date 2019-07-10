import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'post_item.dart';

class PostsList extends StatelessWidget{
  const PostsList();
  static const List<int> items = <int>[0,1,2];
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: items.map((int index){
          return const PostItem();
        }).toList());
  }

}
