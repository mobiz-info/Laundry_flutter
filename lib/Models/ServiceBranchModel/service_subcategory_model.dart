// To parse this JSON data, do
//
//     final serviceSubCategoryModel = serviceSubCategoryModelFromJson(jsonString);

import 'dart:convert';

ServiceSubCategoryModel serviceSubCategoryModelFromJson(String str) => ServiceSubCategoryModel.fromJson(json.decode(str));

String serviceSubCategoryModelToJson(ServiceSubCategoryModel data) => json.encode(data.toJson());

class ServiceSubCategoryModel {
  final bool? status;
  final List<SubCategoryData>? data;
  final String? message;

  ServiceSubCategoryModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServiceSubCategoryModel.fromJson(Map<String, dynamic> json) => ServiceSubCategoryModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<SubCategoryData>.from(json["data"]!.map((x) => SubCategoryData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class SubCategoryData {
  final String? subCatId;
  final SubServiceMaster? subServiceMaster;
  final BranchMainService? branchMainService;

  SubCategoryData({
    this.subCatId,
    this.subServiceMaster,
    this.branchMainService,
  });

  factory SubCategoryData.fromJson(Map<String, dynamic> json) => SubCategoryData(
    subCatId: json["sub_cat_id"],
    subServiceMaster: json["sub_service_master"] == null ? null : SubServiceMaster.fromJson(json["sub_service_master"]),
    branchMainService: json["branch_main_service"] == null ? null : BranchMainService.fromJson(json["branch_main_service"]),
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_service_master": subServiceMaster?.toJson(),
    "branch_main_service": branchMainService?.toJson(),
  };
}

class BranchMainService {
  final String? categoryId;
  final ServiceMaster? serviceMaster;

  BranchMainService({
    this.categoryId,
    this.serviceMaster,
  });

  factory BranchMainService.fromJson(Map<String, dynamic> json) => BranchMainService(
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

class SubServiceMaster {
  final String? subCatName;
  final String? subCatImage;

  SubServiceMaster({
    this.subCatName,
    this.subCatImage,
  });

  factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
    subCatName: json["sub_cat_name"],
    subCatImage: json["sub_cat_image"],
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_name": subCatName,
    "sub_cat_image": subCatImage,
  };
}
