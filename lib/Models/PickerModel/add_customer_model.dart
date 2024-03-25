import 'dart:convert';

class AddCustomerModel {
  bool status;
  Data data;
  String message;

  AddCustomerModel({
    required this.status,
    required this.data,
    required this.message,
  });

  AddCustomerModel copyWith({
    bool? status,
    Data? data,
    String? message,
  }) =>
      AddCustomerModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory AddCustomerModel.fromRawJson(String str) => AddCustomerModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddCustomerModel.fromJson(Map<String, dynamic> json) => AddCustomerModel(
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
  int id;
  String username;
  String firstName;
  String lastName;
  String email;
  String password;
  String customerType;
  int buildingNo;
  String roomNo;
  int mobile;
  int altMobile;
  int whatsApp;
  int creditLimit;
  int creditDays;
  int creditInvoices;
  int gpse;
  int gpsn;
  String locationId;
  String priceGroupId;
  String userType;
  String name;
  String createdBy;
  int user;
  String staff;
  String status;
  String location;
  String pricegroup;
  String branch;

  Data({
    required this.id,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
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
    required this.locationId,
    required this.priceGroupId,
    required this.userType,
    required this.name,
    required this.createdBy,
    required this.user,
    required this.staff,
    required this.status,
    required this.location,
    required this.pricegroup,
    required this.branch,
  });

  Data copyWith({
    int? id,
    String? username,
    String? firstName,
    String? lastName,
    String? email,
    String? password,
    String? customerType,
    int? buildingNo,
    String? roomNo,
    int? mobile,
    int? altMobile,
    int? whatsApp,
    int? creditLimit,
    int? creditDays,
    int? creditInvoices,
    int? gpse,
    int? gpsn,
    String? locationId,
    String? priceGroupId,
    String? userType,
    String? name,
    String? createdBy,
    int? user,
    String? staff,
    String? status,
    String? location,
    String? pricegroup,
    String? branch,
  }) =>
      Data(
        id: id ?? this.id,
        username: username ?? this.username,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
        password: password ?? this.password,
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
        locationId: locationId ?? this.locationId,
        priceGroupId: priceGroupId ?? this.priceGroupId,
        userType: userType ?? this.userType,
        name: name ?? this.name,
        createdBy: createdBy ?? this.createdBy,
        user: user ?? this.user,
        staff: staff ?? this.staff,
        status: status ?? this.status,
        location: location ?? this.location,
        pricegroup: pricegroup ?? this.pricegroup,
        branch: branch ?? this.branch,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    username: json["username"],
    firstName: json["first_name"],
    lastName: json["last_name"],
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
    locationId: json["location_id"],
    priceGroupId: json["price_group_id"],
    userType: json["user_type"],
    name: json["name"],
    createdBy: json["created_by"],
    user: json["user"],
    staff: json["staff"],
    status: json["status"],
    location: json["Location"],
    pricegroup: json["Pricegroup"],
    branch: json["branch"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "first_name": firstName,
    "last_name": lastName,
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
    "location_id": locationId,
    "price_group_id": priceGroupId,
    "user_type": userType,
    "name": name,
    "created_by": createdBy,
    "user": user,
    "staff": staff,
    "status": status,
    "Location": location,
    "Pricegroup": pricegroup,
    "branch": branch,
  };
}
