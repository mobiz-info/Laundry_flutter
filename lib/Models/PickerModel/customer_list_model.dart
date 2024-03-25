import 'dart:convert';

class PickerCustomerListModel {
  bool status;
  List<CustomerListData> data;
  String message;

  PickerCustomerListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerCustomerListModel copyWith({
    bool? status,
    List<CustomerListData>? data,
    String? message,
  }) =>
      PickerCustomerListModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerCustomerListModel.fromRawJson(String str) => PickerCustomerListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerCustomerListModel.fromJson(Map<String, dynamic> json) => PickerCustomerListModel(
    status: json["status"],
    data: List<CustomerListData>.from(json["data"].map((x) => CustomerListData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class CustomerListData {
  String customerId;
  User user;
  String createdBy;
  DateTime createdDate;
  String name;
  String customerType;
  String buildingNo;
  String roomNo;
  String mobile;
  String? altMobile;
  String? whatsApp;
  dynamic creditLimit;
  dynamic creditDays;
  dynamic creditInvoices;
  dynamic gpse;
  dynamic gpsn;
  String status;
  String staff;
  String location;
  String pricegroup;

  CustomerListData({
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

  CustomerListData copyWith({
    String? customerId,
    User? user,
    String? createdBy,
    DateTime? createdDate,
    String? name,
    String? customerType,
    String? buildingNo,
    String? roomNo,
    String? mobile,
    String? altMobile,
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
      CustomerListData(
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

  factory CustomerListData.fromRawJson(String str) => CustomerListData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerListData.fromJson(Map<String, dynamic> json) => CustomerListData(
    customerId: json["customer_id"],
    user: User.fromJson(json["user"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    name: json["name"],
    customerType: json["customer_type"] ?? "",
    buildingNo: json["building_no"] ?? "",
    roomNo: json["room_no"] ?? "",
    mobile: json["mobile"] ?? "",
    altMobile: json["alt_mobile"] ?? "",
    whatsApp: json["whats_app"] ?? "",
    creditLimit: json["credit_limit"] ?? "",
    creditDays: json["credit_days"] ?? "",
    creditInvoices: json["credit_invoices"] ?? "",
    gpse: json["GPSE"] ?? "",
    gpsn: json["GPSN"] ?? "",
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
