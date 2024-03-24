class Tweet {
  String? id;
  String? text;
  String? createdAt;
  String? authorId;
  List<dynamic>? tags;
  String? image;

  Tweet factory(Map<String, dynamic> jsonData) {
    id = jsonData['id'];
    text = jsonData['text'];
    createdAt = jsonData['date_created'];
    authorId = jsonData['user_created'];
    tags = jsonData['tags'];
    image = jsonData['image'];

    return this;
  }
}
