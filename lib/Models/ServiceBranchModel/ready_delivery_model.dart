import 'dart:convert';

ReadyDeliveryModel readyDeliveryModelFromJson(String str) => ReadyDeliveryModel.fromJson(json.decode(str));

String readyDeliveryModelToJson(ReadyDeliveryModel data) => json.encode(data.toJson());

class ReadyDeliveryModel {
  final bool? status;
  final ReadyDeliveryData? data;
  final String? message;

  ReadyDeliveryModel({
    this.status,
    this.data,
    this.message,
  });

  factory ReadyDeliveryModel.fromJson(Map<String, dynamic> json) => ReadyDeliveryModel(
    status: json["status"],
    data: json["data"] == null ? null : ReadyDeliveryData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class ReadyDeliveryData {
  final List<ReadyForDelivery>? readyForDelivery;
  final int? readyForDeliveryCount;

  ReadyDeliveryData({
    this.readyForDelivery,
    this.readyForDeliveryCount,
  });

  factory ReadyDeliveryData.fromJson(Map<String, dynamic> json) => ReadyDeliveryData(
    readyForDelivery: json["ready_for_delivery"] == null ? [] : List<ReadyForDelivery>.from(json["ready_for_delivery"]!.map((x) => ReadyForDelivery.fromJson(x))),
    readyForDeliveryCount: json["ready_for_delivery_count"],
  );

  Map<String, dynamic> toJson() => {
    "ready_for_delivery": readyForDelivery == null ? [] : List<dynamic>.from(readyForDelivery!.map((x) => x.toJson())),
    "ready_for_delivery_count": readyForDeliveryCount,
  };
}

class ReadyForDelivery {
  final String? orderId;
  final String? orderNumber;
  final String? orderType;
  final String? staffname;
  final String? pickupMode;
  final int? noOfItems;
  final String? clientName;
  final dynamic invoiceNumber;
  final String? totalAmount;

  ReadyForDelivery({
    this.orderId,
    this.orderNumber,
    this.orderType,
    this.staffname,
    this.pickupMode,
    this.noOfItems,
    this.clientName,
    this.invoiceNumber,
    this.totalAmount,
  });

  factory ReadyForDelivery.fromJson(Map<String, dynamic> json) => ReadyForDelivery(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    orderType: json["order_type"],
    staffname: json["staffname"],
    pickupMode: json["Pickup_mode"],
    noOfItems: json["no_of_items"],
    clientName: json["client_name"],
    invoiceNumber: json["invoice_number"],
    totalAmount: json["total_amount"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "order_type": orderType,
    "staffname": staffname,
    "Pickup_mode": pickupMode,
    "no_of_items": noOfItems,
    "client_name": clientName,
    "invoice_number": invoiceNumber,
    "total_amount": totalAmount,
  };
}

