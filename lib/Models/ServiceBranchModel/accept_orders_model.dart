import 'dart:convert';

AcceptOrdersModel acceptOrdersModelFromJson(String str) => AcceptOrdersModel.fromJson(json.decode(str));

String acceptOrdersModelToJson(AcceptOrdersModel data) => json.encode(data.toJson());

class AcceptOrdersModel {
  final bool? status;
  final AcceptOrdersData? data;
  final String? message;

  AcceptOrdersModel({
    this.status,
    this.data,
    this.message,
  });

  factory AcceptOrdersModel.fromJson(Map<String, dynamic> json) => AcceptOrdersModel(
    status: json["status"],
    data: json["data"] == null ? null : AcceptOrdersData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class AcceptOrdersData {
  final List<AcceptOrders>? acceptOrders;
  final int? acceptOrdersCount;

  AcceptOrdersData({
    this.acceptOrders,
    this.acceptOrdersCount,
  });

  factory AcceptOrdersData.fromJson(Map<String, dynamic> json) => AcceptOrdersData(
    acceptOrders: json["accept_orders"] == null ? [] : List<AcceptOrders>.from(json["accept_orders"]!.map((x) => AcceptOrders.fromJson(x))),
    acceptOrdersCount: json["accept_orders_count"],
  );

  Map<String, dynamic> toJson() => {
    "accept_orders": acceptOrders == null ? [] : List<dynamic>.from(acceptOrders!.map((x) => x.toJson())),
    "accept_orders_count": acceptOrdersCount,
  };
}

class AcceptOrders {
  final String? orderNumber;
  final String? orderType;
  final String? staffName;
  final String? deliveryTime;
  final String? deliveryDate;
  final String? status;

  AcceptOrders({
    this.orderNumber,
    this.orderType,
    this.staffName,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
  });

  factory AcceptOrders.fromJson(Map<String, dynamic> json) => AcceptOrders(
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
