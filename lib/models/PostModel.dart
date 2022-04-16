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
    required this.countLike,
    required this.createTime,
    required this.createAt,
    required this.countComment,
    required this.caption,
    required this.postNo,
    required this.image,
  });

  int countLike;
  String createTime;
  String createAt;
  int countComment;
  String caption;
  int postNo;
  String image;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        countLike: json["countLike"],
        createTime: json["createTime"],
        createAt: json["createAt"],
        countComment: json["countComment"],
        caption: json["caption"],
        postNo: json["postNo"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "countLike": countLike,
        "createTime": createTime,
        "createAt": createAt,
        "countComment": countComment,
        "caption": caption,
        "postNo": postNo,
        "image": image,
      };
}
