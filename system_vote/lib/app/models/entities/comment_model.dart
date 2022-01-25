import 'dart:convert';

CommentModel postFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String postToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  CommentModel({
    this.id,
    this.author,
    this.idPost,
    this.text,
  });

  String? id;
  String? author;
  String? idPost;
  String? text;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json["id"],
        author: json["author"],
        idPost: json["idPost"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "idPost": idPost,
        "text": text,
      };
}
