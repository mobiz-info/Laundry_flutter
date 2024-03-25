import 'dart:convert';

CompletedOrderSearchModel completedOrderSearchModelFromJson(String str) => CompletedOrderSearchModel.fromJson(json.decode(str));

String completedOrderSearchModelToJson(CompletedOrderSearchModel data) => json.encode(data.toJson());

class CompletedOrderSearchModel {
  final bool? status;
  final CompletedOrderSearchData? data;
  final String? message;

  CompletedOrderSearchModel({
    this.status,
    this.data,
    this.message,
  });

  factory CompletedOrderSearchModel.fromJson(Map<String, dynamic> json) => CompletedOrderSearchModel(
    status: json["status"],
    data: json["data"] == null ? null : CompletedOrderSearchData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class CompletedOrderSearchData {
  final List<CompletedData>? completed;
  final int? completedCount;

  CompletedOrderSearchData({
    this.completed,
    this.completedCount,
  });

  factory CompletedOrderSearchData.fromJson(Map<String, dynamic> json) => CompletedOrderSearchData(
    completed: json["completed"] == null ? [] : List<CompletedData>.from(json["completed"]!.map((x) => CompletedData.fromJson(x))),
    completedCount: json["completed_count"],
  );

  Map<String, dynamic> toJson() => {
    "completed": completed == null ? [] : List<dynamic>.from(completed!.map((x) => x.toJson())),
    "completed_count": completedCount,
  };
}

class CompletedData {
  final String? orderNumber;
  final String? orderType;
  final String? staffName;
  final dynamic deliveryTime;
  final String? deliveryDate;
  final String? status;

  CompletedData({
    this.orderNumber,
    this.orderType,
    this.staffName,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
  });

  factory CompletedData.fromJson(Map<String, dynamic> json) => CompletedData(
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

