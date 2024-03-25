// To parse this JSON data, do
//
//     final editProfileGetModel = editProfileGetModelFromJson(jsonString);

import 'dart:convert';

EditProfileGetModel editProfileGetModelFromJson(String str) => EditProfileGetModel.fromJson(json.decode(str));

String editProfileGetModelToJson(EditProfileGetModel data) => json.encode(data.toJson());

class EditProfileGetModel {
  final bool? status;
  final EditProfileGetData? data;
  final String? message;

  EditProfileGetModel({
    this.status,
    this.data,
    this.message,
  });

  factory EditProfileGetModel.fromJson(Map<String, dynamic> json) => EditProfileGetModel(
    status: json["status"],
    data: json["data"] == null ? null : EditProfileGetData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class EditProfileGetData {
  final String? customerId;
  final Location? location;
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
  final String? gpse;
  final String? gpsn;
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
  final String? pricegroup;

  EditProfileGetData({
    this.customerId,
    this.location,
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
    this.pricegroup,
  });

  factory EditProfileGetData.fromJson(Map<String, dynamic> json) => EditProfileGetData(
    customerId: json["customer_id"],
    location: json["Location"] == null ? null : Location.fromJson(json["Location"]),
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
    pricegroup: json["Pricegroup"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "Location": location?.toJson(),
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
    "Pricegroup": pricegroup,
  };
}

class Location {
  final String? locationId;
  final String? name;
  final String? areaName;
  final String? emirateName;
  final String? areaId;
  final String? emirateId;

  Location({
    this.locationId,
    this.name,
    this.areaName,
    this.emirateName,
    this.areaId,
    this.emirateId,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    locationId: json["location_id"],
    name: json["name"],
    areaName: json["area_name"],
    emirateName: json["emirate_name"],
    areaId: json["area_id"],
    emirateId: json["emirate_id"],
  );

  Map<String, dynamic> toJson() => {
    "location_id": locationId,
    "name": name,
    "area_name": areaName,
    "emirate_name": emirateName,
    "area_id": areaId,
    "emirate_id": emirateId,
  };
}


// // To parse this JSON data, do
// //
// //     final editProfileGetModel = editProfileGetModelFromJson(jsonString);
//
// import 'dart:convert';
//
// EditProfileGetModel editProfileGetModelFromJson(String str) => EditProfileGetModel.fromJson(json.decode(str));
//
// String editProfileGetModelToJson(EditProfileGetModel data) => json.encode(data.toJson());
//
// class EditProfileGetModel {
//   final bool? status;
//   final EditProfileGetData? data;
//   final String? message;
//
//   EditProfileGetModel({
//     this.status,
//     this.data,
//     this.message,
//   });
//
//   factory EditProfileGetModel.fromJson(Map<String, dynamic> json) => EditProfileGetModel(
//     status: json["status"],
//     data: json["data"] == null ? null : EditProfileGetData.fromJson(json["data"]),
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
// class EditProfileGetData {
//   final String? customerId;
//   final Location? location;
//   final String? createdBy;
//   final DateTime? createdDate;
//   final String? name;
//   final String? customerType;
//   final String? buildingNo;
//   final String? roomNo;
//   final String? mobile;
//   final dynamic altMobile;
//   final String? whatsApp;
//   final dynamic creditLimit;
//   final dynamic creditDays;
//   final dynamic creditInvoices;
//   final dynamic gpse;
//   final dynamic gpsn;
//   final String? status;
//   final dynamic trn;
//   final dynamic billingAddrs;
//   final dynamic designation;
//   final String? buildingName;
//   final String? floorNumber;
//   final String? flatNumber;
//   final dynamic altEmail;
//   final dynamic companyName;
//   final int? user;
//   final String? staff;
//   final String? pricegroup;
//
//   EditProfileGetData({
//     this.customerId,
//     this.location,
//     this.createdBy,
//     this.createdDate,
//     this.name,
//     this.customerType,
//     this.buildingNo,
//     this.roomNo,
//     this.mobile,
//     this.altMobile,
//     this.whatsApp,
//     this.creditLimit,
//     this.creditDays,
//     this.creditInvoices,
//     this.gpse,
//     this.gpsn,
//     this.status,
//     this.trn,
//     this.billingAddrs,
//     this.designation,
//     this.buildingName,
//     this.floorNumber,
//     this.flatNumber,
//     this.altEmail,
//     this.companyName,
//     this.user,
//     this.staff,
//     this.pricegroup,
//   });
//
//   factory EditProfileGetData.fromJson(Map<String, dynamic> json) => EditProfileGetData(
//     customerId: json["customer_id"],
//     location: json["Location"] == null ? null : Location.fromJson(json["Location"]),
//     createdBy: json["created_by"],
//     createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
//     name: json["name"],
//     customerType: json["customer_type"],
//     buildingNo: json["building_no"],
//     roomNo: json["room_no"],
//     mobile: json["mobile"],
//     altMobile: json["alt_mobile"],
//     whatsApp: json["whats_app"],
//     creditLimit: json["credit_limit"],
//     creditDays: json["credit_days"],
//     creditInvoices: json["credit_invoices"],
//     gpse: json["GPSE"],
//     gpsn: json["GPSN"],
//     status: json["status"],
//     trn: json["TRN"],
//     billingAddrs: json["billing_addrs"],
//     designation: json["designation"],
//     buildingName: json["building_name"],
//     floorNumber: json["floor_number"],
//     flatNumber: json["flat_number"],
//     altEmail: json["alt_email"],
//     companyName: json["company_name"],
//     user: json["user"],
//     staff: json["staff"],
//     pricegroup: json["Pricegroup"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "customer_id": customerId,
//     "Location": location?.toJson(),
//     "created_by": createdBy,
//     "created_date": createdDate?.toIso8601String(),
//     "name": name,
//     "customer_type": customerType,
//     "building_no": buildingNo,
//     "room_no": roomNo,
//     "mobile": mobile,
//     "alt_mobile": altMobile,
//     "whats_app": whatsApp,
//     "credit_limit": creditLimit,
//     "credit_days": creditDays,
//     "credit_invoices": creditInvoices,
//     "GPSE": gpse,
//     "GPSN": gpsn,
//     "status": status,
//     "TRN": trn,
//     "billing_addrs": billingAddrs,
//     "designation": designation,
//     "building_name": buildingName,
//     "floor_number": floorNumber,
//     "flat_number": flatNumber,
//     "alt_email": altEmail,
//     "company_name": companyName,
//     "user": user,
//     "staff": staff,
//     "Pricegroup": pricegroup,
//   };
// }
//
// class Location {
//   final String? locationId;
//   final String? name;
//   final String? areaName;
//   final String? emirateName;
//
//   Location({
//     this.locationId,
//     this.name,
//     this.areaName,
//     this.emirateName,
//   });
//
//   factory Location.fromJson(Map<String, dynamic> json) => Location(
//     locationId: json["location_id"],
//     name: json["name"],
//     areaName: json["area_name"],
//     emirateName: json["emirate_name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "location_id": locationId,
//     "name": name,
//     "area_name": areaName,
//     "emirate_name": emirateName,
//   };
// }
