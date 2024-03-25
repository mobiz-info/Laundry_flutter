import 'dart:convert';

PendingOrdersModel pendingOrdersModelFromJson(String str) => PendingOrdersModel.fromJson(json.decode(str));

String pendingOrdersModelToJson(PendingOrdersModel data) => json.encode(data.toJson());

class PendingOrdersModel {
  final bool? status;
  final PendingOrdersData? data;
  final String? message;

  PendingOrdersModel({
    this.status,
    this.data,
    this.message,
  });

  factory PendingOrdersModel.fromJson(Map<String, dynamic> json) => PendingOrdersModel(
    status: json["status"],
    data: json["data"] == null ? null : PendingOrdersData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class PendingOrdersData {
  final List<PendingData>? pendingData;
  final int? pendingCount;

  PendingOrdersData({
    this.pendingData,
    this.pendingCount,
  });

  factory PendingOrdersData.fromJson(Map<String, dynamic> json) => PendingOrdersData(
    pendingData: json["pending_data"] == null ? [] : List<PendingData>.from(json["pending_data"]!.map((x) => PendingData.fromJson(x))),
    pendingCount: json["pending_count"],
  );

  Map<String, dynamic> toJson() => {
    "pending_data": pendingData == null ? [] : List<dynamic>.from(pendingData!.map((x) => x.toJson())),
    "pending_count": pendingCount,
  };
}

class PendingData {
  final String? orderNumber;
  final String? orderType;
  final String? staffName;
  final String? deliveryTime;
  final String? deliveryDate;
  final String? status;

  PendingData({
    this.orderNumber,
    this.orderType,
    this.staffName,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
  });

  factory PendingData.fromJson(Map<String, dynamic> json) => PendingData(
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

