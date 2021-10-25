class Album {
  String? title, url, thumbnailUrl;
  int? albumId, id;

  Album({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  Album.fromJSON(Map<String, dynamic> json) {
    try {
      albumId = json[albumId];
      id = json[id];
      title = json['title'];
      url = json['url'];
      thumbnailUrl = json['thumbnailUrl'];
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Map toMap() {
    Map<String, dynamic> map = {};

    map['albumId'] = albumId;
    map['id'] = id;
    map['title'] = title;
    map['url'] = url;
    map['thumbnailUrl'] = thumbnailUrl;

    return map;
  }
}
