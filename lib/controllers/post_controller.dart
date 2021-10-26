import 'package:bbarray/models/posts.dart';
import 'package:bbarray/models/posts_comments.dart';
import 'package:bbarray/repository/post_repository.dart' as post_repo;
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PostController extends ControllerMVC {
  List<Post> post = [];
  List<PostComment> postComment = [];
  bool fetchingPost = true;
  bool fetchingPostComment = true; 
  
  Future<Post> getPost() async {
    if (!fetchingPost) {
      setState(() {
        fetchingPost = true;
      });
    }
    final res = await post_repo.getPostRepo();
    fetchingPost = false;
    return res;
  }

  Future<List<PostComment>> getPostComment() async {
    if (!fetchingPostComment) {
      setState(() {
        fetchingPostComment = true;
      });
    }
    final res = await post_repo.getPostComment();
    postComment = res;
    fetchingPostComment = false;
    return res;
  }

  void addPostComment(Map data, context) async {
    if (data.isEmpty) return;

    final alResponse = await post_repo.addComment(data);

    if (alResponse == 200) {
      Navigator.pop(context); 
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Success',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.green));
    } else {
       Navigator.pop(context); 
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'An error occured',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.red));
    }
  }
}
