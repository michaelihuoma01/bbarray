import 'package:bbarray/controllers/album_controller.dart';
import 'package:bbarray/models/album.dart';
import 'package:bbarray/widgets/add_post.dart';
import 'package:bbarray/widgets/album_tile.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

class AlbumScreen extends StatefulWidget {
  @override
  _AlbumScreenState createState() => _AlbumScreenState();
}

class _AlbumScreenState extends StateMVC<AlbumScreen> {
  AlbumController? _ctrl;

  _AlbumScreenState() : super(AlbumController()) {
    _ctrl = controller as AlbumController?;
  }

  @override
  void initState() {
    super.initState();
    checkPermissions();
  }

  checkPermissions() async {
    var status = await Permission.photos.status;
    var statusStorage = await Permission.storage.status;

    if (status.isGranted && statusStorage.isGranted) {
      print('Permission granted');
    } else {
      print('Permission is not granted');

      Permission.photos.request();
      Permission.storage.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider(
            create: (BuildContext context) =>
                _ctrl = context.watch<AlbumController>(),
          ),
        ],
        builder: (context, child) {
          _ctrl!.albumConfig!.addListener(() => setState(() => null));
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBar(
                title:
                    const Text('Albums', style: TextStyle(color: Colors.white)),
                centerTitle: true,
                backgroundColor: Colors.black,
                iconTheme: const IconThemeData(color: Colors.white),
                actions: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AddPost(
                              id: _ctrl!.album.length, con: _ctrl!));
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.add_circle, size: 22),
                    ),
                  )
                ],
              ),
            ),
            body: (_ctrl!.fetchingAlbum)
                ? const Center(
                    child: CircularProgressIndicator(color: Colors.black))
                : ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      Album album = _ctrl!.album[index];

                      return AlbumTile(album: album);
                    },
                    itemCount: _ctrl!.album.length,
                  ),
          );
        });
  }
}
