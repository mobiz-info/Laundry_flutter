// To parse this JSON data, do
//
//     final deviceTokenModel = deviceTokenModelFromJson(jsonString);

import 'dart:convert';

DeviceTokenModel deviceTokenModelFromJson(String str) => DeviceTokenModel.fromJson(json.decode(str));

String deviceTokenModelToJson(DeviceTokenModel data) => json.encode(data.toJson());

class DeviceTokenModel {
  final bool? status;
  final List<TokenData>? data;
  final String? message;

  DeviceTokenModel({
    this.status,
    this.data,
    this.message,
  });

  factory DeviceTokenModel.fromJson(Map<String, dynamic> json) => DeviceTokenModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<TokenData>.from(json["data"]!.map((x) => TokenData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class TokenData {
  final String? userId;
  final String? deviceToken;

  TokenData({
    this.userId,
    this.deviceToken,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
    userId: json["user_id"],
    deviceToken: json["device_token"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "device_token": deviceToken,
  };
}
