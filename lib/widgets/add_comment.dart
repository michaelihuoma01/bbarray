import 'package:bbarray/controllers/post_controller.dart';
import 'package:bbarray/widgets/button_widget.dart';
import 'package:bbarray/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

class AddComment extends StatefulWidget {
  int? id;
  PostController? con;

  AddComment({this.id, this.con});

  @override
  _AddCommentState createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  String? comment, email, name;

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
            height: 450,
            margin: EdgeInsets.all(30),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                                          child: Column(children: [
                        const Text('Add comment',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black)),
                        const SizedBox(height: 10),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormFieldWidget(
                            hintText: 'Name',
                            onChanged: (value) {
                              name = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormFieldWidget(
                            hintText: 'Email',
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormFieldWidget(
                            maxLines: 5,
                            hintText: 'Comment',
                            onChanged: (value) {
                              comment = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ButtonWidget(
                              title: 'Add',
                              height: 40,
                              onPressed: () {
                                print(widget.id);

                                widget.con!.addPostComment({
                                  'postId': 1,
                                  'id': widget.id! + 1,
                                  'name': name,
                                  'email': email,
                                  'body': comment
                                  
                                }, context);

                                // Navigator.pushAndRemoveUntil(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => LoginScreen()),
                                //     (Route<dynamic> route) => false);
                              }),
                        )
                      ]),
                    )))));
  }
}
