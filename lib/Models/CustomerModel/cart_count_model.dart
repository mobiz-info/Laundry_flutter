// To parse this JSON data, do
//
//     final cartCountModel = cartCountModelFromJson(jsonString);

import 'dart:convert';

CartCountModel cartCountModelFromJson(String str) => CartCountModel.fromJson(json.decode(str));

String cartCountModelToJson(CartCountModel data) => json.encode(data.toJson());

class CartCountModel {
  final bool? status;
  final CartCountData? data;
  final String? message;

  CartCountModel({
    this.status,
    this.data,
    this.message,
  });

  factory CartCountModel.fromJson(Map<String, dynamic> json) => CartCountModel(
    status: json["status"],
    data: json["data"] == null ? null : CartCountData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class CartCountData {
  final Order? order;
  final int? cartCount;

  CartCountData({
    this.order,
    this.cartCount,
  });

  factory CartCountData.fromJson(Map<String, dynamic> json) => CartCountData(
    order: json["order"] == null ? null : Order.fromJson(json["order"]),
    cartCount: json["cart_count"],
  );

  Map<String, dynamic> toJson() => {
    "order": order?.toJson(),
    "cart_count": cartCount,
  };
}

class Order {
  final String? orderId;
  final Customer? customer;
  final dynamic staff;
  final String? createdBy;
  final DateTime? createdDate;
  final String? orderNumber;
  final dynamic pickupDate;
  final dynamic pickupTime;
  final String? pickupMode;
  final bool? confirmPickup;
  final String? status;
  final String? orderType;
  final String? totalAmount;
  final String? orderVia;
  final DateTime? orderDate;
  final DateTime? deliveryDate;
  final String? deliveryTime;
  final bool? paidStatus;
  final dynamic discount;
  final dynamic netTaxable;
  final dynamic vat;
  final dynamic grantTotal;
  final dynamic invoice;

  Order({
    this.orderId,
    this.customer,
    this.staff,
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
    this.invoice,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    staff: json["staff"],
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
    deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    discount: json["discount"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    grantTotal: json["grant_total"],
    invoice: json["invoice"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "customer": customer?.toJson(),
    "staff": staff,
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
    "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "discount": discount,
    "net_taxable": netTaxable,
    "vat": vat,
    "grant_total": grantTotal,
    "invoice": invoice,
  };
}

class Customer {
  final String? customerId;
  final String? name;
  final String? mobile;

  Customer({
    this.customerId,
    this.name,
    this.mobile,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    name: json["name"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "name": name,
    "mobile": mobile,
  };
}
