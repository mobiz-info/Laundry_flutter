// To parse this JSON data, do
//
//     final engageSearchModel = engageSearchModelFromJson(jsonString);

import 'dart:convert';

EngageSearchModel engageSearchModelFromJson(String str) => EngageSearchModel.fromJson(json.decode(str));

String engageSearchModelToJson(EngageSearchModel data) => json.encode(data.toJson());

class EngageSearchModel {
  final bool? status;
  final EngageSearchData? data;
  final String? message;

  EngageSearchModel({
    this.status,
    this.data,
    this.message,
  });

  factory EngageSearchModel.fromJson(Map<String, dynamic> json) => EngageSearchModel(
    status: json["status"],
    data: json["data"] == null ? null : EngageSearchData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class EngageSearchData {
  final List<OrderData>? order;
  final int? ordercount;

  EngageSearchData({
    this.order,
    this.ordercount,
  });

  factory EngageSearchData.fromJson(Map<String, dynamic> json) => EngageSearchData(
    order: json["order"] == null ? [] : List<OrderData>.from(json["order"]!.map((x) => OrderData.fromJson(x))),
    ordercount: json["ordercount"],
  );

  Map<String, dynamic> toJson() => {
    "order": order == null ? [] : List<dynamic>.from(order!.map((x) => x.toJson())),
    "ordercount": ordercount,
  };
}

class OrderData {
  final String? orderNumber;
  final String? orderType;
  final dynamic staffName;
  final dynamic deliveryTime;
  final dynamic deliveryDate;
  final String? status;

  OrderData({
    this.orderNumber,
    this.orderType,
    this.staffName,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) => OrderData(
    orderNumber: json["order_number"],
    orderType: json["order_type"],
    staffName: json["staff__name"],
    deliveryTime: json["Delivery_time"],
    deliveryDate: json["Delivery_date"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "order_number": orderNumber,
    "order_type": orderType,
    "staff__name": staffName,
    "Delivery_time": deliveryTime,
    "Delivery_date": deliveryDate,
    "status": status,
  };
}
