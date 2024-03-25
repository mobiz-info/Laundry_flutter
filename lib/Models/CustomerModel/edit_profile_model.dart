// To parse this JSON data, do
//
//     final editProfileModel = editProfileModelFromJson(jsonString);

import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  final bool? status;
  final List<EditProfileData>? data;
  final String? message;

  EditProfileModel({
    this.status,
    this.data,
    this.message,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<EditProfileData>.from(json["data"]!.map((x) => EditProfileData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class EditProfileData {
  final User? user;
  final Customer? customer;

  EditProfileData({
    this.user,
    this.customer,
  });

  factory EditProfileData.fromJson(Map<String, dynamic> json) => EditProfileData(
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "customer": customer?.toJson(),
  };
}

class Customer {
  final String? customerId;
  final String? createdBy;
  final DateTime? createdDate;
  final String? name;
  final String? customerType;
  final String? buildingNo;
  final String? roomNo;
  final String? mobile;
  final dynamic altMobile;
  final String? whatsApp;
  final dynamic creditLimit;
  final dynamic creditDays;
  final dynamic creditInvoices;
  final dynamic gpse;
  final dynamic gpsn;
  final String? status;
  final dynamic trn;
  final dynamic billingAddrs;
  final dynamic designation;
  final String? buildingName;
  final String? floorNumber;
  final String? flatNumber;
  final String? altEmail;
  final dynamic companyName;
  final int? user;
  final String? staff;
  final String? location;
  final String? pricegroup;

  Customer({
    this.customerId,
    this.createdBy,
    this.createdDate,
    this.name,
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
    this.status,
    this.trn,
    this.billingAddrs,
    this.designation,
    this.buildingName,
    this.floorNumber,
    this.flatNumber,
    this.altEmail,
    this.companyName,
    this.user,
    this.staff,
    this.location,
    this.pricegroup,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    customerId: json["customer_id"],
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
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
    trn: json["TRN"],
    billingAddrs: json["billing_addrs"],
    designation: json["designation"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
    altEmail: json["alt_email"],
    companyName: json["company_name"],
    user: json["user"],
    staff: json["staff"],
    location: json["Location"],
    pricegroup: json["Pricegroup"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
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
    "TRN": trn,
    "billing_addrs": billingAddrs,
    "designation": designation,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
    "alt_email": altEmail,
    "company_name": companyName,
    "user": user,
    "staff": staff,
    "Location": location,
    "Pricegroup": pricegroup,
  };
}

class User {
  final String? firstName;
  final String? lastName;
  final String? email;

  User({
    this.firstName,
    this.lastName,
    this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    firstName: json["first_name"],
    lastName: json["last_name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "first_name": firstName,
    "last_name": lastName,
    "email": email,
  };
}
