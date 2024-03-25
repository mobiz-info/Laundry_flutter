import 'dart:convert';
/// status : true
/// data : {"username":"linta123456","name":"linta123456","email":"new@gmail.com","password":"pbkdf2_sha256$320000$v3iR2KyNtroIdkckoaSDqD$++RRCPKa4MozWMSDFH/ebnpL/4MXAPd0MVmSgAHWygk=","customer_type":"Co-operate","building_no":"456","room_no":"r4","reg_email":" ","mobile":8989898989,"alt_mobile":4545454554,"whats_app":9853857945,"credit_limit":5,"credit_days":30,"credit_invoices":6,"GPSE":7,"GPSN":8,"Location":"3b6e3c66707640e087bb4e139ad0a715","company_name":"company_name","TRN":"TRN","billing_addrs":"billing_addrs","designation":"designation","building_name":"building_name","floor_number":"floor_number","flat_number":"flat_number","address_list":[{"emirate_id":"d6795abd31e141a78c03e0548b14b5e7","building_name":"skyline","floor_number":"34","flat_no":"16b","mobile":"4355226672","name":"","GPSE":"5","GPSN":"3"},{"emirate_id":"d6795abd31e141a78c03e0548b14b5e7","building_name":"skyline","floor_number":"23","flat_no":"16c","mobile":"4355226672","name":"","GPSE":"5","GPSN":"3"}],"user_type":"Customer","first_name":"linta123456","created_by":"linta123456","user":140,"status":"Active"}
/// message : "New Customer Added Successfully!"

CorporateSaveModel testFromJson(String str) => CorporateSaveModel.fromJson(json.decode(str));
String testToJson(CorporateSaveModel data) => json.encode(data.toJson());
class CorporateSaveModel {
  CorporateSaveModel({
    this.status,
    this.data,
    this.message,});

  CorporateSaveModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? CorporateSaveData.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  CorporateSaveData? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

/// username : "linta123456"
/// name : "linta123456"
/// email : "new@gmail.com"
/// password : "pbkdf2_sha256$320000$v3iR2KyNtroIdkckoaSDqD$++RRCPKa4MozWMSDFH/ebnpL/4MXAPd0MVmSgAHWygk="
/// customer_type : "Co-operate"
/// building_no : "456"
/// room_no : "r4"
/// reg_email : " "
/// mobile : 8989898989
/// alt_mobile : 4545454554
/// whats_app : 9853857945
/// credit_limit : 5
/// credit_days : 30
/// credit_invoices : 6
/// GPSE : 7
/// GPSN : 8
/// Location : "3b6e3c66707640e087bb4e139ad0a715"
/// company_name : "company_name"
/// TRN : "TRN"
/// billing_addrs : "billing_addrs"
/// designation : "designation"
/// building_name : "building_name"
/// floor_number : "floor_number"
/// flat_number : "flat_number"
/// address_list : [{"emirate_id":"d6795abd31e141a78c03e0548b14b5e7","building_name":"skyline","floor_number":"34","flat_no":"16b","mobile":"4355226672","name":"","GPSE":"5","GPSN":"3"},{"emirate_id":"d6795abd31e141a78c03e0548b14b5e7","building_name":"skyline","floor_number":"23","flat_no":"16c","mobile":"4355226672","name":"","GPSE":"5","GPSN":"3"}]
/// user_type : "Customer"
/// first_name : "linta123456"
/// created_by : "linta123456"
/// user : 140
/// status : "Active"

CorporateSaveData dataFromJson(String str) => CorporateSaveData.fromJson(json.decode(str));
String dataToJson(CorporateSaveData data) => json.encode(data.toJson());
class CorporateSaveData {
  CorporateSaveData({
    this.username,
    this.name,
    this.email,
    this.password,
    this.customerType,
    this.buildingNo,
    this.roomNo,
    this.regEmail,
    this.mobile,
    this.altMobile,
    this.whatsApp,
    this.creditLimit,
    this.creditDays,
    this.creditInvoices,
    this.gpse,
    this.gpsn,
    this.location,
    this.companyName,
    this.trn,
    this.billingAddrs,
    this.designation,
    this.buildingName,
    this.floorNumber,
    this.flatNumber,
    this.addressList,
    this.userType,
    this.firstName,
    this.createdBy,
    this.user,
    this.status,});

