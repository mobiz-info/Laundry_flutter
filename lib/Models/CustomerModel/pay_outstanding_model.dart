// To parse this JSON data, do
//
//     final payOutstandingModel = payOutstandingModelFromJson(jsonString);

import 'dart:convert';

PayOutstandingModel payOutstandingModelFromJson(String str) => PayOutstandingModel.fromJson(json.decode(str));

String payOutstandingModelToJson(PayOutstandingModel data) => json.encode(data.toJson());

class PayOutstandingModel {
  final bool? status;
  final PayOutstandingData? data;
  final String? message;

  PayOutstandingModel({
    this.status,
    this.data,
    this.message,
  });

  factory PayOutstandingModel.fromJson(Map<String, dynamic> json) => PayOutstandingModel(
    status: json["status"],
    data: json["data"] == null ? null : PayOutstandingData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class PayOutstandingData {
  final String? walletBal;

  PayOutstandingData({
    this.walletBal,
  });

  factory PayOutstandingData.fromJson(Map<String, dynamic> json) => PayOutstandingData(
    walletBal: json["wallet_bal"],
  );

  Map<String, dynamic> toJson() => {
    "wallet_bal": walletBal,
  };
}
