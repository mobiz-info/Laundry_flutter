// To parse this JSON data, do
//
//     final rechargeWalletModel = rechargeWalletModelFromJson(jsonString);

import 'dart:convert';

RechargeWalletModel rechargeWalletModelFromJson(String str) => RechargeWalletModel.fromJson(json.decode(str));

String rechargeWalletModelToJson(RechargeWalletModel data) => json.encode(data.toJson());

class RechargeWalletModel {
  final bool? status;
  final Data? data;

  RechargeWalletModel({
    this.status,
    this.data,
  });

  factory RechargeWalletModel.fromJson(Map<String, dynamic> json) => RechargeWalletModel(
    status: json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  final String? message;

  Data({
    this.message,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}
