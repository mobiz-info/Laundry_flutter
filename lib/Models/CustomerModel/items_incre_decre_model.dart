// To parse this JSON data, do
//
//     final itemsIncreDecreModel = itemsIncreDecreModelFromJson(jsonString);

import 'dart:convert';

ItemsIncreDecreModel itemsIncreDecreModelFromJson(String str) => ItemsIncreDecreModel.fromJson(json.decode(str));

String itemsIncreDecreModelToJson(ItemsIncreDecreModel data) => json.encode(data.toJson());

class ItemsIncreDecreModel {
  final bool? status;
  final ItemsIncDecData? data;
  final String? message;

  ItemsIncreDecreModel({
    this.status,
    this.data,
    this.message,
  });

  factory ItemsIncreDecreModel.fromJson(Map<String, dynamic> json) => ItemsIncreDecreModel(
    status: json["status"],
    data: json["data"] == null ? null : ItemsIncDecData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class ItemsIncDecData {
  final String? priceListId;
  final String? itemServiceId;
  final String? quantity;
  final int? amount;

  ItemsIncDecData({
    this.priceListId,
    this.itemServiceId,
    this.quantity,
    this.amount,
  });

  factory ItemsIncDecData.fromJson(Map<String, dynamic> json) => ItemsIncDecData(
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
