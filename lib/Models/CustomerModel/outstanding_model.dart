import 'dart:convert';
/// status : true
/// data : {"pending_amout":[{"order_number":"a253b124","order_date":"2024-01-10","total_amount":"6.0","balance":12.0,"amount_paid":"150","invoices_date":null,"invoices_number":null,"status":"Unpaid"},{"order_number":"0ea5e124","order_date":"2024-01-12","total_amount":"4.0","balance":0.0,"amount_paid":"1.0","invoices_date":null,"invoices_number":null,"status":"Paid"}],"overall_due":12.0}
/// message : "Outstanding Dues List!"

OutstandingModel outstandingModelFromJson(String str) => OutstandingModel.fromJson(json.decode(str));
String outstandingModelToJson(OutstandingModel data) => json.encode(data.toJson());
class OutstandingModel {
  OutstandingModel({
      this.status, 
      this.data, 
      this.message,});

  OutstandingModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? OutstandingData.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  OutstandingData? data;
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

/// pending_amout : [{"order_number":"a253b124","order_date":"2024-01-10","total_amount":"6.0","balance":12.0,"amount_paid":"150","invoices_date":null,"invoices_number":null,"status":"Unpaid"},{"order_number":"0ea5e124","order_date":"2024-01-12","total_amount":"4.0","balance":0.0,"amount_paid":"1.0","invoices_date":null,"invoices_number":null,"status":"Paid"}]
/// overall_due : 12.0

OutstandingData dataFromJson(String str) => OutstandingData.fromJson(json.decode(str));
String dataToJson(OutstandingData data) => json.encode(data.toJson());
class OutstandingData {
  OutstandingData({
      this.pendingAmout, 
      this.overallDue,});

  OutstandingData.fromJson(dynamic json) {
    if (json['pending_amout'] != null) {
      pendingAmout = [];
      json['pending_amout'].forEach((v) {
        pendingAmout?.add(PendingAmout.fromJson(v));
      });
    }
    overallDue = json['overall_due'];
  }
  List<PendingAmout>? pendingAmout;
  double? overallDue;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (pendingAmout != null) {
      map['pending_amout'] = pendingAmout?.map((v) => v.toJson()).toList();
    }
    map['overall_due'] = overallDue;
    return map;
  }

}

/// order_number : "a253b124"
/// order_date : "2024-01-10"
/// total_amount : "6.0"
/// balance : 12.0
/// amount_paid : "150"
/// invoices_date : null
/// invoices_number : null
/// status : "Unpaid"

PendingAmout pendingAmoutFromJson(String str) => PendingAmout.fromJson(json.decode(str));
String pendingAmoutToJson(PendingAmout data) => json.encode(data.toJson());
class PendingAmout {
  PendingAmout({
      this.orderNumber, 
      this.orderDate, 
      this.totalAmount, 
      this.balance, 
      this.amountPaid, 
      this.invoicesDate, 
      this.invoicesNumber, 
      this.status,});

  PendingAmout.fromJson(dynamic json) {
    orderNumber = json['order_number'];
    orderDate = json['order_date'];
    totalAmount = json['total_amount'];
    balance = json['balance'];
    amountPaid = json['amount_paid'];
    invoicesDate = json['invoices_date'];
    invoicesNumber = json['invoices_number'];
    status = json['status'];
  }
  String? orderNumber;
  String? orderDate;
  String? totalAmount;
  double? balance;
  String? amountPaid;
  dynamic invoicesDate;
  dynamic invoicesNumber;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_number'] = orderNumber;
    map['order_date'] = orderDate;
    map['total_amount'] = totalAmount;
    map['balance'] = balance;
    map['amount_paid'] = amountPaid;
    map['invoices_date'] = invoicesDate;
    map['invoices_number'] = invoicesNumber;
    map['status'] = status;
    return map;
  }

}