// To parse this JSON data, do
//
//     final feedModel = feedModelFromJson(jsonString);

import 'dart:convert';

FeedModel feedModelFromJson(String str) => FeedModel.fromJson(json.decode(str));

String feedModelToJson(FeedModel data) => json.encode(data.toJson());

class FeedModel {
  FeedModel({
    required this.id,
    required this.name,
    required this.email,
    required this.list,
  });

  String id;
  String name;
  String email;
  List<ListElement> list;

  factory FeedModel.fromJson(Map<String, dynamic> json) => FeedModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.caption,
    required this.createTime,
    required this.postNo,
    required this.createAt,
    required this.countComment,
    required this.image,
    required this.countLike,
  });

  String caption;
  String createTime;
  int postNo;
  String createAt;
  int countComment;
  String image;
  int countLike;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        caption: json["caption"],
        createTime: json["createTime"],
        postNo: json["postNo"],
        createAt: json["createAt"],
        countComment: json["countComment"],
        image: json["image"],
        countLike: json["countLike"],
      );

  Map<String, dynamic> toJson() => {
        "caption": caption,
        "createTime": createTime,
        "postNo": postNo,
        "createAt": createAt,
        "countComment": countComment,
        "image": image,
        "countLike": countLike,
      };
}
