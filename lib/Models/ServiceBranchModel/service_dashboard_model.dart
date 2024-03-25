// To parse this JSON data, do
//
//     final serviceDashboardModel = serviceDashboardModelFromJson(jsonString);

import 'dart:convert';

ServiceDashboardModel serviceDashboardModelFromJson(String str) => ServiceDashboardModel.fromJson(json.decode(str));

String serviceDashboardModelToJson(ServiceDashboardModel data) => json.encode(data.toJson());

class ServiceDashboardModel {
  final bool? status;
  final ServiceDashboardData? data;
  final String? message;

  ServiceDashboardModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServiceDashboardModel.fromJson(Map<String, dynamic> json) => ServiceDashboardModel(
    status: json["status"],
    data: json["data"] == null ? null : ServiceDashboardData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class ServiceDashboardData {
  final DashboardCounts? dashboardCounts;
  final Express? normal;
  final Express? express;
  final Express? urgent;
  final List<Category>? category;

  ServiceDashboardData({
    this.dashboardCounts,
    this.normal,
    this.express,
    this.urgent,
    this.category,
  });

  factory ServiceDashboardData.fromJson(Map<String, dynamic> json) => ServiceDashboardData(
    dashboardCounts: json["dashboard_counts"] == null ? null : DashboardCounts.fromJson(json["dashboard_counts"]),
    normal: json["normal"] == null ? null : Express.fromJson(json["normal"]),
    express: json["express"] == null ? null : Express.fromJson(json["express"]),
    urgent: json["urgent"] == null ? null : Express.fromJson(json["urgent"]),
    category: json["category"] == null ? [] : List<Category>.from(json["category"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "dashboard_counts": dashboardCounts?.toJson(),
    "normal": normal?.toJson(),
    "express": express?.toJson(),
    "urgent": urgent?.toJson(),
    "category": category == null ? [] : List<dynamic>.from(category!.map((x) => x.toJson())),
  };
}

class Category {
  final String? title;
  final Express? data;

  Category({
    this.title,
    this.data,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    title: json["title"],
    data: json["data"] == null ? null : Express.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "data": data?.toJson(),
  };
}

class Express {
  final int? expressNew;
  final int? processing;
  final int? completed;
  final int? pending;

  Express({
    this.expressNew,
    this.processing,
    this.completed,
    this.pending,
  });

  factory Express.fromJson(Map<String, dynamic> json) => Express(
    expressNew: json["new"],
    processing: json["processing"],
    completed: json["completed"],
    pending: json["pending"],
  );

  Map<String, dynamic> toJson() => {
    "new": expressNew,
    "processing": processing,
    "completed": completed,
    "pending": pending,
  };
}

class DashboardCounts {
  final int? acceptOrders;
  final int? pending;
  final int? completed;
  final int? readyForDelivery;
  final int? dashboardCountsNew;

  DashboardCounts({
    this.acceptOrders,
    this.pending,
    this.completed,
    this.readyForDelivery,
    this.dashboardCountsNew,
  });

  factory DashboardCounts.fromJson(Map<String, dynamic> json) => DashboardCounts(
    acceptOrders: json["accept_orders"],
    pending: json["pending"],
    completed: json["completed"],
    readyForDelivery: json["ready_for_delivery"],
    dashboardCountsNew: json["new"],
  );

  Map<String, dynamic> toJson() => {
    "accept_orders": acceptOrders,
    "pending": pending,
    "completed": completed,
    "ready_for_delivery": readyForDelivery,
    "new": dashboardCountsNew,
  };
}