  CorporateSaveData.fromJson(dynamic json) {
    username = json['username'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    customerType = json['customer_type'];
    buildingNo = json['building_no'];
    roomNo = json['room_no'];
    regEmail = json['reg_email'];
    mobile = json['mobile'];
    altMobile = json['alt_mobile'];
    whatsApp = json['whats_app'];
    creditLimit = json['credit_limit'];
    creditDays = json['credit_days'];
    creditInvoices = json['credit_invoices'];
    gpse = json['GPSE'];
    gpsn = json['GPSN'];
    location = json['Location'];
    companyName = json['company_name'];
    trn = json['TRN'];
    billingAddrs = json['billing_addrs'];
    designation = json['designation'];
    buildingName = json['building_name'];
    floorNumber = json['floor_number'];
    flatNumber = json['flat_number'];
    if (json['address_list'] != null) {
      addressList = [];
      json['address_list'].forEach((v) {
        addressList?.add(AddressList.fromJson(v));
      });
    }
    userType = json['user_type'];
    firstName = json['first_name'];
    createdBy = json['created_by'];
    user = json['user'];
    status = json['status'];
  }
  String? username;
  String? name;
  String? email;
  String? password;
  String? customerType;
  String? buildingNo;
  String? roomNo;
  String? regEmail;
  int? mobile;
  int? altMobile;
  int? whatsApp;
  int? creditLimit;
  int? creditDays;
  int? creditInvoices;
  int? gpse;
  int? gpsn;
  String? location;
  String? companyName;
  String? trn;
  String? billingAddrs;
  String? designation;
  String? buildingName;
  String? floorNumber;
  String? flatNumber;
  List<AddressList>? addressList;
  String? userType;
  String? firstName;
  String? createdBy;
  int? user;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['username'] = username;
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['customer_type'] = customerType;
    map['building_no'] = buildingNo;
    map['room_no'] = roomNo;
    map['reg_email'] = regEmail;
    map['mobile'] = mobile;
    map['alt_mobile'] = altMobile;
    map['whats_app'] = whatsApp;
    map['credit_limit'] = creditLimit;
    map['credit_days'] = creditDays;
    map['credit_invoices'] = creditInvoices;
    map['GPSE'] = gpse;
    map['GPSN'] = gpsn;
    map['Location'] = location;
    map['company_name'] = companyName;
    map['TRN'] = trn;
    map['billing_addrs'] = billingAddrs;
    map['designation'] = designation;
    map['building_name'] = buildingName;
    map['floor_number'] = floorNumber;
    map['flat_number'] = flatNumber;
    if (addressList != null) {
      map['address_list'] = addressList?.map((v) => v.toJson()).toList();
    }
    map['user_type'] = userType;
    map['first_name'] = firstName;
    map['created_by'] = createdBy;
    map['user'] = user;
    map['status'] = status;
    return map;
  }

}

/// emirate_id : "d6795abd31e141a78c03e0548b14b5e7"
/// building_name : "skyline"
/// floor_number : "34"
/// flat_no : "16b"
/// mobile : "4355226672"
/// name : ""
/// GPSE : "5"
/// GPSN : "3"

AddressList addressListFromJson(String str) => AddressList.fromJson(json.decode(str));
String addressListToJson(AddressList data) => json.encode(data.toJson());
class AddressList {
  AddressList({
    this.emirateId,
    this.buildingName,
    this.floorNumber,
    this.flatNo,
    this.mobile,
    this.name,
    this.gpse,
    this.gpsn,});

  AddressList.fromJson(dynamic json) {
    emirateId = json['emirate_id'];
    buildingName = json['building_name'];
    floorNumber = json['floor_number'];
    flatNo = json['flat_no'];
    mobile = json['mobile'];
    name = json['name'];
    gpse = json['GPSE'];
    gpsn = json['GPSN'];
  }
  String? emirateId;
  String? buildingName;
  String? floorNumber;
  String? flatNo;
  String? mobile;
  String? name;
  String? gpse;
  String? gpsn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emirate_id'] = emirateId;
    map['building_name'] = buildingName;
    map['floor_number'] = floorNumber;
    map['flat_no'] = flatNo;
    map['mobile'] = mobile;
    map['name'] = name;
    map['GPSE'] = gpse;
    map['GPSN'] = gpsn;
    return map;
  }

}


