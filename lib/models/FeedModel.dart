// To parse this JSON data, do
//
//     final postModel = postModelFromJson(jsonString);

import 'dart:convert';

List<FeedModel> postModelFromJson(String str) =>
    List<FeedModel>.from(json.decode(str).map((x) => FeedModel.fromJson(x)));

String feedModelToJson(List<FeedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FeedModel {
  FeedModel({
    required this.id,
    required this.name,
    required this.email,
    required this.image,
    required this.list,
  });

  String id;
  String name;
  String email;
  String image;
  List<ListElement> list;

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        image: json["image"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "image": image,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.postNo,
    required this.image,
    required this.caption,
    required this.createAt,
    required this.createTime,
    required this.countComment,
    required this.countLike,
    required this.like,
  });

  int postNo;
  String image;
  String caption;
  String createAt;
  String createTime;
  int countComment;
  int countLike;
  bool like;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        postNo: json["postNo"],
        image: json["image"],
        caption: json["caption"],
        createAt: json["createAt"],
        createTime: json["createTime"],
        countComment: json["countComment"],
        countLike: json["countLike"],
        like: json["like"],
      );

  Map<String, dynamic> toJson() => {
        "postNo": postNo,
        "image": image,
        "caption": caption,
        "createAt": createAt,
        "createTime": createTime,
        "countComment": countComment,
        "countLike": countLike,
        "like": like,
      };
}
