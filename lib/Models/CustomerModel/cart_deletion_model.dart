// To parse this JSON data, do
//
//     final cartDeletionModel = cartDeletionModelFromJson(jsonString);

import 'dart:convert';

CartDeletionModel cartDeletionModelFromJson(String str) => CartDeletionModel.fromJson(json.decode(str));

String cartDeletionModelToJson(CartDeletionModel data) => json.encode(data.toJson());

class CartDeletionModel {
  final bool? status;
  final String? message;

  CartDeletionModel({
    this.status,
    this.message,
  });

  factory CartDeletionModel.fromJson(Map<String, dynamic> json) => CartDeletionModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
