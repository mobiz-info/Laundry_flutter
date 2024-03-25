// To parse this JSON data, do
//
//     final cartWalletModel = cartWalletModelFromJson(jsonString);

import 'dart:convert';

CartWalletModel cartWalletModelFromJson(String str) => CartWalletModel.fromJson(json.decode(str));

String cartWalletModelToJson(CartWalletModel data) => json.encode(data.toJson());

class CartWalletModel {
  final bool? status;
  var totalAmountPayable;
  var walletBalance;
  final String? walletid;
  final String? message;

  CartWalletModel({
    this.status,
    this.totalAmountPayable,
    this.walletBalance,
    this.walletid,
    this.message,
  });

  factory CartWalletModel.fromJson(Map<String, dynamic> json) => CartWalletModel(
    status: json["status"],
    totalAmountPayable: json["total_amount_payable"],
    walletBalance: json["wallet_balance"],
    walletid: json["walletid"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "total_amount_payable": totalAmountPayable,
    "wallet_balance": walletBalance,
    "walletid": walletid,
    "message": message,
  };
}
