// To parse this JSON data, do
//
//     final allPostModel = allPostModelFromJson(jsonString);

import 'dart:convert';

List<AllPostModel> allPostModelFromJson(String str) => List<AllPostModel>.from(
    json.decode(str).map((x) => AllPostModel.fromJson(x)));

String allPostModelToJson(List<AllPostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllPostModel {
  AllPostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory AllPostModel.fromJson(Map<String, dynamic> json) => AllPostModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId!,
        "id": id!,
        "title": title!,
        "body": body!,
      };
}
