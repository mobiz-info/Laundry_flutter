// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

import 'dart:convert';

ServicesModel servicesModelFromJson(String str) => ServicesModel.fromJson(json.decode(str));

String servicesModelToJson(ServicesModel data) => json.encode(data.toJson());

class ServicesModel {
  final bool? status;
  final List<ServiceList>? data;
  final String? message;

  ServicesModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ServiceList>.from(json["data"]!.map((x) => ServiceList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class ServiceList {
  final String? categoryId;
  final ServiceMaster? serviceMaster;

  ServiceList({
    this.categoryId,
    this.serviceMaster,
  });

  factory ServiceList.fromJson(Map<String, dynamic> json) => ServiceList(
    categoryId: json["category_id"],
    serviceMaster: json["service_master"] == null ? null : ServiceMaster.fromJson(json["service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "service_master": serviceMaster?.toJson(),
  };
}

class ServiceMaster {
  final String? categoryName;
  final String? categoryImage;

  ServiceMaster({
    this.categoryName,
    this.categoryImage,
  });

  factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}
