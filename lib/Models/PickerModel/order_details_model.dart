import 'dart:convert';

class PickerOrderDetailsModel {
  bool status;
  Data data;
  String message;

  PickerOrderDetailsModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerOrderDetailsModel copyWith({
    bool? status,
    Data? data,
    String? message,
  }) =>
      PickerOrderDetailsModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerOrderDetailsModel.fromRawJson(String str) => PickerOrderDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerOrderDetailsModel.fromJson(Map<String, dynamic> json) => PickerOrderDetailsModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  String orderId;
  Customer customer;
  dynamic createdBy;
  DateTime createdDate;
  String orderNumber;
  DateTime pickupDate;
  String pickupTime;
  String pickupMode;
  bool confirmPickup;
  String orderType;
  String status;
  dynamic totalAmount;
  String orderVia;
  DateTime orderDate;
  bool advance;
  dynamic deliveryDate;
  dynamic deliveryTime;
  bool paidStatus;
  String staff;
  dynamic invoice;

  Data({
    required this.orderId,
    required this.customer,
    required this.createdBy,
    required this.createdDate,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.pickupMode,
    required this.confirmPickup,
    required this.orderType,
    required this.status,
    required this.totalAmount,
    required this.orderVia,
    required this.orderDate,
    required this.advance,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.paidStatus,
    required this.staff,
    required this.invoice,
  });

  Data copyWith({
    String? orderId,
    Customer? customer,
    dynamic createdBy,
    DateTime? createdDate,
    String? orderNumber,
    DateTime? pickupDate,
    String? pickupTime,
    String? pickupMode,
    bool? confirmPickup,
    String? orderType,
    String? status,
    dynamic totalAmount,
    String? orderVia,
    DateTime? orderDate,
    bool? advance,
    dynamic deliveryDate,
    dynamic deliveryTime,
    bool? paidStatus,
    String? staff,
    dynamic invoice,
  }) =>
      Data(
        orderId: orderId ?? this.orderId,
        customer: customer ?? this.customer,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        orderNumber: orderNumber ?? this.orderNumber,
        pickupDate: pickupDate ?? this.pickupDate,
        pickupTime: pickupTime ?? this.pickupTime,
        pickupMode: pickupMode ?? this.pickupMode,
        confirmPickup: confirmPickup ?? this.confirmPickup,
        orderType: orderType ?? this.orderType,
        status: status ?? this.status,
        totalAmount: totalAmount ?? this.totalAmount,
        orderVia: orderVia ?? this.orderVia,
        orderDate: orderDate ?? this.orderDate,
        advance: advance ?? this.advance,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        paidStatus: paidStatus ?? this.paidStatus,
        staff: staff ?? this.staff,
        invoice: invoice ?? this.invoice,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json["order_id"],
    customer: Customer.fromJson(json["customer"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    pickupMode: json["Pickup_mode"],
    confirmPickup: json["confirm_pickup"],
    orderType: json["order_type"],
    status: json["status"],
    totalAmount: json["total_amount"],
    orderVia: json["order_via"],
    orderDate: DateTime.parse(json["order_date"]),
    advance: json["advance"],
    deliveryDate: json["Delivery_date"],
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    staff: json["staff"],
    invoice: json["invoice"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "customer": customer.toJson(),
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "Pickup_mode": pickupMode,
    "confirm_pickup": confirmPickup,
    "order_type": orderType,
    "status": status,
    "total_amount": totalAmount,
    "order_via": orderVia,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "advance": advance,
    "Delivery_date": deliveryDate,
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "staff": staff,
    "invoice": invoice,
  };
}

class Customer {
  String name;
  String buildingNo;
  Location location;

  Customer({
    required this.name,
    required this.buildingNo,
    required this.location,
  });

  Customer copyWith({
    String? name,
    String? buildingNo,
    Location? location,
  }) =>
      Customer(
        name: name ?? this.name,
        buildingNo: buildingNo ?? this.buildingNo,
        location: location ?? this.location,
      );

  factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    name: json["name"],
    buildingNo: json["building_no"],
    location: Location.fromJson(json["Location"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "building_no": buildingNo,
    "Location": location.toJson(),
  };
}

class Location {
  String name;

  Location({
    required this.name,
  });

  Location copyWith({
    String? name,
  }) =>
      Location(
        name: name ?? this.name,
      );

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
