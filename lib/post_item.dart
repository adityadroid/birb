
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  const PostItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
          height: 300.0,
          child: const Center(
            child: Text('Prim Birb'),
          ),
        )
    );
  }
}