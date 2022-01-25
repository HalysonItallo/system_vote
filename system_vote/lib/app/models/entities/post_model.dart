import 'dart:convert';

PostModel postFromJson(String str) => PostModel.fromJson(json.decode(str));

String postToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    this.id,
    this.countDislike,
    this.text,
    this.countLike,
    this.idUser,
    this.author,
  });

  String? id;
  int? countDislike;
  String? text;
  int? countLike;
  String? idUser;
  String? author;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        countDislike: json["countDislike"],
        text: json["text"],
        countLike: json["countLike"],
        idUser: json["idUser"],
        author: json["author"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "countDislike": countDislike,
        "text": text,
        "countLike": countLike,
        "idUser": idUser,
        "author": author,
      };
}
