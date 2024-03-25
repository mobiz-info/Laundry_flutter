// To parse this JSON data, do
//
//     final serItemsIncDecModel = serItemsIncDecModelFromJson(jsonString);

import 'dart:convert';

SerItemsIncDecModel serItemsIncDecModelFromJson(String str) => SerItemsIncDecModel.fromJson(json.decode(str));

String serItemsIncDecModelToJson(SerItemsIncDecModel data) => json.encode(data.toJson());

class SerItemsIncDecModel {
  final bool? status;
  final SerItemsIncDecData? data;
  final String? message;

  SerItemsIncDecModel({
    this.status,
    this.data,
    this.message,
  });

  factory SerItemsIncDecModel.fromJson(Map<String, dynamic> json) => SerItemsIncDecModel(
    status: json["status"],
    data: json["data"] == null ? null : SerItemsIncDecData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class SerItemsIncDecData {
  final String? priceListId;
  final String? itemServiceId;
  final String? quantity;
  final int? amount;

  SerItemsIncDecData({
    this.priceListId,
    this.itemServiceId,
    this.quantity,
    this.amount,
  });

  factory SerItemsIncDecData.fromJson(Map<String, dynamic> json) => SerItemsIncDecData(
    priceListId: json["price_list_id"],
    itemServiceId: json["item_service_id"],
    quantity: json["quantity"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "price_list_id": priceListId,
    "item_service_id": itemServiceId,
    "quantity": quantity,
    "amount": amount,
  };
}
