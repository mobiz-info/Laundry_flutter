// To parse this JSON data, do
//
//     final engageOrdersModel = engageOrdersModelFromJson(jsonString);

import 'dart:convert';

EngageOrdersModel engageOrdersModelFromJson(String str) => EngageOrdersModel.fromJson(json.decode(str));

String engageOrdersModelToJson(EngageOrdersModel data) => json.encode(data.toJson());

class EngageOrdersModel {
  final bool? status;
  final EngageOrdersData? data;
  final String? message;

  EngageOrdersModel({
    this.status,
    this.data,
    this.message,
  });

  factory EngageOrdersModel.fromJson(Map<String, dynamic> json) => EngageOrdersModel(
    status: json["status"],
    data: json["data"] == null ? null : EngageOrdersData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class EngageOrdersData {
  final List<Order>? order;
  final int? ordercount;

  EngageOrdersData({
    this.order,
    this.ordercount,
  });

  factory EngageOrdersData.fromJson(Map<String, dynamic> json) => EngageOrdersData(
    order: json["order"] == null ? [] : List<Order>.from(json["order"]!.map((x) => Order.fromJson(x))),
    ordercount: json["ordercount"],
  );

  Map<String, dynamic> toJson() => {
    "order": order == null ? [] : List<dynamic>.from(order!.map((x) => x.toJson())),
    "ordercount": ordercount,
  };
}

class Order {
  final String? orderNumber;
  final String? orderType;
  final String? staffName;
  final String? deliveryTime;
  final DateTime? deliveryDate;
  final String? status;

  Order({
    this.orderNumber,
    this.orderType,
    this.staffName,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderNumber: json["order_number"],
    orderType: json["order_type"],
    staffName: json["staff__name"],
    deliveryTime: json["Delivery_time"],
    deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "order_number": orderNumber,
    "order_type": orderType,
    "staff__name": staffName,
    "Delivery_time": deliveryTime,
    "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
    "status": status,
  };
}