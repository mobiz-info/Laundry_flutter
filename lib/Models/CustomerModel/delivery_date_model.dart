// To parse this JSON data, do
//
//     final deliveryDateModel = deliveryDateModelFromJson(jsonString);

import 'dart:convert';

DeliveryDateModel deliveryDateModelFromJson(String str) => DeliveryDateModel.fromJson(json.decode(str));

String deliveryDateModelToJson(DeliveryDateModel data) => json.encode(data.toJson());

class DeliveryDateModel {
  final bool? status;
  final List<DeliveryDateList>? data;
  final String? message;

  DeliveryDateModel({
    this.status,
    this.data,
    this.message,
  });

  factory DeliveryDateModel.fromJson(Map<String, dynamic> json) => DeliveryDateModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<DeliveryDateList>.from(json["data"]!.map((x) => DeliveryDateList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class DeliveryDateList {
  final DateTime? date;
  final String? day;

  DeliveryDateList({
    this.date,
    this.day,
  });

  factory DeliveryDateList.fromJson(Map<String, dynamic> json) => DeliveryDateList(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "day": day,
  };
}
