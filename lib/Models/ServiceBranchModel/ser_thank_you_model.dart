// To parse this JSON data, do
//
//     final serThankYouModel = serThankYouModelFromJson(jsonString);

import 'dart:convert';

SerThankYouModel serThankYouModelFromJson(String str) => SerThankYouModel.fromJson(json.decode(str));

String serThankYouModelToJson(SerThankYouModel data) => json.encode(data.toJson());

class SerThankYouModel {
  final bool? status;
  final SerThankYouData? data;
  final String? message;

  SerThankYouModel({
    this.status,
    this.data,
    this.message,
  });

  factory SerThankYouModel.fromJson(Map<String, dynamic> json) => SerThankYouModel(
    status: json["status"],
    data: json["data"] == null ? null : SerThankYouData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class SerThankYouData {
  final String? orderId;
  final String? createdBy;
  final DateTime? createdDate;
  final String? orderNumber;
  final DateTime? pickupDate;
  final String? pickupTime;
  final String? pickupMode;
  final bool? confirmPickup;
  final String? status;
  final String? orderType;
  final String? totalAmount;
  final String? orderVia;
  final DateTime? orderDate;
  final dynamic deliveryDate;
  final dynamic deliveryTime;
  final bool? paidStatus;
  final String? discount;
  final String? netTaxable;
  final String? vat;
  final String? grantTotal;
  final String? staff;
  final String? customer;
  final dynamic invoice;
  final String? customerAddress;

  SerThankYouData({
    this.orderId,
    this.createdBy,
    this.createdDate,
    this.orderNumber,
    this.pickupDate,
    this.pickupTime,
    this.pickupMode,
    this.confirmPickup,
    this.status,
    this.orderType,
    this.totalAmount,
    this.orderVia,
    this.orderDate,
    this.deliveryDate,
    this.deliveryTime,
    this.paidStatus,
    this.discount,
    this.netTaxable,
    this.vat,
    this.grantTotal,
    this.staff,
    this.customer,
    this.invoice,
    this.customerAddress,
  });

  factory SerThankYouData.fromJson(Map<String, dynamic> json) => SerThankYouData(
    orderId: json["order_id"],
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: json["pickup_date"] == null ? null : DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    pickupMode: json["Pickup_mode"],
    confirmPickup: json["confirm_pickup"],
    status: json["status"],
    orderType: json["order_type"],
    totalAmount: json["total_amount"],
    orderVia: json["order_via"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    deliveryDate: json["Delivery_date"],
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    discount: json["discount"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    grantTotal: json["grant_total"],
    staff: json["staff"],
    customer: json["customer"],
    invoice: json["invoice"],
    customerAddress: json["customer_address"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "Pickup_mode": pickupMode,
    "confirm_pickup": confirmPickup,
    "status": status,
    "order_type": orderType,
    "total_amount": totalAmount,
    "order_via": orderVia,
    "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
    "Delivery_date": deliveryDate,
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "discount": discount,
    "net_taxable": netTaxable,
    "vat": vat,
    "grant_total": grantTotal,
    "staff": staff,
    "customer": customer,
    "invoice": invoice,
    "customer_address": customerAddress,
  };
}
