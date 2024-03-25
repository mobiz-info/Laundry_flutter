// To parse this JSON data, do
//
//     final addOrderModel = addOrderModelFromJson(jsonString);

import 'dart:convert';

AddOrderModel addOrderModelFromJson(String str) => AddOrderModel.fromJson(json.decode(str));

String addOrderModelToJson(AddOrderModel data) => json.encode(data.toJson());

class AddOrderModel {
  final bool? status;
  final AddOrderData? data;
  final String? message;

  AddOrderModel({
    this.status,
    this.data,
    this.message,
  });

  factory AddOrderModel.fromJson(Map<String, dynamic> json) => AddOrderModel(
    status: json["status"],
    data: json["data"] == null ? null : AddOrderData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class AddOrderData {
  final String? orderId;
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
  final String? staff;
  final String? customer;
  final dynamic invoice;
  final dynamic customerAddress;

  AddOrderData({
    this.orderId,
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
    this.staff,
    this.customer,
    this.invoice,
    this.customerAddress,
  });

  factory AddOrderData.fromJson(Map<String, dynamic> json) => AddOrderData(
    orderId: json["order_id"],
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
    staff: json["staff"],
    customer: json["customer"],
    invoice: json["invoice"],
    customerAddress: json["customer_address"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
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
    "staff": staff,
    "customer": customer,
    "invoice": invoice,
    "customer_address": customerAddress,
  };
}


// import 'dart:convert';
// /// status : true
// /// data : {"order_id":"3d880219-f3d3-4206-9e09-102a21284f25","created_by":"Staff","created_date":"2024-02-22T15:45:38.205189Z","order_number":"25d27224","pickup_date":null,"pickup_time":null,"Pickup_mode":"Direct","confirm_pickup":false,"status":"Confirmed","order_type":"Normal","total_amount":"0.0","order_via":"Via Direct","order_date":"2024-02-22","Delivery_date":"2023-11-30","Delivery_time":"06:17:26","paid_status":false,"discount":"0.0","net_taxable":"0.0","vat":"0.0","grant_total":"0.0","staff":"1e100a11-72ad-4899-8aa6-7c03e4416f07","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","invoice":null,"customer_address":null}
// /// message : "Order Successfully Saved!"
//
// AddOrderModel addOrderModelFromJson(String str) => AddOrderModel.fromJson(json.decode(str));
// String addOrderModelToJson(AddOrderModel data) => json.encode(data.toJson());
// class AddOrderModel {
//   AddOrderModel({
//       this.status,
//       this.data,
//       this.message,});
//
//   AddOrderModel.fromJson(dynamic json) {
//     status = json['status'];
//     data = json['data'] != null ? AddOrderData.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//   bool? status;
//   AddOrderData? data;
//   String? message;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     if (data != null) {
//       map['data'] = data?.toJson();
//     }
//     map['message'] = message;
//     return map;
//   }
//
// }
//
// /// order_id : "3d880219-f3d3-4206-9e09-102a21284f25"
// /// created_by : "Staff"
// /// created_date : "2024-02-22T15:45:38.205189Z"
// /// order_number : "25d27224"
// /// pickup_date : null
// /// pickup_time : null
// /// Pickup_mode : "Direct"
// /// confirm_pickup : false
// /// status : "Confirmed"
// /// order_type : "Normal"
// /// total_amount : "0.0"
// /// order_via : "Via Direct"
// /// order_date : "2024-02-22"
// /// Delivery_date : "2023-11-30"
// /// Delivery_time : "06:17:26"
// /// paid_status : false
// /// discount : "0.0"
// /// net_taxable : "0.0"
// /// vat : "0.0"
// /// grant_total : "0.0"
// /// staff : "1e100a11-72ad-4899-8aa6-7c03e4416f07"
// /// customer : "a59b6ef2-e15e-4175-80c3-141e8caf720c"
// /// invoice : null
// /// customer_address : null
//
// AddOrderData dataFromJson(String str) => AddOrderData.fromJson(json.decode(str));
// String dataToJson(AddOrderData data) => json.encode(data.toJson());
// class AddOrderData {
//   AddOrderData({
//       this.orderId,
//       this.createdBy,
//       this.createdDate,
//       this.orderNumber,
//       this.pickupDate,
//       this.pickupTime,
//       this.pickupMode,
//       this.confirmPickup,
//       this.status,
//       this.orderType,
//       this.totalAmount,
//       this.orderVia,
//       this.orderDate,
//       this.deliveryDate,
//       this.deliveryTime,
//       this.paidStatus,
//       this.discount,
//       this.netTaxable,
//       this.vat,
//       this.grantTotal,
//       this.staff,
//       this.customer,
//       this.invoice,
//       this.customerAddress,});
//
//   AddOrderData.fromJson(dynamic json) {
//     orderId = json['order_id'];
//     createdBy = json['created_by'];
//     createdDate = json['created_date'];
//     orderNumber = json['order_number'];
//     pickupDate = json['pickup_date'];
//     pickupTime = json['pickup_time'];
//     pickupMode = json['Pickup_mode'];
//     confirmPickup = json['confirm_pickup'];
//     status = json['status'];
//     orderType = json['order_type'];
//     totalAmount = json['total_amount'];
//     orderVia = json['order_via'];
//     orderDate = json['order_date'];
//     deliveryDate = json['Delivery_date'];
//     deliveryTime = json['Delivery_time'];
//     paidStatus = json['paid_status'];
//     discount = json['discount'];
//     netTaxable = json['net_taxable'];
//     vat = json['vat'];
//     grantTotal = json['grant_total'];
//     staff = json['staff'];
//     customer = json['customer'];
//     invoice = json['invoice'];
//     customerAddress = json['customer_address'];
//   }
//   String? orderId;
//   String? createdBy;
//   String? createdDate;
//   String? orderNumber;
//   dynamic pickupDate;
//   dynamic pickupTime;
//   String? pickupMode;
//   bool? confirmPickup;
//   String? status;
//   String? orderType;
//   String? totalAmount;
//   String? orderVia;
//   String? orderDate;
//   String? deliveryDate;
//   String? deliveryTime;
//   bool? paidStatus;
//   String? discount;
//   String? netTaxable;
//   String? vat;
//   String? grantTotal;
//   String? staff;
//   String? customer;
//   dynamic invoice;
//   dynamic customerAddress;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['order_id'] = orderId;
//     map['created_by'] = createdBy;
//     map['created_date'] = createdDate;
//     map['order_number'] = orderNumber;
//     map['pickup_date'] = pickupDate;
//     map['pickup_time'] = pickupTime;
//     map['Pickup_mode'] = pickupMode;
//     map['confirm_pickup'] = confirmPickup;
//     map['status'] = status;
//     map['order_type'] = orderType;
//     map['total_amount'] = totalAmount;
//     map['order_via'] = orderVia;
//     map['order_date'] = orderDate;
//     map['Delivery_date'] = deliveryDate;
//     map['Delivery_time'] = deliveryTime;
//     map['paid_status'] = paidStatus;
//     map['discount'] = discount;
//     map['net_taxable'] = netTaxable;
//     map['vat'] = vat;
//     map['grant_total'] = grantTotal;
//     map['staff'] = staff;
//     map['customer'] = customer;
//     map['invoice'] = invoice;
//     map['customer_address'] = customerAddress;
//     return map;
//   }
//
// }