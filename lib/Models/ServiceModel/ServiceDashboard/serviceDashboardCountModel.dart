import 'dart:convert';

class ServiceDashboardCountModel {
  bool status;
  DashboardCountData data;
  String message;

  ServiceDashboardCountModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceDashboardCountModel copyWith({
    bool? status,
    DashboardCountData? data,
    String? message,
  }) =>
      ServiceDashboardCountModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceDashboardCountModel.fromRawJson(String str) => ServiceDashboardCountModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceDashboardCountModel.fromJson(Map<String, dynamic> json) => ServiceDashboardCountModel(
    status: json["status"],
    data: DashboardCountData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class DashboardCountData {
  int notStartedCount;
  int startedCount;
  int completedCount;
  int readyForDeliveryCount;
  int undeliveredCount;

  DashboardCountData({
    required this.notStartedCount,
    required this.startedCount,
    required this.completedCount,
    required this.readyForDeliveryCount,
    required this.undeliveredCount,
  });

  DashboardCountData copyWith({
    int? notStartedCount,
    int? startedCount,
    int? completedCount,
    int? readyForDeliveryCount,
    int? undeliveredCount,
  }) =>
      DashboardCountData(
        notStartedCount: notStartedCount ?? this.notStartedCount,
        startedCount: startedCount ?? this.startedCount,
        completedCount: completedCount ?? this.completedCount,
        readyForDeliveryCount: readyForDeliveryCount ?? this.readyForDeliveryCount,
        undeliveredCount: undeliveredCount ?? this.undeliveredCount,
      );

  factory DashboardCountData.fromRawJson(String str) => DashboardCountData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DashboardCountData.fromJson(Map<String, dynamic> json) => DashboardCountData(
    notStartedCount: json["not_started_count"],
    startedCount: json["started_count"],
    completedCount: json["completed_count"],
    readyForDeliveryCount: json["ready_for_delivery_count"],
    undeliveredCount: json["undelivered_count"],
  );

  Map<String, dynamic> toJson() => {
    "not_started_count": notStartedCount,
    "started_count": startedCount,
    "completed_count": completedCount,
    "ready_for_delivery_count": readyForDeliveryCount,
    "undelivered_count": undeliveredCount,
  };
}
