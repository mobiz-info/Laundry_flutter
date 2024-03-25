import 'dart:convert';
/// status : true
/// data : {"message":"Paid Successfully"}

OutstandingPayModel outstandingPayModelFromJson(String str) => OutstandingPayModel.fromJson(json.decode(str));
String outstandingPayModelToJson(OutstandingPayModel data) => json.encode(data.toJson());
class OutstandingPayModel {
  OutstandingPayModel({
      this.status, 
      this.data,});

  OutstandingPayModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? OutstandingPayData.fromJson(json['data']) : null;
  }
  bool? status;
  OutstandingPayData? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// message : "Paid Successfully"

OutstandingPayData dataFromJson(String str) => OutstandingPayData.fromJson(json.decode(str));
String dataToJson(OutstandingPayData data) => json.encode(data.toJson());
class OutstandingPayData {
  OutstandingPayData({
      this.message,});

  OutstandingPayData.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}