import 'dart:convert';

ReadyDeliverySearchModel readyDeliverySearchModelFromJson(String str) => ReadyDeliverySearchModel.fromJson(json.decode(str));

String readyDeliverySearchModelToJson(ReadyDeliverySearchModel data) => json.encode(data.toJson());

class ReadyDeliverySearchModel {
  final bool? status;
  final DeliverySearchData? data;
  final String? message;

  ReadyDeliverySearchModel({
    this.status,
    this.data,
    this.message,
  });

  factory ReadyDeliverySearchModel.fromJson(Map<String, dynamic> json) => ReadyDeliverySearchModel(
    status: json["status"],
    data: json["data"] == null ? null : DeliverySearchData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class DeliverySearchData {
  final List<ReadyForDelivery>? readyForDelivery;
  final int? readyForDeliveryCount;

  DeliverySearchData({
    this.readyForDelivery,
    this.readyForDeliveryCount,
  });

  factory DeliverySearchData.fromJson(Map<String, dynamic> json) => DeliverySearchData(
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
  final String? invoiceNumber;
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

