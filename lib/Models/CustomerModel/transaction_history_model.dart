import 'dart:convert';
/// status : true
/// data : {"all":[{"created_date":"2024-01-18","transfer_id":"d1a16222-76a3-4c67-aaeb-3b533423cc3f","transfer_type":"Credit","order__order_number":null,"amount":"20.0","message":"Added to wallet"},{"created_date":"2024-01-18","transfer_id":"bbdd5813-bacd-416b-a003-e0da93fcc944","transfer_type":"Debit","order__order_number":null,"amount":"0","message":"Used from wallet"},{"created_date":"2024-01-12","transfer_id":"2b3bf22b-b859-48ce-9da4-c4de6656356d","transfer_type":"Credit","order__order_number":null,"amount":"8.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"2855efdb-bc20-4d87-8444-287b54c84eea","transfer_type":"Credit","order__order_number":null,"amount":"8.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"120a3656-3497-4af0-b290-4d366ba7b011","transfer_type":"Credit","order__order_number":null,"amount":"12.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"9553a3a6-4d67-4307-b60e-faed0331d391","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"dc834c3f-bd60-4b3c-bfb4-c1859caf69ae","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"183528c4-6103-444b-8eff-b08b844a9431","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"9f60ccb6-a57f-47bd-9d44-7596d875d8ff","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"cb05ceb3-fa30-4a9e-9589-863e1338a0fb","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"af5bf544-2fb6-4683-b298-6e5897a4d1e7","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"21ab634b-5936-4ad2-8bbe-719bf22d6f71","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"62648ba4-095e-41de-9430-961daed0f0ba","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"}],"credit_type":[{"created_date":"2024-01-18","transfer_id":"d1a16222-76a3-4c67-aaeb-3b533423cc3f","transfer_type":"Credit","order__order_number":null,"amount":"20.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"2b3bf22b-b859-48ce-9da4-c4de6656356d","transfer_type":"Credit","order__order_number":null,"amount":"8.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"2855efdb-bc20-4d87-8444-287b54c84eea","transfer_type":"Credit","order__order_number":null,"amount":"8.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"120a3656-3497-4af0-b290-4d366ba7b011","transfer_type":"Credit","order__order_number":null,"amount":"12.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"9553a3a6-4d67-4307-b60e-faed0331d391","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"dc834c3f-bd60-4b3c-bfb4-c1859caf69ae","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"183528c4-6103-444b-8eff-b08b844a9431","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"9f60ccb6-a57f-47bd-9d44-7596d875d8ff","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"cb05ceb3-fa30-4a9e-9589-863e1338a0fb","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"af5bf544-2fb6-4683-b298-6e5897a4d1e7","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"21ab634b-5936-4ad2-8bbe-719bf22d6f71","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"62648ba4-095e-41de-9430-961daed0f0ba","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"}],"debit_details":[{"created_date":"2024-01-18","transfer_id":"bbdd5813-bacd-416b-a003-e0da93fcc944","transfer_type":"Debit","order__order_number":null,"amount":"0","message":"Used from wallet"}]}
/// message : "Data passed successfully"

TransactionHistoryModel transactionHistoryModelFromJson(String str) => TransactionHistoryModel.fromJson(json.decode(str));
String transactionHistoryModelToJson(TransactionHistoryModel data) => json.encode(data.toJson());
class TransactionHistoryModel {
  TransactionHistoryModel({
      this.status, 
      this.data, 
      this.message,});

  TransactionHistoryModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? TransactionHistoryData.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  TransactionHistoryData? data;
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

/// all : [{"created_date":"2024-01-18","transfer_id":"d1a16222-76a3-4c67-aaeb-3b533423cc3f","transfer_type":"Credit","order__order_number":null,"amount":"20.0","message":"Added to wallet"},{"created_date":"2024-01-18","transfer_id":"bbdd5813-bacd-416b-a003-e0da93fcc944","transfer_type":"Debit","order__order_number":null,"amount":"0","message":"Used from wallet"},{"created_date":"2024-01-12","transfer_id":"2b3bf22b-b859-48ce-9da4-c4de6656356d","transfer_type":"Credit","order__order_number":null,"amount":"8.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"2855efdb-bc20-4d87-8444-287b54c84eea","transfer_type":"Credit","order__order_number":null,"amount":"8.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"120a3656-3497-4af0-b290-4d366ba7b011","transfer_type":"Credit","order__order_number":null,"amount":"12.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"9553a3a6-4d67-4307-b60e-faed0331d391","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"dc834c3f-bd60-4b3c-bfb4-c1859caf69ae","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"183528c4-6103-444b-8eff-b08b844a9431","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"9f60ccb6-a57f-47bd-9d44-7596d875d8ff","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"cb05ceb3-fa30-4a9e-9589-863e1338a0fb","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"af5bf544-2fb6-4683-b298-6e5897a4d1e7","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"21ab634b-5936-4ad2-8bbe-719bf22d6f71","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"62648ba4-095e-41de-9430-961daed0f0ba","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"}]
/// credit_type : [{"created_date":"2024-01-18","transfer_id":"d1a16222-76a3-4c67-aaeb-3b533423cc3f","transfer_type":"Credit","order__order_number":null,"amount":"20.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"2b3bf22b-b859-48ce-9da4-c4de6656356d","transfer_type":"Credit","order__order_number":null,"amount":"8.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"2855efdb-bc20-4d87-8444-287b54c84eea","transfer_type":"Credit","order__order_number":null,"amount":"8.0","message":"Added to wallet"},{"created_date":"2024-01-12","transfer_id":"120a3656-3497-4af0-b290-4d366ba7b011","transfer_type":"Credit","order__order_number":null,"amount":"12.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"9553a3a6-4d67-4307-b60e-faed0331d391","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"dc834c3f-bd60-4b3c-bfb4-c1859caf69ae","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"183528c4-6103-444b-8eff-b08b844a9431","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"9f60ccb6-a57f-47bd-9d44-7596d875d8ff","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"cb05ceb3-fa30-4a9e-9589-863e1338a0fb","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"af5bf544-2fb6-4683-b298-6e5897a4d1e7","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"21ab634b-5936-4ad2-8bbe-719bf22d6f71","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"},{"created_date":"2024-01-05","transfer_id":"62648ba4-095e-41de-9430-961daed0f0ba","transfer_type":"Credit","order__order_number":null,"amount":"146.0","message":"Added to wallet"}]
/// debit_details : [{"created_date":"2024-01-18","transfer_id":"bbdd5813-bacd-416b-a003-e0da93fcc944","transfer_type":"Debit","order__order_number":null,"amount":"0","message":"Used from wallet"}]

TransactionHistoryData dataFromJson(String str) => TransactionHistoryData.fromJson(json.decode(str));
String dataToJson(TransactionHistoryData data) => json.encode(data.toJson());
class TransactionHistoryData {
  TransactionHistoryData({
      this.all, 
      this.creditType, 
      this.debitDetails,});

