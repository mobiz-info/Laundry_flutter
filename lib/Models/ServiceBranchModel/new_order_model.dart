import 'dart:convert';
/// status : true
/// data : {"order":[{"order_number":"GFL117","order_type":"Normal","staff__name":"Ashok","Delivery_time":null,"Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"GFL080","order_type":"Normal","staff__name":"Ashok","Delivery_time":null,"Delivery_date":"22-04-2024","status":"Handover"},{"order_number":"2a56a224","order_type":"Normal","staff__name":"Ashok","Delivery_time":"22:47","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"45365124","order_type":"Normal","staff__name":"Ashok","Delivery_time":"12:28","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"0ea5e124","order_type":"Normal","staff__name":"Ashok","Delivery_time":"12:00 PM - 01:00 PM","Delivery_date":"24-03-2024","status":"Handover"},{"order_number":"942ad124","order_type":"Normal","staff__name":"Ashok","Delivery_time":null,"Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"456cc1223","order_type":"Normal","staff__name":"Ashok","Delivery_time":"07:00 AM - 08:00 AM","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"811531223","order_type":"Normal","staff__name":"Ashok","Delivery_time":"10:00 AM - 11:00 AM","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"d15cb1223","order_type":"Normal","staff__name":"Ashok","Delivery_time":"03:00 PM - 04:00 PM","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"00eb41223","order_type":"Urgent","staff__name":"Ashok","Delivery_time":null,"Delivery_date":"23-04-2024","status":"Handover"}],"ordercount":10}
/// message : "Orders successfully listed"

NewOrderModel newOrderModelFromJson(String str) => NewOrderModel.fromJson(json.decode(str));
String newOrderModelToJson(NewOrderModel data) => json.encode(data.toJson());
class NewOrderModel {
  NewOrderModel({
      this.status, 
      this.data, 
      this.message,});

  NewOrderModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? NewOrderData.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  NewOrderData? data;
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

/// order : [{"order_number":"GFL117","order_type":"Normal","staff__name":"Ashok","Delivery_time":null,"Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"GFL080","order_type":"Normal","staff__name":"Ashok","Delivery_time":null,"Delivery_date":"22-04-2024","status":"Handover"},{"order_number":"2a56a224","order_type":"Normal","staff__name":"Ashok","Delivery_time":"22:47","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"45365124","order_type":"Normal","staff__name":"Ashok","Delivery_time":"12:28","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"0ea5e124","order_type":"Normal","staff__name":"Ashok","Delivery_time":"12:00 PM - 01:00 PM","Delivery_date":"24-03-2024","status":"Handover"},{"order_number":"942ad124","order_type":"Normal","staff__name":"Ashok","Delivery_time":null,"Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"456cc1223","order_type":"Normal","staff__name":"Ashok","Delivery_time":"07:00 AM - 08:00 AM","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"811531223","order_type":"Normal","staff__name":"Ashok","Delivery_time":"10:00 AM - 11:00 AM","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"d15cb1223","order_type":"Normal","staff__name":"Ashok","Delivery_time":"03:00 PM - 04:00 PM","Delivery_date":"23-04-2024","status":"Handover"},{"order_number":"00eb41223","order_type":"Urgent","staff__name":"Ashok","Delivery_time":null,"Delivery_date":"23-04-2024","status":"Handover"}]
/// ordercount : 10

NewOrderData dataFromJson(String str) => NewOrderData.fromJson(json.decode(str));
String dataToJson(NewOrderData data) => json.encode(data.toJson());
class NewOrderData {
  NewOrderData({
      this.order, 
      this.ordercount,});

  NewOrderData.fromJson(dynamic json) {
    if (json['order'] != null) {
      order = [];
      json['order'].forEach((v) {
        order?.add(Order.fromJson(v));
      });
    }
    ordercount = json['ordercount'];
  }
  List<Order>? order;
  int? ordercount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (order != null) {
      map['order'] = order?.map((v) => v.toJson()).toList();
    }
    map['ordercount'] = ordercount;
    return map;
  }

}

/// order_number : "GFL117"
/// order_type : "Normal"
/// staff__name : "Ashok"
/// Delivery_time : null
/// Delivery_date : "23-04-2024"
/// status : "Handover"

Order orderFromJson(String str) => Order.fromJson(json.decode(str));
String orderToJson(Order data) => json.encode(data.toJson());
class Order {
  Order({
      this.orderNumber, 
      this.orderType, 
      this.staffName, 
      this.deliveryTime, 
      this.deliveryDate, 
      this.status,});

  Order.fromJson(dynamic json) {
    orderNumber = json['order_number'];
    orderType = json['order_type'];
    staffName = json['staff__name'];
    deliveryTime = json['Delivery_time'];
    deliveryDate = json['Delivery_date'];
    status = json['status'];
  }
  String? orderNumber;
  String? orderType;
  String? staffName;
  dynamic deliveryTime;
  String? deliveryDate;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_number'] = orderNumber;
    map['order_type'] = orderType;
    map['staff__name'] = staffName;
    map['Delivery_time'] = deliveryTime;
    map['Delivery_date'] = deliveryDate;
    map['status'] = status;
    return map;
  }

}