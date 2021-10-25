import 'package:bbarray/repository/album_repository.dart' as album_repo;
import 'package:bbarray/models/album.dart';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class AlbumController extends ControllerMVC {
  List<Album> album = [];
  bool fetchingAlbum = true;
  ValueNotifier<Album>? albumConfig;
  GlobalKey<ScaffoldState>? scaffoldKey;

  AlbumController() {
    albumConfig = ValueNotifier(Album());

    getAlbum();

    scaffoldKey = GlobalKey<ScaffoldState>();
  }

  Future<List<Album>> getAlbum() async {
    if (!fetchingAlbum) {
      setState(() {
        fetchingAlbum = true;
      });
    }
    final res = await album_repo.getAlbumRepo();
    album = res;

    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    albumConfig!.notifyListeners();
    setState(() {
      fetchingAlbum = false;
    });
    print('==============================${res.first.url}');

    return res;
  }
}
