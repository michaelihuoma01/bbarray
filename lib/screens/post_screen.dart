import 'package:bbarray/controllers/post_controller.dart';
import 'package:bbarray/models/posts.dart';
import 'package:bbarray/models/posts_comments.dart';
import 'package:bbarray/widgets/add_comment.dart';
import 'package:bbarray/widgets/comment_tile.dart';
import 'package:bbarray/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends StateMVC<PostScreen> {
  PostController? _con;
  Post? _posts;
  List<PostComment>? _postComments;

  _PostScreenState() : super(PostController()) {
    _con = controller as PostController?;
  }

  void _getPosts() async {
    _posts = await _con!.getPost();
    setState(() {});
  }

  void _getPostComments() async {
    _postComments = await _con!.getPostComment();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getPosts();
    _getPostComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Posts', style: TextStyle(color: Colors.white)),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        AddComment(id: _postComments!.length, con: _con!));
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.add_circle, size: 22),
              ),
            )
          ],
        ),
      ),
      body: (_con!.fetchingPost)
          ? const Center(child: CircularProgressIndicator(color: Colors.black))
          : Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostTile(posts: _posts),
                  const SizedBox(height: 20),
                  const Text('Comments',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Expanded(
                    // height: 200,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        PostComment? post = _postComments?[index];
                        if (_postComments == null) {
                          return Container();
                        }
                        return CommentTile(post: post);
                      },
                      itemCount: _postComments?.length,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
