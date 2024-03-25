// To parse this JSON data, do
//
//     final payNowOutstandingGetModel = payNowOutstandingGetModelFromJson(jsonString);

import 'dart:convert';

PayNowOutstandingGetModel payNowOutstandingGetModelFromJson(String str) => PayNowOutstandingGetModel.fromJson(json.decode(str));

String payNowOutstandingGetModelToJson(PayNowOutstandingGetModel data) => json.encode(data.toJson());

class PayNowOutstandingGetModel {
  final bool? status;
  final PayNowOutstandingGetData? data;
  final String? message;

  PayNowOutstandingGetModel({
    this.status,
    this.data,
    this.message,
  });

  factory PayNowOutstandingGetModel.fromJson(Map<String, dynamic> json) => PayNowOutstandingGetModel(
    status: json["status"],
    data: json["data"] == null ? null : PayNowOutstandingGetData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class PayNowOutstandingGetData {
  final String? walletBal;

  PayNowOutstandingGetData({
    this.walletBal,
  });

  factory PayNowOutstandingGetData.fromJson(Map<String, dynamic> json) => PayNowOutstandingGetData(
    walletBal: json["wallet_bal"],
  );

  Map<String, dynamic> toJson() => {
    "wallet_bal": walletBal,
  };
}
