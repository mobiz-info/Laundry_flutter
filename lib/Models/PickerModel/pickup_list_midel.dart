import 'dart:convert';

class PickerPickupListModel {
  bool status;
  List<PckPickupList> data;
  String message;

  PickerPickupListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerPickupListModel copyWith({
    bool? status,
    List<PckPickupList>? data,
    String? message,
  }) =>
      PickerPickupListModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerPickupListModel.fromRawJson(String str) => PickerPickupListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerPickupListModel.fromJson(Map<String, dynamic> json) => PickerPickupListModel(
    status: json["status"],
    data: List<PckPickupList>.from(json["data"].map((x) => PckPickupList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PckPickupList {
  String orderId;
  String orderNumber;
  DateTime pickupDate;
  String pickupTime;
  String orderType;
  DateTime orderDate;
  Customer customer;

  PckPickupList({
    required this.orderId,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.orderType,
    required this.orderDate,
    required this.customer,
  });

  PckPickupList copyWith({
    String? orderId,
    String? orderNumber,
    DateTime? pickupDate,
    String? pickupTime,
    String? orderType,
    DateTime? orderDate,
    Customer? customer,
  }) =>
      PckPickupList(
        orderId: orderId ?? this.orderId,
        orderNumber: orderNumber ?? this.orderNumber,
        pickupDate: pickupDate ?? this.pickupDate,
        pickupTime: pickupTime ?? this.pickupTime,
        orderType: orderType ?? this.orderType,
        orderDate: orderDate ?? this.orderDate,
        customer: customer ?? this.customer,
      );

  factory PckPickupList.fromRawJson(String str) => PckPickupList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PckPickupList.fromJson(Map<String, dynamic> json) => PckPickupList(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    orderType: json["order_type"],
    orderDate: DateTime.parse(json["order_date"]),
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "order_type": orderType,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "customer": customer.toJson(),
  };
}

class Customer {
  String customerId;
  User user;
  String createdBy;
  DateTime createdDate;
  String name;
  String customerType;
  String buildingNo;
  String roomNo;
  String mobile;
  dynamic altMobile;
  String whatsApp;
  dynamic creditLimit;
  dynamic creditDays;
  dynamic creditInvoices;
  dynamic gpse;
  dynamic gpsn;
  String status;
  String staff;
  String location;
  String pricegroup;

  Customer({
    required this.customerId,
    required this.user,
    required this.createdBy,
    required this.createdDate,
    required this.name,
    required this.customerType,
    required this.buildingNo,
    required this.roomNo,
    required this.mobile,
    required this.altMobile,
    required this.whatsApp,
    required this.creditLimit,
    required this.creditDays,
    required this.creditInvoices,
    required this.gpse,
    required this.gpsn,
    required this.status,
    required this.staff,
    required this.location,
    required this.pricegroup,
  });

  Customer copyWith({
    String? customerId,
    User? user,
    String? createdBy,
    DateTime? createdDate,
    String? name,
    String? customerType,
    String? buildingNo,
    String? roomNo,
    String? mobile,
    dynamic altMobile,
    String? whatsApp,
    dynamic creditLimit,
    dynamic creditDays,
    dynamic creditInvoices,
    dynamic gpse,
    dynamic gpsn,
    String? status,
    String? staff,
    String? location,
    String? pricegroup,
  }) =>
      Customer(
        customerId: customerId ?? this.customerId,
        user: user ?? this.user,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        name: name ?? this.name,
        customerType: customerType ?? this.customerType,
        buildingNo: buildingNo ?? this.buildingNo,
        roomNo: roomNo ?? this.roomNo,
        mobile: mobile ?? this.mobile,
        altMobile: altMobile ?? this.altMobile,
        whatsApp: whatsApp ?? this.whatsApp,
        creditLimit: creditLimit ?? this.creditLimit,
        creditDays: creditDays ?? this.creditDays,
        creditInvoices: creditInvoices ?? this.creditInvoices,
        gpse: gpse ?? this.gpse,
        gpsn: gpsn ?? this.gpsn,
        status: status ?? this.status,
        staff: staff ?? this.staff,
        location: location ?? this.location,
        pricegroup: pricegroup ?? this.pricegroup,
      );

  factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    user: User.fromJson(json["user"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    name: json["name"],
    customerType: json["customer_type"],
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    mobile: json["mobile"],
    altMobile: json["alt_mobile"],
    whatsApp: json["whats_app"],
    creditLimit: json["credit_limit"],
    creditDays: json["credit_days"],
    creditInvoices: json["credit_invoices"],
    gpse: json["GPSE"],
    gpsn: json["GPSN"],
    status: json["status"],
    staff: json["staff"],
    location: json["Location"],
    pricegroup: json["Pricegroup"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "user": user.toJson(),
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "name": name,
    "customer_type": customerType,
    "building_no": buildingNo,
    "room_no": roomNo,
    "mobile": mobile,
    "alt_mobile": altMobile,
    "whats_app": whatsApp,
    "credit_limit": creditLimit,
    "credit_days": creditDays,
    "credit_invoices": creditInvoices,
    "GPSE": gpse,
    "GPSN": gpsn,
    "status": status,
    "staff": staff,
    "Location": location,
    "Pricegroup": pricegroup,
  };
}

class User {
  String username;
  String email;

  User({
    required this.username,
    required this.email,
  });

  User copyWith({
    String? username,
    String? email,
  }) =>
      User(
        username: username ?? this.username,
        email: email ?? this.email,
      );

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
  };
}
