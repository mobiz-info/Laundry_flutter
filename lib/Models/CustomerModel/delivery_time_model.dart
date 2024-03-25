// To parse this JSON data, do
//
//     final deliveryTimeModel = deliveryTimeModelFromJson(jsonString);

import 'dart:convert';

DeliveryTimeModel deliveryTimeModelFromJson(String str) => DeliveryTimeModel.fromJson(json.decode(str));

String deliveryTimeModelToJson(DeliveryTimeModel data) => json.encode(data.toJson());

class DeliveryTimeModel {
  final bool? status;
  final List<String>? data;
  final String? message;

  DeliveryTimeModel({
    this.status,
    this.data,
    this.message,
  });

  factory DeliveryTimeModel.fromJson(Map<String, dynamic> json) => DeliveryTimeModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<String>.from(json["data"]!.map((x) => x)),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    "message": message,
  };
}
