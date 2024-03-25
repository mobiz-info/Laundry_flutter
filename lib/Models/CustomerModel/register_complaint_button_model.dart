// To parse this JSON data, do
//
//     final registerComplaintButtonModel = registerComplaintButtonModelFromJson(jsonString);

import 'dart:convert';

RegisterComplaintButtonModel registerComplaintButtonModelFromJson(String str) => RegisterComplaintButtonModel.fromJson(json.decode(str));

String registerComplaintButtonModelToJson(RegisterComplaintButtonModel data) => json.encode(data.toJson());

class RegisterComplaintButtonModel {
  final bool? status;
  final RegisterButtonData? data;
  final String? message;

  RegisterComplaintButtonModel({
    this.status,
    this.data,
    this.message,
  });

  factory RegisterComplaintButtonModel.fromJson(Map<String, dynamic> json) => RegisterComplaintButtonModel(
    status: json["status"],
    data: json["data"] == null ? null : RegisterButtonData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class RegisterButtonData {
  final String? complaintId;
  final dynamic createdBy;
  final DateTime? createdDate;
  final String? photo;
  final String? uploadPhoto;
  final String? remarks;
  final String? status;
  final dynamic reply;
  final String? complaintNumber;
  final String? complaintType;
  final String? service;
  final String? order;
  final String? customer;

  RegisterButtonData({
    this.complaintId,
    this.createdBy,
    this.createdDate,
    this.photo,
    this.uploadPhoto,
    this.remarks,
    this.status,
    this.reply,
    this.complaintNumber,
    this.complaintType,
    this.service,
    this.order,
    this.customer,
  });

  factory RegisterButtonData.fromJson(Map<String, dynamic> json) => RegisterButtonData(
    complaintId: json["complaint_id"],
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    photo: json["photo"],
    uploadPhoto: json["upload_photo"],
    remarks: json["remarks"],
    status: json["status"],
    reply: json["reply"],
    complaintNumber: json["complaint_number"],
    complaintType: json["complaint_type"],
    service: json["service"],
    order: json["order"],
    customer: json["customer"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_id": complaintId,
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "photo": photo,
    "upload_photo": uploadPhoto,
    "remarks": remarks,
    "status": status,
    "reply": reply,
    "complaint_number": complaintNumber,
    "complaint_type": complaintType,
    "service": service,
    "order": order,
    "customer": customer,
  };
}
