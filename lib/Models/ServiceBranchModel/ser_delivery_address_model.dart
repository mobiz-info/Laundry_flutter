import 'dart:convert';

SerDeliveryAddressModel serDeliveryAddressModelFromJson(String str) => SerDeliveryAddressModel.fromJson(json.decode(str));

String serDeliveryAddressModelToJson(SerDeliveryAddressModel data) => json.encode(data.toJson());

class SerDeliveryAddressModel {
  final bool? status;
  final List<Map<String, String?>>? data;
  final String? message;

  SerDeliveryAddressModel({
    this.status,
    this.data,
    this.message,
  });

  factory SerDeliveryAddressModel.fromJson(Map<String, dynamic> json) => SerDeliveryAddressModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Map<String, String?>>.from(json["data"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    "message": message,
  };
}

