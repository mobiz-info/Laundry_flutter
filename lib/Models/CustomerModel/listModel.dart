// To parse this JSON data, do
//
//     final listModel = listModelFromJson(jsonString);

import 'dart:convert';

ListModel listModelFromJson(String str) => ListModel.fromJson(json.decode(str));

String listModelToJson(ListModel data) => json.encode(data.toJson());

class ListModel {
  final bool? status;
  final List<Map<String, String?>>? data;
  final String? message;

  ListModel({
    this.status,
    this.data,
    this.message,
  });

  factory ListModel.fromJson(Map<String, dynamic> json) => ListModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Map<String, String?>>.from(json["data"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    "message": message,
  };
}
