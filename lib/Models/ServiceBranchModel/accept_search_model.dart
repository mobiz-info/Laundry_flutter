import 'dart:convert';

AcceptSearchModel acceptSearchModelFromJson(String str) => AcceptSearchModel.fromJson(json.decode(str));

String acceptSearchModelToJson(AcceptSearchModel data) => json.encode(data.toJson());

class AcceptSearchModel {
  final bool? status;
  final AcceptSearchData? data;
  final String? message;

  AcceptSearchModel({
    this.status,
    this.data,
    this.message,
  });

  factory AcceptSearchModel.fromJson(Map<String, dynamic> json) => AcceptSearchModel(
    status: json["status"],
    data: json["data"] == null ? null : AcceptSearchData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class AcceptSearchData {
  final List<AcceptOrder>? acceptOrders;
  final int? acceptOrdersCount;

  AcceptSearchData({
    this.acceptOrders,
    this.acceptOrdersCount,
  });

  factory AcceptSearchData.fromJson(Map<String, dynamic> json) => AcceptSearchData(
    acceptOrders: json["accept_orders"] == null ? [] : List<AcceptOrder>.from(json["accept_orders"]!.map((x) => AcceptOrder.fromJson(x))),
    acceptOrdersCount: json["accept_orders_count"],
  );

  Map<String, dynamic> toJson() => {
    "accept_orders": acceptOrders == null ? [] : List<dynamic>.from(acceptOrders!.map((x) => x.toJson())),
    "accept_orders_count": acceptOrdersCount,
  };
}

class AcceptOrder {
  final String? orderNumber;
  final String? orderType;
  final String? staffName;
  final dynamic deliveryTime;
  final String? deliveryDate;
  final String? status;

  AcceptOrder({
    this.orderNumber,
    this.orderType,
    this.staffName,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
  });

  factory AcceptOrder.fromJson(Map<String, dynamic> json) => AcceptOrder(
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

