// To parse this JSON data, do
//
//     final cartItemsIncDecModel = cartItemsIncDecModelFromJson(jsonString);

import 'dart:convert';

CartItemsIncDecModel cartItemsIncDecModelFromJson(String str) => CartItemsIncDecModel.fromJson(json.decode(str));

String cartItemsIncDecModelToJson(CartItemsIncDecModel data) => json.encode(data.toJson());

class CartItemsIncDecModel {
  final bool? status;
  final CartItemsIncDecData? data;
  final String? message;

  CartItemsIncDecModel({
    this.status,
    this.data,
    this.message,
  });

  factory CartItemsIncDecModel.fromJson(Map<String, dynamic> json) => CartItemsIncDecModel(
    status: json["status"],
    data: json["data"] == null ? null : CartItemsIncDecData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class CartItemsIncDecData {
  final String? cartId;
  final dynamic createdBy;
  final DateTime? createdDate;
  final String? quantity;
  final String? amount;
  final String? order;
  final String? itemService;
  final String? priceList;
  final String? serviceCategory;
  final String? serviceSubCategory;

  CartItemsIncDecData({
    this.cartId,
    this.createdBy,
    this.createdDate,
    this.quantity,
    this.amount,
    this.order,
    this.itemService,
    this.priceList,
    this.serviceCategory,
    this.serviceSubCategory,
  });

  factory CartItemsIncDecData.fromJson(Map<String, dynamic> json) => CartItemsIncDecData(
    cartId: json["cart_id"],
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    quantity: json["quantity"],
    amount: json["amount"],
    order: json["order"],
    itemService: json["item_service"],
    priceList: json["price_list"],
    serviceCategory: json["service_category"],
    serviceSubCategory: json["service_sub_category"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "quantity": quantity,
    "amount": amount,
    "order": order,
    "item_service": itemService,
    "price_list": priceList,
    "service_category": serviceCategory,
    "service_sub_category": serviceSubCategory,
  };
}
