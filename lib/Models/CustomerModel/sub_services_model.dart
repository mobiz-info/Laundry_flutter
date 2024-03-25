// To parse this JSON data, do
//
//     final subServicesModel = subServicesModelFromJson(jsonString);

import 'dart:convert';

SubServicesModel subServicesModelFromJson(String str) => SubServicesModel.fromJson(json.decode(str));

String subServicesModelToJson(SubServicesModel data) => json.encode(data.toJson());

class SubServicesModel {
  final bool? status;
  final List<SubServiceList>? data;
  final String? message;

  SubServicesModel({
    this.status,
    this.data,
    this.message,
  });

  factory SubServicesModel.fromJson(Map<String, dynamic> json) => SubServicesModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<SubServiceList>.from(json["data"]!.map((x) => SubServiceList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class SubServiceList {
  final String? subCatId;
  final SubServiceMaster? subServiceMaster;
  final BranchMainService? branchMainService;

  SubServiceList({
    this.subCatId,
    this.subServiceMaster,
    this.branchMainService,
  });

  factory SubServiceList.fromJson(Map<String, dynamic> json) => SubServiceList(
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