  TransactionHistoryData.fromJson(dynamic json) {
    if (json['all'] != null) {
      all = [];
      json['all'].forEach((v) {
        all?.add(All.fromJson(v));
      });
    }
    if (json['credit_type'] != null) {
      creditType = [];
      json['credit_type'].forEach((v) {
        creditType?.add(CreditType.fromJson(v));
      });
    }
    if (json['debit_details'] != null) {
      debitDetails = [];
      json['debit_details'].forEach((v) {
        debitDetails?.add(DebitDetails.fromJson(v));
      });
    }
  }
  List<All>? all;
  List<CreditType>? creditType;
  List<DebitDetails>? debitDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (all != null) {
      map['all'] = all?.map((v) => v.toJson()).toList();
    }
    if (creditType != null) {
      map['credit_type'] = creditType?.map((v) => v.toJson()).toList();
    }
    if (debitDetails != null) {
      map['debit_details'] = debitDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// created_date : "2024-01-18"
/// transfer_id : "bbdd5813-bacd-416b-a003-e0da93fcc944"
/// transfer_type : "Debit"
/// order__order_number : null
/// amount : "0"
/// message : "Used from wallet"

DebitDetails debitDetailsFromJson(String str) => DebitDetails.fromJson(json.decode(str));
String debitDetailsToJson(DebitDetails data) => json.encode(data.toJson());
class DebitDetails {
  DebitDetails({
      this.createdDate, 
      this.transferId, 
      this.transferType, 
      this.orderOrderNumber, 
      this.amount, 
      this.message,});

  DebitDetails.fromJson(dynamic json) {
    createdDate = json['created_date'];
    transferId = json['transfer_id'];
    transferType = json['transfer_type'];
    orderOrderNumber = json['order__order_number'];
    amount = json['amount'];
    message = json['message'];
  }
  String? createdDate;
  String? transferId;
  String? transferType;
  dynamic orderOrderNumber;
  String? amount;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created_date'] = createdDate;
    map['transfer_id'] = transferId;
    map['transfer_type'] = transferType;
    map['order__order_number'] = orderOrderNumber;
    map['amount'] = amount;
    map['message'] = message;
    return map;
  }

}

/// created_date : "2024-01-18"
/// transfer_id : "d1a16222-76a3-4c67-aaeb-3b533423cc3f"
/// transfer_type : "Credit"
/// order__order_number : null
/// amount : "20.0"
/// message : "Added to wallet"

CreditType creditTypeFromJson(String str) => CreditType.fromJson(json.decode(str));
String creditTypeToJson(CreditType data) => json.encode(data.toJson());
class CreditType {
  CreditType({
      this.createdDate, 
      this.transferId, 
      this.transferType, 
      this.orderOrderNumber, 
      this.amount, 
      this.message,});

  CreditType.fromJson(dynamic json) {
    createdDate = json['created_date'];
    transferId = json['transfer_id'];
    transferType = json['transfer_type'];
    orderOrderNumber = json['order__order_number'];
    amount = json['amount'];
    message = json['message'];
  }
  String? createdDate;
  String? transferId;
  String? transferType;
  dynamic orderOrderNumber;
  String? amount;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created_date'] = createdDate;
    map['transfer_id'] = transferId;
    map['transfer_type'] = transferType;
    map['order__order_number'] = orderOrderNumber;
    map['amount'] = amount;
    map['message'] = message;
    return map;
  }

}

/// created_date : "2024-01-18"
/// transfer_id : "d1a16222-76a3-4c67-aaeb-3b533423cc3f"
/// transfer_type : "Credit"
/// order__order_number : null
/// amount : "20.0"
/// message : "Added to wallet"

All allFromJson(String str) => All.fromJson(json.decode(str));
String allToJson(All data) => json.encode(data.toJson());
class All {
  All({
      this.createdDate, 
      this.transferId, 
      this.transferType, 
      this.orderOrderNumber, 
      this.amount, 
      this.message,});

  All.fromJson(dynamic json) {
    createdDate = json['created_date'];
    transferId = json['transfer_id'];
    transferType = json['transfer_type'];
    orderOrderNumber = json['order__order_number'];
    amount = json['amount'];
    message = json['message'];
  }
  String? createdDate;
  String? transferId;
  String? transferType;
  dynamic orderOrderNumber;
  String? amount;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['created_date'] = createdDate;
    map['transfer_id'] = transferId;
    map['transfer_type'] = transferType;
    map['order__order_number'] = orderOrderNumber;
    map['amount'] = amount;
    map['message'] = message;
    return map;
  }

}