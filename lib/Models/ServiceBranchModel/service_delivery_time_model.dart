// To parse this JSON data, do
//
//     final serviceDeliveryTimeModel = serviceDeliveryTimeModelFromJson(jsonString);

import 'dart:convert';

ServiceDeliveryTimeModel serviceDeliveryTimeModelFromJson(String str) => ServiceDeliveryTimeModel.fromJson(json.decode(str));

String serviceDeliveryTimeModelToJson(ServiceDeliveryTimeModel data) => json.encode(data.toJson());

class ServiceDeliveryTimeModel {
  final bool? status;
  final List<String>? data;
  final String? message;

  ServiceDeliveryTimeModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServiceDeliveryTimeModel.fromJson(Map<String, dynamic> json) => ServiceDeliveryTimeModel(
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
