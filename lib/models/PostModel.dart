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
    required this.image,
    required this.caption,
    required this.createAt,
    required this.countComment,
    required this.createTime,
    required this.postNo,
  });

  int countLike;
  String image;
  String caption;
  String createAt;
  int countComment;
  String createTime;
  int postNo;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        countLike: json["countLike"],
        image: json["image"],
        caption: json["caption"],
        createAt: json["createAt"],
        countComment: json["countComment"],
        createTime: json["createTime"],
        postNo: json["postNo"],
      );

  Map<String, dynamic> toJson() => {
        "countLike": countLike,
        "image": image,
        "caption": caption,
        "createAt": createAt,
        "countComment": countComment,
        "createTime": createTime,
        "postNo": postNo,
      };
}
