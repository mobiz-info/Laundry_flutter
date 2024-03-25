// To parse this JSON data, do
//
//     final notiDeleteModel = notiDeleteModelFromJson(jsonString);

import 'dart:convert';

NotiDeleteModel notiDeleteModelFromJson(String str) => NotiDeleteModel.fromJson(json.decode(str));

String notiDeleteModelToJson(NotiDeleteModel data) => json.encode(data.toJson());

class NotiDeleteModel {
  final bool? status;
  final String? message;

  NotiDeleteModel({
    this.status,
    this.message,
  });

  factory NotiDeleteModel.fromJson(Map<String, dynamic> json) => NotiDeleteModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
