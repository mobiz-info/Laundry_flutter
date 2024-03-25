import 'dart:convert';

class PickerSubCategoryModel {
  bool status;
  List<PickerSubCategList> data;
  String message;

  PickerSubCategoryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerSubCategoryModel copyWith({
    bool? status,
    List<PickerSubCategList>? data,
    String? message,
  }) =>
      PickerSubCategoryModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerSubCategoryModel.fromRawJson(String str) => PickerSubCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerSubCategoryModel.fromJson(Map<String, dynamic> json) => PickerSubCategoryModel(
    status: json["status"],
    data: List<PickerSubCategList>.from(json["data"].map((x) => PickerSubCategList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PickerSubCategList {
  String subCatId;
  SubServiceMaster subServiceMaster;
  BranchMainService branchMainService;

  PickerSubCategList({
    required this.subCatId,
    required this.subServiceMaster,
    required this.branchMainService,
  });

  PickerSubCategList copyWith({
    String? subCatId,
    SubServiceMaster? subServiceMaster,
    BranchMainService? branchMainService,
  }) =>
      PickerSubCategList(
        subCatId: subCatId ?? this.subCatId,
        subServiceMaster: subServiceMaster ?? this.subServiceMaster,
        branchMainService: branchMainService ?? this.branchMainService,
      );

  factory PickerSubCategList.fromRawJson(String str) => PickerSubCategList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerSubCategList.fromJson(Map<String, dynamic> json) => PickerSubCategList(
    subCatId: json["sub_cat_id"],
    subServiceMaster: SubServiceMaster.fromJson(json["sub_service_master"]),
    branchMainService: BranchMainService.fromJson(json["branch_main_service"]),
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_service_master": subServiceMaster.toJson(),
    "branch_main_service": branchMainService.toJson(),
  };
}

class BranchMainService {
  String categoryId;
  ServiceMaster serviceMaster;

  BranchMainService({
    required this.categoryId,
    required this.serviceMaster,
  });

  BranchMainService copyWith({
    String? categoryId,
    ServiceMaster? serviceMaster,
  }) =>
      BranchMainService(
        categoryId: categoryId ?? this.categoryId,
        serviceMaster: serviceMaster ?? this.serviceMaster,
      );

  factory BranchMainService.fromRawJson(String str) => BranchMainService.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BranchMainService.fromJson(Map<String, dynamic> json) => BranchMainService(
    categoryId: json["category_id"],
    serviceMaster: ServiceMaster.fromJson(json["service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "service_master": serviceMaster.toJson(),
  };
}

class ServiceMaster {
  String categoryName;
  String categoryImage;

  ServiceMaster({
    required this.categoryName,
    required this.categoryImage,
  });

  ServiceMaster copyWith({
    String? categoryName,
    String? categoryImage,
  }) =>
      ServiceMaster(
        categoryName: categoryName ?? this.categoryName,
        categoryImage: categoryImage ?? this.categoryImage,
      );

  factory ServiceMaster.fromRawJson(String str) => ServiceMaster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  String subCatName;
  String subCatImage;

  SubServiceMaster({
    required this.subCatName,
    required this.subCatImage,
  });

  SubServiceMaster copyWith({
    String? subCatName,
    String? subCatImage,
  }) =>
      SubServiceMaster(
        subCatName: subCatName ?? this.subCatName,
        subCatImage: subCatImage ?? this.subCatImage,
      );

  factory SubServiceMaster.fromRawJson(String str) => SubServiceMaster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
    subCatName: json["sub_cat_name"],
    subCatImage: json["sub_cat_image"],
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_name": subCatName,
    "sub_cat_image": subCatImage,
  };
}