// // To parse this JSON data, do
// //
// //     final corporateSaveModel = corporateSaveModelFromJson(jsonString);
//
// import 'dart:convert';
//
// CorporateSaveModel corporateSaveModelFromJson(String str) => CorporateSaveModel.fromJson(json.decode(str));
//
// String corporateSaveModelToJson(CorporateSaveModel data) => json.encode(data.toJson());
//
// class CorporateSaveModel {
//   final bool? status;
//   final CorporateSaveData? data;
//   final String? message;
//
//   CorporateSaveModel({
//     this.status,
//     this.data,
//     this.message,
//   });
//
//   factory CorporateSaveModel.fromJson(Map<String, dynamic> json) => CorporateSaveModel(
//     status: json["status"],
//     data: json["data"] == null ? null : CorporateSaveData.fromJson(json["data"]),
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
// class CorporateSaveData {
//   final String? username;
//   final String? name;
//   final String? email;
//   final String? password;
//   final String? customerType;
//   final String? buildingNo;
//   final String? roomNo;
//   final String? regEmail;
//   final int? mobile;
//   final int? altMobile;
//   final int? whatsApp;
//   final int? creditLimit;
//   final int? creditDays;
//   final int? creditInvoices;
//   final int? gpse;
//   final int? gpsn;
//   final String? location;
//   final String? companyName;
//   final String? trn;
//   final String? billingAddrs;
//   final String? designation;
//   final String? buildingName;
//   final String? floorNumber;
//   final String? flatNumber;
//   final List<AddressList>? addressList;
//   final String? userType;
//   final String? firstName;
//   final String? createdBy;
//   final int? user;
//   final String? status;
//
//   CorporateSaveData({
//     this.username,
//     this.name,
//     this.email,
//     this.password,
//     this.customerType,
//     this.buildingNo,
//     this.roomNo,
//     this.regEmail,
//     this.mobile,
//     this.altMobile,
//     this.whatsApp,
//     this.creditLimit,
//     this.creditDays,
//     this.creditInvoices,
//     this.gpse,
//     this.gpsn,
//     this.location,
//     this.companyName,
//     this.trn,
//     this.billingAddrs,
//     this.designation,
//     this.buildingName,
//     this.floorNumber,
//     this.flatNumber,
//     this.addressList,
//     this.userType,
//     this.firstName,
//     this.createdBy,
//     this.user,
//     this.status,
//   });
//
//   factory CorporateSaveData.fromJson(Map<String, dynamic> json) => CorporateSaveData(
//     username: json["username"],
//     name: json["name"],
//     email: json["email"],
//     password: json["password"],
//     customerType: json["customer_type"],
//     buildingNo: json["building_no"],
//     roomNo: json["room_no"],
//     regEmail: json["reg_email"],
//     mobile: json["mobile"],
//     altMobile: json["alt_mobile"],
//     whatsApp: json["whats_app"],
//     creditLimit: json["credit_limit"],
//     creditDays: json["credit_days"],
//     creditInvoices: json["credit_invoices"],
//     gpse: json["GPSE"],
//     gpsn: json["GPSN"],
//     location: json["Location"],
//     companyName: json["company_name"],
//     trn: json["TRN"],
//     billingAddrs: json["billing_addrs"],
//     designation: json["designation"],
//     buildingName: json["building_name"],
//     floorNumber: json["floor_number"],
//     flatNumber: json["flat_number"],
//     addressList: json["address_list"] == null ? [] : List<AddressList>.from(json["address_list"]!.map((x) => AddressList.fromJson(x))),
//     userType: json["user_type"],
//     firstName: json["first_name"],
//     createdBy: json["created_by"],
//     user: json["user"],
//     status: json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "username": username,
//     "name": name,
//     "email": email,
//     "password": password,
//     "customer_type": customerType,
//     "building_no": buildingNo,
//     "room_no": roomNo,
//     "reg_email": regEmail,
//     "mobile": mobile,
//     "alt_mobile": altMobile,
//     "whats_app": whatsApp,
//     "credit_limit": creditLimit,
//     "credit_days": creditDays,
//     "credit_invoices": creditInvoices,
//     "GPSE": gpse,
//     "GPSN": gpsn,
//     "Location": location,
//     "company_name": companyName,
//     "TRN": trn,
//     "billing_addrs": billingAddrs,
//     "designation": designation,
//     "building_name": buildingName,
//     "floor_number": floorNumber,
//     "flat_number": flatNumber,
//     "address_list": addressList == null ? [] : List<dynamic>.from(addressList!.map((x) => x.toJson())),
//     "user_type": userType,
//     "first_name": firstName,
//     "created_by": createdBy,
//     "user": user,
//     "status": status,
//   };
// }
//
// class AddressList {
//   final String? emirateId;
//   final String? buildingName;
//   final String? floorNumber;
//   final String? flatNo;
//   final String? mobile;
//   final String? name;
//   final String? gpse;
//   final String? gpsn;
//
//   AddressList({
//     this.emirateId,
//     this.buildingName,
//     this.floorNumber,
//     this.flatNo,
//     this.mobile,
//     this.name,
//     this.gpse,
//     this.gpsn,
//   });
//
//   factory AddressList.fromJson(Map<String, dynamic> json) => AddressList(
//     emirateId: json["emirate_id"],
//     buildingName: json["building_name"],
//     floorNumber: json["floor_number"],
//     flatNo: json["flat_no"],
//     mobile: json["mobile"],
//     name: json["name"],
//     gpse: json["GPSE"],
//     gpsn: json["GPSN"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "emirate_id": emirateId,
//     "building_name": buildingName,
//     "floor_number": floorNumber,
//     "flat_no": flatNo,
//     "mobile": mobile,
//     "name": name,
//     "GPSE": gpse,
//     "GPSN": gpsn,
//   };
// }
