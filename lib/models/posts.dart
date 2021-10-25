class Post {
  String? title, body;
  int? userId, id;

  Post({this.userId, this.id, this.title, this.body});

  Post.fromJSON(Map<String, dynamic> json) {
    try {
      userId = json['userId'];
      id = json[id];
      title = json['title'];
      body = json['body'];
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Map toMap() {
    Map<String, dynamic> map = {};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;

    return map;
  }
}
