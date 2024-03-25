// To parse this JSON data, do
//
//     final personalSaveModel = personalSaveModelFromJson(jsonString);

import 'dart:convert';

PersonalSaveModel personalSaveModelFromJson(String str) => PersonalSaveModel.fromJson(json.decode(str));

String personalSaveModelToJson(PersonalSaveModel data) => json.encode(data.toJson());

class PersonalSaveModel {
  final bool? status;
  final PersonalSaveData? data;
  final String? message;

  PersonalSaveModel({
    this.status,
    this.data,
    this.message,
  });

  factory PersonalSaveModel.fromJson(Map<String, dynamic> json) => PersonalSaveModel(
    status: json["status"],
    data: json["data"] == null ? null : PersonalSaveData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class PersonalSaveData {
  final String? username;
  final String? name;
  final String? email;
  final String? password;
  final String? customerType;
  final String? buildingNo;
  final String? roomNo;
  final String? mobile;
  final String? altMobile;
  final String? whatsApp;
  final String? creditLimit;
  final String? creditDays;
  final String? creditInvoices;
  final String? gpse;
  final String? gpsn;
  final String? location;
  final String? trn;
  final String? billingAddrs;
  final String? designation;
  final String? buildingName;
  final String? floorNumber;
  final String? flatNumber;
  final String? userType;
  final String? firstName;
  final String? createdBy;
  final int? user;
  final String? status;

  PersonalSaveData({
    this.username,
    this.name,
    this.email,
    this.password,
    this.customerType,
    this.buildingNo,
    this.roomNo,
    this.mobile,
    this.altMobile,
    this.whatsApp,
    this.creditLimit,
    this.creditDays,
    this.creditInvoices,
    this.gpse,
    this.gpsn,
    this.location,
    this.trn,
    this.billingAddrs,
    this.designation,
    this.buildingName,
    this.floorNumber,
    this.flatNumber,
    this.userType,
    this.firstName,
    this.createdBy,
    this.user,
    this.status,
  });

  factory PersonalSaveData.fromJson(Map<String, dynamic> json) => PersonalSaveData(
    username: json["username"],
    name: json["name"],
    email: json["email"],
    password: json["password"],
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
    location: json["Location"],
    trn: json["TRN"],
    billingAddrs: json["billing_addrs"],
    designation: json["designation"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
    userType: json["user_type"],
    firstName: json["first_name"],
    createdBy: json["created_by"],
    user: json["user"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "name": name,
    "email": email,
    "password": password,
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
    "Location": location,
    "TRN": trn,
    "billing_addrs": billingAddrs,
    "designation": designation,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
    "user_type": userType,
    "first_name": firstName,
    "created_by": createdBy,
    "user": user,
    "status": status,
  };
}
