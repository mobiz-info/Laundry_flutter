import 'dart:convert';
/// status : true
/// data : {"orders":[{"order_id":"027b420c-8336-4af6-a1c5-2ea8998c35d9","order_number":"0ce3a124","Pickup_mode":"Staff Pick","order_type":"Normal","total_amount":"20.0","Delivery_date":"2024-01-02","status":"Completed","quantity":1,"staff_name":"Ashok"}],"orders_count":1}
/// message : "Invoice Data Saved Successfully!"

GenInvoiceSearchModel genInvoiceSearchModelFromJson(String str) => GenInvoiceSearchModel.fromJson(json.decode(str));
String genInvoiceSearchModelToJson(GenInvoiceSearchModel data) => json.encode(data.toJson());
class GenInvoiceSearchModel {
  GenInvoiceSearchModel({
      this.status, 
      this.data, 
      this.message,});

  GenInvoiceSearchModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? GenInvoiceSearchData.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  GenInvoiceSearchData? data;
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

/// orders : [{"order_id":"027b420c-8336-4af6-a1c5-2ea8998c35d9","order_number":"0ce3a124","Pickup_mode":"Staff Pick","order_type":"Normal","total_amount":"20.0","Delivery_date":"2024-01-02","status":"Completed","quantity":1,"staff_name":"Ashok"}]
/// orders_count : 1

GenInvoiceSearchData dataFromJson(String str) => GenInvoiceSearchData.fromJson(json.decode(str));
String dataToJson(GenInvoiceSearchData data) => json.encode(data.toJson());
class GenInvoiceSearchData {
  GenInvoiceSearchData({
      this.orders, 
      this.ordersCount,});

  GenInvoiceSearchData.fromJson(dynamic json) {
    if (json['orders'] != null) {
      orders = [];
      json['orders'].forEach((v) {
        orders?.add(Orders.fromJson(v));
      });
    }
    ordersCount = json['orders_count'];
  }
  List<Orders>? orders;
  int? ordersCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (orders != null) {
      map['orders'] = orders?.map((v) => v.toJson()).toList();
    }
    map['orders_count'] = ordersCount;
    return map;
  }

}

/// order_id : "027b420c-8336-4af6-a1c5-2ea8998c35d9"
/// order_number : "0ce3a124"
/// Pickup_mode : "Staff Pick"
/// order_type : "Normal"
/// total_amount : "20.0"
/// Delivery_date : "2024-01-02"
/// status : "Completed"
/// quantity : 1
/// staff_name : "Ashok"

Orders ordersFromJson(String str) => Orders.fromJson(json.decode(str));
String ordersToJson(Orders data) => json.encode(data.toJson());
class Orders {
  Orders({
      this.orderId, 
      this.orderNumber, 
      this.pickupMode, 
      this.orderType, 
      this.totalAmount, 
      this.deliveryDate, 
      this.status, 
      this.quantity, 
      this.staffName,});

  Orders.fromJson(dynamic json) {
    orderId = json['order_id'];
    orderNumber = json['order_number'];
    pickupMode = json['Pickup_mode'];
    orderType = json['order_type'];
    totalAmount = json['total_amount'];
    deliveryDate = json['Delivery_date'];
    status = json['status'];
    quantity = json['quantity'];
    staffName = json['staff_name'];
  }
  String? orderId;
  String? orderNumber;
  String? pickupMode;
  String? orderType;
  String? totalAmount;
  String? deliveryDate;
  String? status;
  int? quantity;
  String? staffName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['order_number'] = orderNumber;
    map['Pickup_mode'] = pickupMode;
    map['order_type'] = orderType;
    map['total_amount'] = totalAmount;
    map['Delivery_date'] = deliveryDate;
    map['status'] = status;
    map['quantity'] = quantity;
    map['staff_name'] = staffName;
    return map;
  }

}