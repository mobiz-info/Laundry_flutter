// To parse this JSON data, do
//
//     final serPaymentMtdModel = serPaymentMtdModelFromJson(jsonString);

import 'dart:convert';

SerPaymentMtdModel serPaymentMtdModelFromJson(String str) => SerPaymentMtdModel.fromJson(json.decode(str));

String serPaymentMtdModelToJson(SerPaymentMtdModel data) => json.encode(data.toJson());

class SerPaymentMtdModel {
  final bool? status;
  final List<SerPaymentMtdData>? data;
  final String? message;

  SerPaymentMtdModel({
    this.status,
    this.data,
    this.message,
  });

  factory SerPaymentMtdModel.fromJson(Map<String, dynamic> json) => SerPaymentMtdModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<SerPaymentMtdData>.from(json["data"]!.map((x) => SerPaymentMtdData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class SerPaymentMtdData {
  final String? paymentMethod;

  SerPaymentMtdData({
    this.paymentMethod,
  });

  factory SerPaymentMtdData.fromJson(Map<String, dynamic> json) => SerPaymentMtdData(
    paymentMethod: json["payment_method"],
  );

  Map<String, dynamic> toJson() => {
    "payment_method": paymentMethod,
  };
}
