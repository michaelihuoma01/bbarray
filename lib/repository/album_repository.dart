import 'dart:convert';

import 'package:bbarray/models/album.dart';
import 'package:http/http.dart' as http;

const headers = {
  "content-type": "application/json",
  "accept": "application/json",
};

Future<List<Album>> getAlbumRepo() async {
  var res = await http.get(
    Uri.parse("https://jsonplaceholder.typicode.com/photos?albumId=1"),
    headers: headers,
  );
  final resData = json.decode(res.body);
  return resData.map<Album>((item) {
    return Album.fromJSON(item);
  }).toList();
}

Future<int> addAlbumImage(Map data) async {
  var res = await http.put(
    Uri.parse("https://jsonplaceholder.typicode.com/photos/1"),
    headers: headers,
    body: json.encode(data),
  );

  return res.statusCode;
}
