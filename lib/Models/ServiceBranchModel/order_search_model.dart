// To parse this JSON data, do
//
//     final newOrderSearchModel = newOrderSearchModelFromJson(jsonString);

import 'dart:convert';

NewOrderSearchModel newOrderSearchModelFromJson(String str) => NewOrderSearchModel.fromJson(json.decode(str));

String newOrderSearchModelToJson(NewOrderSearchModel data) => json.encode(data.toJson());

class NewOrderSearchModel {
  final bool? status;
  final List<OrderSearchData>? data;
  final String? message;

  NewOrderSearchModel({
    this.status,
    this.data,
    this.message,
  });

  factory NewOrderSearchModel.fromJson(Map<String, dynamic> json) => NewOrderSearchModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<OrderSearchData>.from(json["data"]!.map((x) => OrderSearchData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class OrderSearchData {
  final String? customerId;
  final String? name;
  final String? customerType;
  final String? buildingName;
  final String? floorNumber;
  final String? flatNumber;
  final String? mobile;

  OrderSearchData({
    this.customerId,
    this.name,
    this.customerType,
    this.buildingName,
    this.floorNumber,
    this.flatNumber,
    this.mobile,
  });

  factory OrderSearchData.fromJson(Map<String, dynamic> json) => OrderSearchData(
    customerId: json["customer_id"],
    name: json["name"],
    customerType: json["customer_type"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
    mobile: json["mobile"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "name": name,
    "customer_type": customerType,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
    "mobile": mobile,
  };
}
