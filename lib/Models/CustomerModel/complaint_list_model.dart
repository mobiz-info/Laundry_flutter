// To parse this JSON data, do
//
//     final complaintListModel = complaintListModelFromJson(jsonString);

import 'dart:convert';

ComplaintListModel complaintListModelFromJson(String str) => ComplaintListModel.fromJson(json.decode(str));

String complaintListModelToJson(ComplaintListModel data) => json.encode(data.toJson());

class ComplaintListModel {
  final bool? status;
  final List<ComplaintListData>? data;
  final int? count;
  final String? message;

  ComplaintListModel({
    this.status,
    this.data,
    this.count,
    this.message,
  });

  factory ComplaintListModel.fromJson(Map<String, dynamic> json) => ComplaintListModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ComplaintListData>.from(json["data"]!.map((x) => ComplaintListData.fromJson(x))),
    count: json["count"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "count": count,
    "message": message,
  };
}

class ComplaintListData {
  final String? complaintId;
  final String? complaintType;
  final DateTime? createdDate;
  final String? remark;
  final String? service;
  final String? order;
  final String? status;
  final String? complaintNumber;

  ComplaintListData({
    this.complaintId,
    this.complaintType,
    this.createdDate,
    this.remark,
    this.service,
    this.order,
    this.status,
    this.complaintNumber,
  });

  factory ComplaintListData.fromJson(Map<String, dynamic> json) => ComplaintListData(
    complaintId: json["complaint_id"],
    complaintType: json["complaint_type"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    remark: json["remark"],
    service: json["service"],
    order: json["order"],
    status: json["status"],
    complaintNumber: json["complaint_number"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_id": complaintId,
    "complaint_type": complaintType,
    "created_date": createdDate?.toIso8601String(),
    "remark": remark,
    "service": service,
    "order": order,
    "status": status,
    "complaint_number": complaintNumber,
  };
}
