// To parse this JSON data, do
//
//     final outstandingProceedComModel = outstandingProceedComModelFromJson(jsonString);

import 'dart:convert';

OutstandingProceedComModel outstandingProceedComModelFromJson(String str) => OutstandingProceedComModel.fromJson(json.decode(str));

String outstandingProceedComModelToJson(OutstandingProceedComModel data) => json.encode(data.toJson());

class OutstandingProceedComModel {
  final bool? status;
  final String? message;

  OutstandingProceedComModel({
    this.status,
    this.message,
  });

  factory OutstandingProceedComModel.fromJson(Map<String, dynamic> json) => OutstandingProceedComModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
