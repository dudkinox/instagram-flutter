// To parse this JSON data, do
//
//     final commentModel = commentModelFromJson(jsonString);

import 'dart:convert';

CommentModel commentModelFromJson(String str) =>
    CommentModel.fromJson(json.decode(str));

String commentModelToJson(CommentModel data) => json.encode(data.toJson());

class CommentModel {
  CommentModel({
    required this.list,
  });

  List<ListElement> list;

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
      };
}

class ListElement {
  ListElement({
    required this.comment,
    required this.postNo,
    required this.createTime,
    required this.name,
    required this.image,
    required this.createAt,
  });

  String comment;
  int postNo;
  String createTime;
  String name;
  String image;
  String createAt;

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        comment: json["comment"],
        postNo: json["postNo"],
        createTime: json["createTime"],
        name: json["name"],
        image: json["image"] ??
            "https://s2s.co.th/wp-content/uploads/2019/09/photo-icon.jpg",
        createAt: json["createAt"],
      );

  Map<String, dynamic> toJson() => {
        "comment": comment,
        "postNo": postNo,
        "createTime": createTime,
        "name": name,
        "image": image,
        "createAt": createAt,
      };
}
