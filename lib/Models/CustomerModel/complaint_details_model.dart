// To parse this JSON data, do
//
//     final complaintDetailsModel = complaintDetailsModelFromJson(jsonString);

import 'dart:convert';

ComplaintDetailsModel complaintDetailsModelFromJson(String str) => ComplaintDetailsModel.fromJson(json.decode(str));

String complaintDetailsModelToJson(ComplaintDetailsModel data) => json.encode(data.toJson());

class ComplaintDetailsModel {
  final bool? status;
  final List<ComplaintDetailsData>? data;
  final String? message;

  ComplaintDetailsModel({
    this.status,
    this.data,
    this.message,
  });

  factory ComplaintDetailsModel.fromJson(Map<String, dynamic> json) => ComplaintDetailsModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ComplaintDetailsData>.from(json["data"]!.map((x) => ComplaintDetailsData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class ComplaintDetailsData {
  final Details? details;
  final Pic? pic;

  ComplaintDetailsData({
    this.details,
    this.pic,
  });

  factory ComplaintDetailsData.fromJson(Map<String, dynamic> json) => ComplaintDetailsData(
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
    pic: json["pic"] == null ? null : Pic.fromJson(json["pic"]),
  );

  Map<String, dynamic> toJson() => {
    "details": details?.toJson(),
    "pic": pic?.toJson(),
  };
}

class Details {
  final String? complaintId;
  final DateTime? createdDate;
  final String? complaintType;
  final String? service;
  final String? order;
  final String? remarks;
  final String? status;
  final dynamic replyFromCom;
  final String? complaintNumber;

  Details({
    this.complaintId,
    this.createdDate,
    this.complaintType,
    this.service,
    this.order,
    this.remarks,
    this.status,
    this.replyFromCom,
    this.complaintNumber,
  });

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    complaintId: json["complaint_id"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    complaintType: json["complaint_type"],
    service: json["service"],
    order: json["order"],
    remarks: json["remarks"],
    status: json["status"],
    replyFromCom: json["reply_from_com"],
    complaintNumber: json["complaint_number"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_id": complaintId,
    "created_date": createdDate?.toIso8601String(),
    "complaint_type": complaintType,
    "service": service,
    "order": order,
    "remarks": remarks,
    "status": status,
    "reply_from_com": replyFromCom,
    "complaint_number": complaintNumber,
  };
}

class Pic {
  final String? photo;

  Pic({
    this.photo,
  });

  factory Pic.fromJson(Map<String, dynamic> json) => Pic(
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "photo": photo,
  };
}
