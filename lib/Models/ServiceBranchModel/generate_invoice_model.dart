// // To parse this JSON data, do
// //
// //     final generateInvoiceModel = generateInvoiceModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GenerateInvoiceModel generateInvoiceModelFromJson(String str) => GenerateInvoiceModel.fromJson(json.decode(str));
//
// String generateInvoiceModelToJson(GenerateInvoiceModel data) => json.encode(data.toJson());
//
// class GenerateInvoiceModel {
//   final bool? status;
//   final GenerateInvoiceData? data;
//   final String? message;
//
//   GenerateInvoiceModel({
//     this.status,
//     this.data,
//     this.message,
//   });
//
//   factory GenerateInvoiceModel.fromJson(Map<String, dynamic> json) => GenerateInvoiceModel(
//     status: json["status"],
//     data: json["data"] == null ? null : GenerateInvoiceData.fromJson(json["data"]),
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": data?.toJson(),
//     "message": message,
//   };
// }
//
// class GenerateInvoiceData {
//   final List<Order>? orders;
//   final int? ordersCount;
//
//   GenerateInvoiceData({
//     this.orders,
//     this.ordersCount,
//   });
//
//   factory GenerateInvoiceData.fromJson(Map<String, dynamic> json) => GenerateInvoiceData(
//     orders: json["orders"] == null ? [] : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
//     ordersCount: json["orders_count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toJson())),
//     "orders_count": ordersCount,
//   };
// }
//
// class Order {
//   final String? orderId;
//   final String? orderNumber;
//   final String? pickupMode;
//   final String? orderType;
//   final String? totalAmount;
//   final DateTime? deliveryDate;
//   final String? status;
//   final int? quantity;
//   final String? staffName;
//
//   Order({
//     this.orderId,
//     this.orderNumber,
//     this.pickupMode,
//     this.orderType,
//     this.totalAmount,
//     this.deliveryDate,
//     this.status,
//     this.quantity,
//     this.staffName,
//   });
//
//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//     orderId: json["order_id"],
//     orderNumber: json["order_number"],
//     pickupMode: json["Pickup_mode"],
//     orderType: json["order_type"],
//     totalAmount: json["total_amount"],
//     deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
//     status: json["status"],
//     quantity: json["quantity"],
//     staffName: json["staff_name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "order_id": orderId,
//     "order_number": orderNumber,
//     "Pickup_mode": pickupMode,
//     "order_type": orderType,
//     "total_amount": totalAmount,
//     "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
//     "status": status,
//     "quantity": quantity,
//     "staff_name": staffName,
//   };
// }

// To parse this JSON data, do
//
//     final generateInvoiceModel = generateInvoiceModelFromJson(jsonString);

import 'dart:convert';

GenerateInvoiceModel generateInvoiceModelFromJson(String str) => GenerateInvoiceModel.fromJson(json.decode(str));

String generateInvoiceModelToJson(GenerateInvoiceModel data) => json.encode(data.toJson());

class GenerateInvoiceModel {
  final bool? status;
  final GenerateInvoiceData? data;
  final String? message;

  GenerateInvoiceModel({
    this.status,
    this.data,
    this.message,
  });

  factory GenerateInvoiceModel.fromJson(Map<String, dynamic> json) => GenerateInvoiceModel(
    status: json["status"],
    data: json["data"] == null ? null : GenerateInvoiceData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class GenerateInvoiceData {
  final List<Order>? orders;
  final int? ordersCount;

  GenerateInvoiceData({
    this.orders,
    this.ordersCount,
  });

  factory GenerateInvoiceData.fromJson(Map<String, dynamic> json) => GenerateInvoiceData(
    orders: json["orders"] == null ? [] : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
    ordersCount: json["orders_count"],
  );

  Map<String, dynamic> toJson() => {
    "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toJson())),
    "orders_count": ordersCount,
  };
}

class Order {
  final String? orderId;
  final String? orderNumber;
  final String? pickupMode;
  final String? orderType;
  final String? totalAmount;
  final String? deliveryDate;
  final String? status;
  final int? quantity;
  final String? staffName;

  Order({
    this.orderId,
    this.orderNumber,
    this.pickupMode,
    this.orderType,
    this.totalAmount,
    this.deliveryDate,
    this.status,
    this.quantity,
    this.staffName,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    pickupMode: json["Pickup_mode"],
    orderType: json["order_type"],
    totalAmount: json["total_amount"],
    deliveryDate: json["Delivery_date"],
    status: json["status"],
    quantity: json["quantity"],
    staffName: json["staff_name"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "Pickup_mode": pickupMode,
    "order_type": orderType,
    "total_amount": totalAmount,
    "Delivery_date": deliveryDate,
    "status": status,
    "quantity": quantity,
    "staff_name": staffName,
  };
}

