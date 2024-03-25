// To parse this JSON data, do
//
//     final cartPaymentListModel = cartPaymentListModelFromJson(jsonString);

import 'dart:convert';

CartPaymentListModel cartPaymentListModelFromJson(String str) => CartPaymentListModel.fromJson(json.decode(str));

String cartPaymentListModelToJson(CartPaymentListModel data) => json.encode(data.toJson());

class CartPaymentListModel {
  final bool? status;
  final List<CartPaymentListData>? data;
  final String? message;

  CartPaymentListModel({
    this.status,
    this.data,
    this.message,
  });

  factory CartPaymentListModel.fromJson(Map<String, dynamic> json) => CartPaymentListModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<CartPaymentListData>.from(json["data"]!.map((x) => CartPaymentListData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class CartPaymentListData {
  final String? paymentMethod;

  CartPaymentListData({
    this.paymentMethod,
  });

  factory CartPaymentListData.fromJson(Map<String, dynamic> json) => CartPaymentListData(
    paymentMethod: json["payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod,
  };
}
