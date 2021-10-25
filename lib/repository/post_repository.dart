import 'dart:convert';

import 'package:bbarray/models/posts.dart';
import 'package:bbarray/models/posts_comments.dart';
import 'package:http/http.dart' as http;

const headers = {
  "content-type": "application/json",
  "accept": "application/json",
};

Future<Post> getPostRepo() async {
  var res = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/posts/1"),
    headers: headers,
  );
  final resData = json.decode(res.body);
  return Post.fromJSON(resData);
}

Future<List<PostComment>> getPostComment() async {
  var res = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=1"),
    headers: headers,
  );
  final resData = json.decode(res.body);
  return resData.map<PostComment>((item) {
    return PostComment.fromJSON(item);
  }).toList();
}

addComment(Map data) async {
  var res = await http.put(
    Uri.parse("https://jsonplaceholder.typicode.com/comments?postId=1"),
    headers: headers,
    body: json.encode(data),
  );
  final resData = json.decode(res.body);

  print('===============$resData');
}
