import 'dart:convert';
/// status : true
/// data : [{"order_id":"89d056d8-7001-4c41-a289-0b1294f806fd","order_number":"GFL202","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"7.0","Delivery_date":"29-03-2024","status":"Delivered","quantity":3,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"5e1c5569-edcf-4a2e-9c4d-20a409e0044f","order_number":"GFL168","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"8.0","Delivery_date":"29-03-2024","status":"Delivered","quantity":4,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"42b41deb-eb0a-4067-8fd1-8a92c0ddaa18","order_number":"GFL160","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"10.0","Delivery_date":"30-03-2024","status":"Delivered","quantity":4,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"90a27126-4ade-4cf3-a7d8-6c5580c64132","order_number":"GFL145","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"2.0","Delivery_date":"27-03-2024","status":"Delivered","quantity":1,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"5dc29563-f60d-4fc0-8f89-49b7786928d1","order_number":"GFL144","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"2.0","Delivery_date":"27-03-2024","status":"Delivered","quantity":1,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"30746d75-d188-41b6-9ec0-f63754e269e9","order_number":"GFL143","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"2.0","Delivery_date":"27-03-2024","status":"Delivered","quantity":1,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"0ef8bd50-241a-483f-812c-625664f09e7e","order_number":"GFL129","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"4.0","Delivery_date":"26-03-2024","status":"Delivered","quantity":6,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"f3bad4df-70c1-44df-bc9f-a737fe4e6697","order_number":"GFL101","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"16.0","Delivery_date":"26-03-2024","status":"Delivered","quantity":8,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"0b8fbe68-a735-4473-bce9-46cd04043f30","order_number":"62af9224","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"0.0","Delivery_date":"18-03-2024","status":"Delivered","quantity":0,"service_category_id":"0"},{"order_id":"e5acda13-1cb9-4b41-8f6b-3a6446597abd","order_number":"8bdbd124","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"20.00","Delivery_date":"2024-01-19","status":"Delivered","quantity":1,"service_category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b"},{"order_id":"24f686e8-d1bd-4256-a9aa-94df3a853c9c","order_number":"ffe78124","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"0","Delivery_date":"2024-03-22","status":"Delivered","quantity":0,"service_category_id":"0"},{"order_id":"830a5e0c-b5fd-4b53-93a1-192688fe3094","order_number":"6c911124","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"6.0","Delivery_date":"2024-01-03","status":"Delivered","quantity":3,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"397144b9-052a-420e-bed1-102ea13695bf","order_number":"93c2b124","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"8.0","Delivery_date":"2024-02-19","status":"Delivered","quantity":4,"service_category_id":"3c407064-2f5a-478d-8fc7-c9640c99bf43"},{"order_id":"00d29081-6069-475b-b2df-3fa46fab7a84","order_number":"7204e1223","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"0","Delivery_date":"2023-12-27","status":"Delivered","quantity":2,"service_category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b"},{"order_id":"01d6604b-9fc7-4f46-b4e0-57174c2ead66","order_number":"a3f9c1223","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"0","Delivery_date":"2023-12-27","status":"Delivered","quantity":1,"service_category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b"}]
/// message : "Customer recent order list!"

AddComplaintModel addComplaintModelFromJson(String str) => AddComplaintModel.fromJson(json.decode(str));
String addComplaintModelToJson(AddComplaintModel data) => json.encode(data.toJson());
class AddComplaintModel {
  AddComplaintModel({
      this.status, 
      this.data, 
      this.message,});

  AddComplaintModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AddComplaintData.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<AddComplaintData>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

/// order_id : "89d056d8-7001-4c41-a289-0b1294f806fd"
/// order_number : "GFL202"
/// customer : "a59b6ef2-e15e-4175-80c3-141e8caf720c"
/// total_amount : "7.0"
/// Delivery_date : "29-03-2024"
/// status : "Delivered"
/// quantity : 3
/// service_category_id : "3c407064-2f5a-478d-8fc7-c9640c99bf43"

AddComplaintData dataFromJson(String str) => AddComplaintData.fromJson(json.decode(str));
String dataToJson(AddComplaintData data) => json.encode(data.toJson());
class AddComplaintData {
  AddComplaintData({
      this.orderId, 
      this.orderNumber, 
      this.customer, 
      this.totalAmount, 
      this.deliveryDate, 
      this.status, 
      this.quantity, 
      this.serviceCategoryId,});

  AddComplaintData.fromJson(dynamic json) {
    orderId = json['order_id'];
    orderNumber = json['order_number'];
    customer = json['customer'];
    totalAmount = json['total_amount'];
    deliveryDate = json['Delivery_date'];
    status = json['status'];
    quantity = json['quantity'];
    serviceCategoryId = json['service_category_id'];
  }
  String? orderId;
  String? orderNumber;
  String? customer;
  String? totalAmount;
  String? deliveryDate;
  String? status;
  int? quantity;
  String? serviceCategoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['order_number'] = orderNumber;
    map['customer'] = customer;
    map['total_amount'] = totalAmount;
    map['Delivery_date'] = deliveryDate;
    map['status'] = status;
    map['quantity'] = quantity;
    map['service_category_id'] = serviceCategoryId;
    return map;
  }

}