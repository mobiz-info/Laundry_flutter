// To parse this JSON data, do
//
//     final walletTransactionModel = walletTransactionModelFromJson(jsonString);

import 'dart:convert';

WalletTransactionModel walletTransactionModelFromJson(String str) => WalletTransactionModel.fromJson(json.decode(str));

String walletTransactionModelToJson(WalletTransactionModel data) => json.encode(data.toJson());

class WalletTransactionModel {
  final bool? status;
  final String? walletBal;
  final WalletTransactionList? data;
  final String? message;

  WalletTransactionModel({
    this.status,
    this.walletBal,
    this.data,
    this.message,
  });

  factory WalletTransactionModel.fromJson(Map<String, dynamic> json) => WalletTransactionModel(
    status: json["status"],
    walletBal: json["wallet_bal"],
    data: json["data"] == null ? null : WalletTransactionList.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "wallet_bal": walletBal,
    "data": data?.toJson(),
    "message": message,
  };
}

class WalletTransactionList {
  final List<All>? all;
  final List<All>? creditType;
  final List<All>? debitDetails;

  WalletTransactionList({
    this.all,
    this.creditType,
    this.debitDetails,
  });

  factory WalletTransactionList.fromJson(Map<String, dynamic> json) => WalletTransactionList(
    all: json["all"] == null ? [] : List<All>.from(json["all"]!.map((x) => All.fromJson(x))),
    creditType: json["credit_type"] == null ? [] : List<All>.from(json["credit_type"]!.map((x) => All.fromJson(x))),
    debitDetails: json["debit_details"] == null ? [] : List<All>.from(json["debit_details"]!.map((x) => All.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "all": all == null ? [] : List<dynamic>.from(all!.map((x) => x.toJson())),
    "credit_type": creditType == null ? [] : List<dynamic>.from(creditType!.map((x) => x.toJson())),
    "debit_details": debitDetails == null ? [] : List<dynamic>.from(debitDetails!.map((x) => x.toJson())),
  };
}

class All {
  final DateTime? createdDate;
  final String? transferId;
  final String? transferType;
  final String? orderOrderNumber;
  final String? amount;

  All({
    this.createdDate,
    this.transferId,
    this.transferType,
    this.orderOrderNumber,
    this.amount,
  });

  factory All.fromJson(Map<String, dynamic> json) => All(
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    transferId: json["transfer_id"],
    transferType: json["transfer_type"],
    orderOrderNumber: json["order__order_number"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "created_date": "${createdDate!.year.toString().padLeft(4, '0')}-${createdDate!.month.toString().padLeft(2, '0')}-${createdDate!.day.toString().padLeft(2, '0')}",
    "transfer_id": transferId,
    "transfer_type": transferType,
    "order__order_number": orderOrderNumber,
    "amount": amount,
  };
}