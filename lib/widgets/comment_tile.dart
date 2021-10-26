import 'package:bbarray/models/posts_comments.dart';
import 'package:flutter/material.dart';

class CommentTile extends StatelessWidget {
  PostComment? post;

  CommentTile({
    Key? key,
    this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(post!.name!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(post!.email!, style: TextStyle(fontSize: 14)),
        const SizedBox(height: 5),
        Text(post!.body!),
        const SizedBox(height: 5),
        const Divider(color: Colors.grey),
        const SizedBox(height: 5),
      ],
    ));
  }
}
