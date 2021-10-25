import 'package:bbarray/models/album.dart';
import 'package:flutter/material.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({
    Key? key,
    required this.album,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow:   [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 0.5,
              blurRadius: 1,
              offset: Offset(0, 2.5), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: SizedBox(
              height: 50,
              child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  backgroundImage: NetworkImage(album.url!)),
            ),
            title: Text(album.title!, style: const TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
