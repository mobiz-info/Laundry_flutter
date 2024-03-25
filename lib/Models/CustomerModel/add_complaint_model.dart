// To parse this JSON data, do
//
//     final addComplaintModel = addComplaintModelFromJson(jsonString);

import 'dart:convert';

AddComplaintModel addComplaintModelFromJson(String str) => AddComplaintModel.fromJson(json.decode(str));

String addComplaintModelToJson(AddComplaintModel data) => json.encode(data.toJson());

class AddComplaintModel {
  final bool? status;
  final List<AddComplaintData>? data;
  final String? message;

  AddComplaintModel({
    this.status,
    this.data,
    this.message,
  });

  factory AddComplaintModel.fromJson(Map<String, dynamic> json) => AddComplaintModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<AddComplaintData>.from(json["data"]!.map((x) => AddComplaintData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class AddComplaintData {
  final String? orderId;
  final String? orderNumber;
  final DateTime? deliveryDate;
  final String? totalAmount;
  final String? status;
  final int? quantity;

  AddComplaintData({
    this.orderId,
    this.orderNumber,
    this.deliveryDate,
    this.totalAmount,
    this.status,
    this.quantity,
  });

  factory AddComplaintData.fromJson(Map<String, dynamic> json) => AddComplaintData(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
    totalAmount: json["total_amount"],
    status: json["status"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
    "total_amount": totalAmount,
    "status": status,
    "quantity": quantity,
  };
}
