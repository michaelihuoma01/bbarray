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

  // ValueNotifier<Post>? postConfig;

  GlobalKey<ScaffoldState>? scaffoldKey;

  PostController() {
    // postConfig = ValueNotifier(Post());

    // getPost();

    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  // Future<List<Post>> getPost() async {
  //   if (!fetchingPost) {
  //     setState(() {
  //       fetchingPost = true;
  //     });
  //   }
  //   final res = await post_repo.getPostRepo();
  //   post = res;

  //   // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  //   postConfig!.notifyListeners();
  //   print(res.toString());
  //   setState(() {
  //     fetchingPost = false;
  //   });
  //   print('==============================${res.first.title}');

  //   return res;
  // }

  // Future<List<Post>> getComments() async {
  //   if (!fetchingPost) {
  //     setState(() {
  //       fetchingPost = true;
  //     });
  //   }
  //   final res = await post_repo.getPostComment();
  //   post = res;

  //   // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
  //   postConfig!.notifyListeners();
  //   print(res.toString());
  //   setState(() {
  //     fetchingPost = false;
  //   });
  //   print('==============================${res.first.title}');

  //   return res;
  // }

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

  void addPostComment(Map data) async {
    if (data.isEmpty) return;

    final alResponse = await post_repo.addComment(data);

    print("|||||||||||||||||||||||||$alResponse");
  }
}
