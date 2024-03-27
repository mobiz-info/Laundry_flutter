// To parse this JSON data, do
//
//     final notAvailableModel = notAvailableModelFromJson(jsonString);

import 'dart:convert';

NotAvailableModel notAvailableModelFromJson(String str) => NotAvailableModel.fromJson(json.decode(str));

String notAvailableModelToJson(NotAvailableModel data) => json.encode(data.toJson());

class NotAvailableModel {
  final bool? status;
  final String? message;

  NotAvailableModel({
    this.status,
    this.message,
  });

  factory NotAvailableModel.fromJson(Map<String, dynamic> json) => NotAvailableModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
