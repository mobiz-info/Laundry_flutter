// To parse this JSON data, do
//
//     final serCartWalletBalModel = serCartWalletBalModelFromJson(jsonString);

import 'dart:convert';

SerCartWalletBalModel serCartWalletBalModelFromJson(String str) => SerCartWalletBalModel.fromJson(json.decode(str));

String serCartWalletBalModelToJson(SerCartWalletBalModel data) => json.encode(data.toJson());

class SerCartWalletBalModel {
  final bool? status;
  final int? totalAmountPayable;
  final num? walletBalance;
  final String? payedAmount;
  final String? walletid;
  final String? message;

  SerCartWalletBalModel({
    this.status,
    this.totalAmountPayable,
    this.walletBalance,
    this.payedAmount,
    this.walletid,
    this.message,
  });

  factory SerCartWalletBalModel.fromJson(Map<String, dynamic> json) => SerCartWalletBalModel(
    status: json["status"],
    totalAmountPayable: json["total_amount_payable"],
    walletBalance: json["wallet_balance"],
    payedAmount: json["payed_amount"],
    walletid: json["walletid"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total_amount_payable": totalAmountPayable,
    "wallet_balance": walletBalance,
    "payed_amount": payedAmount,
    "walletid": walletid,
    "message": message,
  };
}
