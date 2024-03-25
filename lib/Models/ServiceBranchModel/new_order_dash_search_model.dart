import 'dart:convert';

NewOrderDashSearchModel newOrderDashSearchModelFromJson(String str) => NewOrderDashSearchModel.fromJson(json.decode(str));

String newOrderDashSearchModelToJson(NewOrderDashSearchModel data) => json.encode(data.toJson());

class NewOrderDashSearchModel {
  final bool? status;
  final NewOrderSearchData? data;
  final String? message;

  NewOrderDashSearchModel({
    this.status,
    this.data,
    this.message,
  });

  factory NewOrderDashSearchModel.fromJson(Map<String, dynamic> json) => NewOrderDashSearchModel(
    status: json["status"],
    data: json["data"] == null ? null : NewOrderSearchData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class NewOrderSearchData {
  final List<SearchOrder>? order;
  final int? ordercount;

  NewOrderSearchData({
    this.order,
    this.ordercount,
  });

  factory NewOrderSearchData.fromJson(Map<String, dynamic> json) => NewOrderSearchData(
    order: json["order"] == null ? [] : List<SearchOrder>.from(json["order"]!.map((x) => SearchOrder.fromJson(x))),
    ordercount: json["ordercount"],
  );

  Map<String, dynamic> toJson() => {
    "order": order == null ? [] : List<dynamic>.from(order!.map((x) => x.toJson())),
    "ordercount": ordercount,
  };
}

class SearchOrder {
  final String? orderNumber;
  final String? orderType;
  final String? staffName;
  final dynamic deliveryTime;
  final String? deliveryDate;
  final String? status;

  SearchOrder({
    this.orderNumber,
    this.orderType,
    this.staffName,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
  });

  factory SearchOrder.fromJson(Map<String, dynamic> json) => SearchOrder(
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

