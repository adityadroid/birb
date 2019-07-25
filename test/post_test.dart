import 'dart:convert';
import 'dart:io';

import 'package:flutter_app/models/post_mock.dart';
import 'package:flutter_app/post.dart';
import 'package:test/test.dart';

void main(){
  group('Post',(){
    test('fromMap',() async {
        final Map<String, dynamic> data = mockPostData(index: 5);
        final Post  post = Post.fromMap(data);
        expect(post.id, data['id']);
        expect(post.imageUrl, data['imageUrl']);
        expect(post.createdAt, DateTime.parse(data['createdAt']));
        expect(post.text, data['text']);
        expect(post.username, data['username']);

    });
  });
}

dynamic postData() async {
  final dynamic data = await File('../assets/posts.json').readAsString();
  return json.decode(data).first;
}