import 'dart:convert';
/// stats : true
/// data : {"wallet_balance":"418.0","outstanding":35.0,"name":"sreelekha","Todays_delivery":[{"order_number":"GFL141","total_amount":"3.0"},{"order_number":"GFL140","total_amount":"2.0"},{"order_number":"GFL139","total_amount":"10.0"},{"order_number":"GFL131","total_amount":"10.0"}]}
/// message : "Customer Wallet Details!"

CustomerBalanceModel walletOutstandingModelFromJson(String str) => CustomerBalanceModel.fromJson(json.decode(str));
String walletOutstandingModelToJson(CustomerBalanceModel data) => json.encode(data.toJson());
class CustomerBalanceModel {
  CustomerBalanceModel({
      this.stats, 
      this.data, 
      this.message,});

  CustomerBalanceModel.fromJson(dynamic json) {
    stats = json['stats'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? stats;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['stats'] = stats;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

/// wallet_balance : "418.0"
/// outstanding : 35.0
/// name : "sreelekha"
/// Todays_delivery : [{"order_number":"GFL141","total_amount":"3.0"},{"order_number":"GFL140","total_amount":"2.0"},{"order_number":"GFL139","total_amount":"10.0"},{"order_number":"GFL131","total_amount":"10.0"}]

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.walletBalance, 
      this.outstanding, 
      this.name, 
      this.todaysDelivery,});

  Data.fromJson(dynamic json) {
    walletBalance = json['wallet_balance'];
    outstanding = json['outstanding'];
    name = json['name'];
    if (json['Todays_delivery'] != null) {
      todaysDelivery = [];
      json['Todays_delivery'].forEach((v) {
        todaysDelivery?.add(TodaysDelivery.fromJson(v));
      });
    }
  }
  String? walletBalance;
  double? outstanding;
  String? name;
  List<TodaysDelivery>? todaysDelivery;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wallet_balance'] = walletBalance;
    map['outstanding'] = outstanding;
    map['name'] = name;
    if (todaysDelivery != null) {
      map['Todays_delivery'] = todaysDelivery?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// order_number : "GFL141"
/// total_amount : "3.0"

TodaysDelivery todaysDeliveryFromJson(String str) => TodaysDelivery.fromJson(json.decode(str));
String todaysDeliveryToJson(TodaysDelivery data) => json.encode(data.toJson());
class TodaysDelivery {
  TodaysDelivery({
      this.orderNumber, 
      this.totalAmount,});

  TodaysDelivery.fromJson(dynamic json) {
    orderNumber = json['order_number'];
    totalAmount = json['total_amount'];
  }
  String? orderNumber;
  String? totalAmount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_number'] = orderNumber;
    map['total_amount'] = totalAmount;
    return map;
  }

}