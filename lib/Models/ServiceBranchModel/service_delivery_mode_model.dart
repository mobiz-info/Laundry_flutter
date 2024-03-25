// To parse this JSON data, do
//
//     final serviceDeliveryModeModel = serviceDeliveryModeModelFromJson(jsonString);

import 'dart:convert';

ServiceDeliveryModeModel serviceDeliveryModeModelFromJson(String str) => ServiceDeliveryModeModel.fromJson(json.decode(str));

String serviceDeliveryModeModelToJson(ServiceDeliveryModeModel data) => json.encode(data.toJson());

class ServiceDeliveryModeModel {
  final bool? status;
  final List<ServiceDeliveryModeData>? data;
  final String? message;

  ServiceDeliveryModeModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServiceDeliveryModeModel.fromJson(Map<String, dynamic> json) => ServiceDeliveryModeModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ServiceDeliveryModeData>.from(json["data"]!.map((x) => ServiceDeliveryModeData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class ServiceDeliveryModeData {
  final String? mode;
  final String? name;
  final String? extraValue;

  ServiceDeliveryModeData({
    this.mode,
    this.name,
    this.extraValue,
  });

  factory ServiceDeliveryModeData.fromJson(Map<String, dynamic> json) => ServiceDeliveryModeData(
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
