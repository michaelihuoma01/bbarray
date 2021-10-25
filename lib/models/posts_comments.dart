class PostComment {
  String? name, email, body;
  int? postId, id;

  PostComment({this.postId, this.name, this.id, this.email, this.body});

  PostComment.fromJSON(Map<String, dynamic> json) {
    try {
      postId = json['postId'];
      id = json[id];
      name = json['name'];
      email = json['email'];
      body = json['body'];
    } catch (e) {
      print(
        e.toString(),
      );
    }
  }

  Map toMap() {
    Map<String, dynamic> map = {};
    map['postId'] = postId;
    map['id'] = id;
    map['email'] = email;
    map['name'] = name;
    map['body'] = body;

    return map;
  }
}
