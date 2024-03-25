import 'dart:convert';

PendingSearchModel pendingSearchModelFromJson(String str) => PendingSearchModel.fromJson(json.decode(str));

String pendingSearchModelToJson(PendingSearchModel data) => json.encode(data.toJson());

class PendingSearchModel {
  final bool? status;
  final PendingSearchData? data;
  final String? message;

  PendingSearchModel({
    this.status,
    this.data,
    this.message,
  });

  factory PendingSearchModel.fromJson(Map<String, dynamic> json) => PendingSearchModel(
    status: json["status"],
    data: json["data"] == null ? null : PendingSearchData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class PendingSearchData {
  final List<PendingDetails>? pendingData;
  final int? pendingCount;

  PendingSearchData({
    this.pendingData,
    this.pendingCount,
  });

  factory PendingSearchData.fromJson(Map<String, dynamic> json) => PendingSearchData(
    pendingData: json["pending_data"] == null ? [] : List<PendingDetails>.from(json["pending_data"]!.map((x) => PendingDetails.fromJson(x))),
    pendingCount: json["pending_count"],
  );

  Map<String, dynamic> toJson() => {
    "pending_data": pendingData == null ? [] : List<dynamic>.from(pendingData!.map((x) => x.toJson())),
    "pending_count": pendingCount,
  };
}

class PendingDetails {
  final String? orderNumber;
  final String? orderType;
  final String? staffName;
  final dynamic deliveryTime;
  final String? deliveryDate;
  final String? status;

  PendingDetails({
    this.orderNumber,
    this.orderType,
    this.staffName,
    this.deliveryTime,
    this.deliveryDate,
    this.status,
  });

  factory PendingDetails.fromJson(Map<String, dynamic> json) => PendingDetails(
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

