// To parse this JSON data, do
//
//     final serCartCountModel = serCartCountModelFromJson(jsonString);

import 'dart:convert';

SerCartCountModel serCartCountModelFromJson(String str) => SerCartCountModel.fromJson(json.decode(str));

String serCartCountModelToJson(SerCartCountModel data) => json.encode(data.toJson());

class SerCartCountModel {
  final bool? status;
  final SerCartCountData? data;
  final String? message;

  SerCartCountModel({
    this.status,
    this.data,
    this.message,
  });

  factory SerCartCountModel.fromJson(Map<String, dynamic> json) => SerCartCountModel(
    status: json["status"],
    data: json["data"] == null ? null : SerCartCountData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class SerCartCountData {
  final Order? order;
  final int? cartCount;

  SerCartCountData({
    this.order,
    this.cartCount,
  });

  factory SerCartCountData.fromJson(Map<String, dynamic> json) => SerCartCountData(
    order: json["order"] == null ? null : Order.fromJson(json["order"]),
    cartCount: json["cart_count"],
  );

  Map<String, dynamic> toJson() => {
    "order": order?.toJson(),
    "cart_count": cartCount,
  };
}

class Order {
  final String? orderId;
  final Customer? customer;
  final Staff? staff;
  final String? createdBy;
  final DateTime? createdDate;
  final String? orderNumber;
  final dynamic pickupDate;
  final dynamic pickupTime;
  final String? pickupMode;
  final bool? confirmPickup;
  final String? status;
  final String? orderType;
  final String? totalAmount;
  final String? orderVia;
  final DateTime? orderDate;
  final String? deliveryDate;
  final String? deliveryTime;
  final bool? paidStatus;
  final String? discount;
  final String? netTaxable;
  final String? vat;
  final String? grantTotal;
  final dynamic invoice;
  final dynamic customerAddress;

  Order({
    this.orderId,
    this.customer,
    this.staff,
    this.createdBy,
    this.createdDate,
    this.orderNumber,
    this.pickupDate,
    this.pickupTime,
    this.pickupMode,
    this.confirmPickup,
    this.status,
    this.orderType,
    this.totalAmount,
    this.orderVia,
    this.orderDate,
    this.deliveryDate,
    this.deliveryTime,
    this.paidStatus,
    this.discount,
    this.netTaxable,
    this.vat,
    this.grantTotal,
    this.invoice,
    this.customerAddress,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
    staff: json["staff"] == null ? null : Staff.fromJson(json["staff"]),
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: json["pickup_date"],
    pickupTime: json["pickup_time"],
    pickupMode: json["Pickup_mode"],
    confirmPickup: json["confirm_pickup"],
    status: json["status"],
    orderType: json["order_type"],
    totalAmount: json["total_amount"],
    orderVia: json["order_via"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    deliveryDate: json["Delivery_date"],
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    discount: json["discount"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    grantTotal: json["grant_total"],
    invoice: json["invoice"],
    customerAddress: json["customer_address"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "customer": customer?.toJson(),
    "staff": staff?.toJson(),
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": pickupDate,
    "pickup_time": pickupTime,
    "Pickup_mode": pickupMode,
    "confirm_pickup": confirmPickup,
    "status": status,
    "order_type": orderType,
    "total_amount": totalAmount,
    "order_via": orderVia,
    "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
    "Delivery_date": deliveryDate,
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "discount": discount,
    "net_taxable": netTaxable,
    "vat": vat,
    "grant_total": grantTotal,
    "invoice": invoice,
    "customer_address": customerAddress,
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

class Staff {
  final String? staffId;
  final String? name;
  final String? curMobile;
  final String? perMobile;

  Staff({
    this.staffId,
    this.name,
    this.curMobile,
    this.perMobile,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    staffId: json["staff_id"],
    name: json["name"],
    curMobile: json["cur_mobile"],
    perMobile: json["per_mobile"],
  );

  Map<String, dynamic> toJson() => {
    "staff_id": staffId,
    "name": name,
    "cur_mobile": curMobile,
    "per_mobile": perMobile,
  };
}



// // To parse this JSON data, do
// //
// //     final serCartCountModel = serCartCountModelFromJson(jsonString);
//
// import 'dart:convert';
//
// SerCartCountModel serCartCountModelFromJson(String str) => SerCartCountModel.fromJson(json.decode(str));
//
// String serCartCountModelToJson(SerCartCountModel data) => json.encode(data.toJson());
//
// class SerCartCountModel {
//   final bool? status;
//   final SerCartCountData? data;
//   final String? message;
//
//   SerCartCountModel({
//     this.status,
//     this.data,
//     this.message,
//   });
//
//   factory SerCartCountModel.fromJson(Map<String, dynamic> json) => SerCartCountModel(
//     status: json["status"],
//     data: json["data"] == null ? null : SerCartCountData.fromJson(json["data"]),
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
// class SerCartCountData {
//   final Order? order;
//   final int? cartCount;
//
//   SerCartCountData({
//     this.order,
//     this.cartCount,
//   });
//
//   factory SerCartCountData.fromJson(Map<String, dynamic> json) => SerCartCountData(
//     order: json["order"] == null ? null : Order.fromJson(json["order"]),
//     cartCount: json["cart_count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "order": order?.toJson(),
//     "cart_count": cartCount,
//   };
// }
//
// class Order {
//   final String? orderId;
//   final Customer? customer;
//   final Staff? staff;
//   final String? createdBy;
//   final DateTime? createdDate;
//   final String? orderNumber;
//   final DateTime? pickupDate;
//   final String? pickupTime;
//   final String? pickupMode;
//   final bool? confirmPickup;
//   final String? status;
//   final String? orderType;
//   final String? totalAmount;
//   final String? orderVia;
//   final DateTime? orderDate;
//   final DateTime? deliveryDate;
//   final String? deliveryTime;
//   final bool? paidStatus;
//   final String? discount;
//   final String? netTaxable;
//   final String? vat;
//   final String? grantTotal;
//   final dynamic invoice;
//   final dynamic customerAddress;
//
//   Order({
//     this.orderId,
//     this.customer,
//     this.staff,
//     this.createdBy,
//     this.createdDate,
//     this.orderNumber,
//     this.pickupDate,
//     this.pickupTime,
//     this.pickupMode,
//     this.confirmPickup,
//     this.status,
//     this.orderType,
//     this.totalAmount,
//     this.orderVia,
//     this.orderDate,
//     this.deliveryDate,
//     this.deliveryTime,
//     this.paidStatus,
//     this.discount,
//     this.netTaxable,
//     this.vat,
//     this.grantTotal,
//     this.invoice,
//     this.customerAddress,
//   });
//
//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//     orderId: json["order_id"],
//     customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
//     staff: json["staff"] == null ? null : Staff.fromJson(json["staff"]),
//     createdBy: json["created_by"],
//     createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
//     orderNumber: json["order_number"],
//     pickupDate: json["pickup_date"] == null ? null : DateTime.parse(json["pickup_date"]),
//     pickupTime: json["pickup_time"],
//     pickupMode: json["Pickup_mode"],
//     confirmPickup: json["confirm_pickup"],
//     status: json["status"],
//     orderType: json["order_type"],
//     totalAmount: json["total_amount"],
//     orderVia: json["order_via"],
//     orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
//     deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
//     deliveryTime: json["Delivery_time"],
//     paidStatus: json["paid_status"],
//     discount: json["discount"],
//     netTaxable: json["net_taxable"],
//     vat: json["vat"],
//     grantTotal: json["grant_total"],
//     invoice: json["invoice"],
//     customerAddress: json["customer_address"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "order_id": orderId,
//     "customer": customer?.toJson(),
//     "staff": staff?.toJson(),
//     "created_by": createdBy,
//     "created_date": createdDate?.toIso8601String(),
//     "order_number": orderNumber,
//     "pickup_date": "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
//     "pickup_time": pickupTime,
//     "Pickup_mode": pickupMode,
//     "confirm_pickup": confirmPickup,
//     "status": status,
//     "order_type": orderType,
//     "total_amount": totalAmount,
//     "order_via": orderVia,
//     "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
//     "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
//     "Delivery_time": deliveryTime,
//     "paid_status": paidStatus,
//     "discount": discount,
//     "net_taxable": netTaxable,
//     "vat": vat,
//     "grant_total": grantTotal,
//     "invoice": invoice,
//     "customer_address": customerAddress,
//   };
// }
//
// class Customer {
//   final String? customerId;
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
//   final String? location;
//   final String? pricegroup;
//
//   Customer({
//     this.customerId,
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
//     this.location,
//     this.pricegroup,
//   });
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//     customerId: json["customer_id"],
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
//     location: json["Location"],
//     pricegroup: json["Pricegroup"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "customer_id": customerId,
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
//     "Location": location,
//     "Pricegroup": pricegroup,
//   };
// }
//
// class Staff {
//   final String? staffId;
//   final String? name;
//   final String? curMobile;
//   final String? perMobile;
//
//   Staff({
//     this.staffId,
//     this.name,
//     this.curMobile,
//     this.perMobile,
//   });
//
//   factory Staff.fromJson(Map<String, dynamic> json) => Staff(
//     staffId: json["staff_id"],
//     name: json["name"],
//     curMobile: json["cur_mobile"],
//     perMobile: json["per_mobile"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "staff_id": staffId,
//     "name": name,
//     "cur_mobile": curMobile,
//     "per_mobile": perMobile,
//   };
// }
