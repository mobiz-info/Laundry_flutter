// To parse this JSON data, do
//
//     final newOrderContactlessModel = newOrderContactlessModelFromJson(jsonString);

import 'dart:convert';

NewOrderContactlessModel newOrderContactlessModelFromJson(String str) => NewOrderContactlessModel.fromJson(json.decode(str));

String newOrderContactlessModelToJson(NewOrderContactlessModel data) => json.encode(data.toJson());

class NewOrderContactlessModel {
  final bool? status;
  final List<ContactlessOrderData>? data;
  final String? message;

  NewOrderContactlessModel({
    this.status,
    this.data,
    this.message,
  });

  factory NewOrderContactlessModel.fromJson(Map<String, dynamic> json) => NewOrderContactlessModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ContactlessOrderData>.from(json["data"]!.map((x) => ContactlessOrderData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class ContactlessOrderData {
  final OrderDetails? orderDetails;
  final StaffList? staffList;

  ContactlessOrderData({
    this.orderDetails,
    this.staffList,
  });

  factory ContactlessOrderData.fromJson(Map<String, dynamic> json) => ContactlessOrderData(
    orderDetails: json["order_details"] == null ? null : OrderDetails.fromJson(json["order_details"]),
    staffList: json["staff_list"] == null ? null : StaffList.fromJson(json["staff_list"]),
  );

  Map<String, dynamic> toJson() => {
    "order_details": orderDetails?.toJson(),
    "staff_list": staffList?.toJson(),
  };
}

class OrderDetails {
  final String? orderId;
  final String? createdBy;
  final DateTime? createdDate;
  final String? orderNumber;
  final String? pickupDate;
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
  final dynamic customerAddress;

  OrderDetails({
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

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
    orderId: json["order_id"],
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: json["pickup_date"],
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
    "pickup_date": pickupDate,
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

class StaffList {
  final String? staffId;
  final String? name;
  final String? curMobile;

  StaffList({
    this.staffId,
    this.name,
    this.curMobile,
  });

  factory StaffList.fromJson(Map<String, dynamic> json) => StaffList(
    staffId: json["staff_id"],
    name: json["name"],
    curMobile: json["cur_mobile"],
  );

  Map<String, dynamic> toJson() => {
    "staff_id": staffId,
    "name": name,
    "cur_mobile": curMobile,
  };
}

