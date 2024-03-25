import 'dart:convert';

class CustomerCategoryModel {
  bool status;
  List<CategoryList> data;
  String message;

  CustomerCategoryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  CustomerCategoryModel copyWith({
    bool? status,
    List<CategoryList>? data,
    String? message,
  }) =>
      CustomerCategoryModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory CustomerCategoryModel.fromRawJson(String str) => CustomerCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerCategoryModel.fromJson(Map<String, dynamic> json) => CustomerCategoryModel(
    status: json["status"],
    data: List<CategoryList>.from(json["data"].map((x) => CategoryList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class CategoryList {
  String categoryId;
  String categoryName;
  ServiceMaster serviceMaster;

  CategoryList({
    required this.categoryId,
    required this.categoryName,
    required this.serviceMaster,
  });

  CategoryList copyWith({
    String? categoryId,
    String? categoryName,
    ServiceMaster? serviceMaster,
  }) =>
      CategoryList(
        categoryId: categoryId ?? this.categoryId,
        categoryName: categoryName ?? this.categoryName,
        serviceMaster: serviceMaster ?? this.serviceMaster,
      );

  factory CategoryList.fromRawJson(String str) => CategoryList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryList.fromJson(Map<String, dynamic> json) => CategoryList(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    serviceMaster: ServiceMaster.fromJson(json["service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "service_master": serviceMaster.toJson(),
  };
}

class ServiceMaster {
  String categoryImage;

  ServiceMaster({
    required this.categoryImage,
  });

  ServiceMaster copyWith({
    String? categoryImage,
  }) =>
      ServiceMaster(
        categoryImage: categoryImage ?? this.categoryImage,
      );

  factory ServiceMaster.fromRawJson(String str) => ServiceMaster.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_image": categoryImage,
  };
}
