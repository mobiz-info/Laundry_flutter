// To parse this JSON data, do
//
//     final serCartDeleteModel = serCartDeleteModelFromJson(jsonString);

import 'dart:convert';

SerCartDeleteModel serCartDeleteModelFromJson(String str) => SerCartDeleteModel.fromJson(json.decode(str));

String serCartDeleteModelToJson(SerCartDeleteModel data) => json.encode(data.toJson());

class SerCartDeleteModel {
  final bool? status;
  final String? message;

  SerCartDeleteModel({
    this.status,
    this.message,
  });

  factory SerCartDeleteModel.fromJson(Map<String, dynamic> json) => SerCartDeleteModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
