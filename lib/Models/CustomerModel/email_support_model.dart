// To parse this JSON data, do
//
//     final emailSupportModel = emailSupportModelFromJson(jsonString);

import 'dart:convert';

EmailSupportModel emailSupportModelFromJson(String str) => EmailSupportModel.fromJson(json.decode(str));

String emailSupportModelToJson(EmailSupportModel data) => json.encode(data.toJson());

class EmailSupportModel {
  final bool? status;
  final EmailSupportData? data;
  final String? message;

  EmailSupportModel({
    this.status,
    this.data,
    this.message,
  });

  factory EmailSupportModel.fromJson(Map<String, dynamic> json) => EmailSupportModel(
    status: json["status"],
    data: json["data"] == null ? null : EmailSupportData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class EmailSupportData {
  final String? contactId;
  final dynamic createdBy;
  final DateTime? createdDate;
  final String? email;
  final String? phone;
  final String? message;
  final String? customer;

  EmailSupportData({
    this.contactId,
    this.createdBy,
    this.createdDate,
    this.email,
    this.phone,
    this.message,
    this.customer,
  });

  factory EmailSupportData.fromJson(Map<String, dynamic> json) => EmailSupportData(
    contactId: json["contact_id"],
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    email: json["email"],
    phone: json["phone"],
    message: json["message"],
    customer: json["customer"],
  );

  Map<String, dynamic> toJson() => {
    "contact_id": contactId,
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "email": email,
    "phone": phone,
    "message": message,
    "customer": customer,
  };
}
