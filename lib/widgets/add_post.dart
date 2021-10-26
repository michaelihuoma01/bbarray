import 'dart:io';

import 'package:bbarray/controllers/album_controller.dart';
import 'package:bbarray/controllers/post_controller.dart';
import 'package:bbarray/widgets/button_widget.dart';
import 'package:bbarray/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddPost extends StatefulWidget {
  int? id;
  AlbumController? con;

  AddPost({this.id, this.con});

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String? title;
  final picker = ImagePicker();
  File? _profileImage;

  Future pickImageFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 30);

    if (pickedFile != null) {
      print(pickedFile.path);
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Container(
            height: 400,
            margin: EdgeInsets.all(30),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(children: [
                      const Text('Add Image',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      const SizedBox(height: 10),
                      Center(
                        child: Stack(
                          children: [
                            Container(
                              height: 120,
                              width: 120,
                              child: _profileImage == null
                                      ? Container(
                                          child: CircleAvatar(
                                            radius: 25.0,
                                            backgroundColor: Colors.grey,
                                            backgroundImage:
                                                NetworkImage('https://socialistmodernism.com/wp-content/uploads/2017/07/placeholder-image.png?w=640'),
                                          ),
                                        )
                                      : Container(
                                child: CircleAvatar(
                                  radius: 25.0,
                                  backgroundColor: Colors.grey,
                                  backgroundImage: FileImage(_profileImage!),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(250))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            pickImageFromGallery();
                                          },
                                          child: Icon(Icons.camera_alt_outlined,
                                              size: 20)),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: TextFormFieldWidget(
          
                          hintText: 'Title',
                          onChanged: (value) {
                            title = value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ButtonWidget(
                            title: 'Add',
                            onPressed: () {
                              print(widget.id);

                              widget.con!.addImage({
                                'albumId': 1,
                                'id': widget.id! + 1,
                                'title': title,
                                'url': 'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png',
                                'thumbnailUrl': 'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png'
                              }, context);

                              // Navigator.pushAndRemoveUntil(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => LoginScreen()),
                              //     (Route<dynamic> route) => false);
                            }),
                      )
                    ])))));
  }
}
