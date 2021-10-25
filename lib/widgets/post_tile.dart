import 'package:bbarray/models/posts.dart';
import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    Key? key,
    required Post? posts,
  })  : _posts = posts,
        super(key: key);

  final Post? _posts;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade400,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2.5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(_posts!.title!,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(_posts!.body!, style: const TextStyle(fontSize: 16))
            ],
          ),
        ));
  }
}
