import 'dart:convert';

CompletedOrdersModel completedOrdersModelFromJson(String str) => CompletedOrdersModel.fromJson(json.decode(str));

String completedOrdersModelToJson(CompletedOrdersModel data) => json.encode(data.toJson());

class CompletedOrdersModel {
  final bool? status;
  final CompletedOrdersData? data;
  final String? message;

  CompletedOrdersModel({
    this.status,
    this.data,
    this.message,
  });

  factory CompletedOrdersModel.fromJson(Map<String, dynamic> json) => CompletedOrdersModel(
    status: json["status"],
    data: json["data"] == null ? null : CompletedOrdersData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class CompletedOrdersData {
  final List<Completed>? completed;
  final int? completedCount;

  CompletedOrdersData({
    this.completed,
    this.completedCount,
  });

  factory CompletedOrdersData.fromJson(Map<String, dynamic> json) => CompletedOrdersData(
    completed: json["completed"] == null ? [] : List<Completed>.from(json["completed"]!.map((x) => Completed.fromJson(x))),
    completedCount: json["completed_count"],
  );

  Map<String, dynamic> toJson() => {
    "completed": completed == null ? [] : List<dynamic>.from(completed!.map((x) => x.toJson())),
    "completed_count": completedCount,
  };
}

class Completed {
  final String? orderNumber;
  final String? orderType;
  final String? staffName;
  final dynamic deliveryTime;
  final String? deliveryDate;
  final String? status;

  Completed({
    this.orderNumber,
    this.orderType,
    this.staffName,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
  });

  factory Completed.fromJson(Map<String, dynamic> json) => Completed(
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

