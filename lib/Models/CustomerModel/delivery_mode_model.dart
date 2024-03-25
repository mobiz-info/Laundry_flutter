// To parse this JSON data, do
//
//     final deliveryModeModel = deliveryModeModelFromJson(jsonString);

import 'dart:convert';

DeliveryModeModel deliveryModeModelFromJson(String str) => DeliveryModeModel.fromJson(json.decode(str));

String deliveryModeModelToJson(DeliveryModeModel data) => json.encode(data.toJson());

class DeliveryModeModel {
  final bool? status;
  final List<DeliveryModeList>? data;
  final String? message;

  DeliveryModeModel({
    this.status,
    this.data,
    this.message,
  });

  factory DeliveryModeModel.fromJson(Map<String, dynamic> json) => DeliveryModeModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<DeliveryModeList>.from(json["data"]!.map((x) => DeliveryModeList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class DeliveryModeList {
  final String? mode;
  final String? name;
  final String? extraValue;

  DeliveryModeList({
    this.mode,
    this.name,
    this.extraValue,
  });

  factory DeliveryModeList.fromJson(Map<String, dynamic> json) => DeliveryModeList(
    mode: json["mode"],
    name: json["name"],
    extraValue: json["extra_value"],
  );

  Map<String, dynamic> toJson() => {
    "mode": mode,
    "name": name,
    "extra_value": extraValue,
  };
}
