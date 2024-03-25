// To parse this JSON data, do
//
//     final serviceDeliveryDateModel = serviceDeliveryDateModelFromJson(jsonString);

import 'dart:convert';

ServiceDeliveryDateModel serviceDeliveryDateModelFromJson(String str) => ServiceDeliveryDateModel.fromJson(json.decode(str));

String serviceDeliveryDateModelToJson(ServiceDeliveryDateModel data) => json.encode(data.toJson());

class ServiceDeliveryDateModel {
  final bool? status;
  final List<DeliveryDateData>? data;
  final String? message;

  ServiceDeliveryDateModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServiceDeliveryDateModel.fromJson(Map<String, dynamic> json) => ServiceDeliveryDateModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<DeliveryDateData>.from(json["data"]!.map((x) => DeliveryDateData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class DeliveryDateData {
  final DateTime? date;
  final String? day;

  DeliveryDateData({
    this.date,
    this.day,
  });

  factory DeliveryDateData.fromJson(Map<String, dynamic> json) => DeliveryDateData(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "day": day,
  };
}
