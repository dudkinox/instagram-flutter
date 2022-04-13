// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str));

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel {
  PostModel({
    required this.list,
  });

  List<ListElement> list;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.caption,
    required this.countComment,
    required this.countLike,
    required this.createTime,
    required this.createAt,
    required this.image,
    required this.postNo,
  });

  String caption;
  int countComment;
  int countLike;
  String createTime;
  String createAt;
  String image;
  int postNo;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        caption: json["caption"],
        countComment: json["countComment"],
        countLike: json["countLike"],
        createTime: json["createTime"],
        createAt: json["createAt"],
        image: json["image"],
        postNo: json["postNo"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "countComment": countComment,
        "countLike": countLike,
        "createTime": createTime,
        "createAt": createAt,
        "image": image,
        "postNo": postNo,
      };
}
