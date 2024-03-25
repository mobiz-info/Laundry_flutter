// To parse this JSON data, do
//
//     final serviceCategoryModel = serviceCategoryModelFromJson(jsonString);

import 'dart:convert';

ServiceCategoryModel serviceCategoryModelFromJson(String str) => ServiceCategoryModel.fromJson(json.decode(str));

String serviceCategoryModelToJson(ServiceCategoryModel data) => json.encode(data.toJson());

class ServiceCategoryModel {
  final bool? status;
  final List<ServiceCategoryData>? data;
  final String? message;

  ServiceCategoryModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServiceCategoryModel.fromJson(Map<String, dynamic> json) => ServiceCategoryModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ServiceCategoryData>.from(json["data"]!.map((x) => ServiceCategoryData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class ServiceCategoryData {
  final String? categoryId;
  final ServiceMaster? serviceMaster;

  ServiceCategoryData({
    this.categoryId,
    this.serviceMaster,
  });

  factory ServiceCategoryData.fromJson(Map<String, dynamic> json) => ServiceCategoryData(
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
