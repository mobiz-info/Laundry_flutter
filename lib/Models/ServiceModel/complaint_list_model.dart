import 'dart:convert';

class ServiceComplaintListModel {
  bool status;
  List<Datum> data;
  String message;

  ServiceComplaintListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ServiceComplaintListModel copyWith({
    bool? status,
    List<Datum>? data,
    String? message,
  }) =>
      ServiceComplaintListModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ServiceComplaintListModel.fromRawJson(String str) => ServiceComplaintListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceComplaintListModel.fromJson(Map<String, dynamic> json) => ServiceComplaintListModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  String complaintId;
  dynamic createdBy;
  DateTime createdDate;
  String photo;
  String remarks;
  String status;
  dynamic reply;
  String complaintType;
  String service;
  String order;
  String customer;

  Datum({
    required this.complaintId,
    required this.createdBy,
    required this.createdDate,
    required this.photo,
    required this.remarks,
    required this.status,
    required this.reply,
    required this.complaintType,
    required this.service,
    required this.order,
    required this.customer,
  });

  Datum copyWith({
    String? complaintId,
    dynamic createdBy,
    DateTime? createdDate,
    String? photo,
    String? remarks,
    String? status,
    dynamic reply,
    String? complaintType,
    String? service,
    String? order,
    String? customer,
  }) =>
      Datum(
        complaintId: complaintId ?? this.complaintId,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        photo: photo ?? this.photo,
        remarks: remarks ?? this.remarks,
        status: status ?? this.status,
        reply: reply ?? this.reply,
        complaintType: complaintType ?? this.complaintType,
        service: service ?? this.service,
        order: order ?? this.order,
        customer: customer ?? this.customer,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    complaintId: json["complaint_id"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    photo: json["photo"],
    remarks: json["remarks"],
    status: json["status"],
    reply: json["reply"],
    complaintType: json["complaint_type"],
    service: json["service"],
    order: json["order"],
    customer: json["customer"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_id": complaintId,
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "photo": photo,
    "remarks": remarks,
    "status": status,
    "reply": reply,
    "complaint_type": complaintType,
    "service": service,
    "order": order,
    "customer": customer,
  };
}
