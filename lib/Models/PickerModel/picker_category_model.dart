import 'dart:convert';

class PickerCategoryModel {
    bool status;
    List<PickerCategList> data;
    String message;

    PickerCategoryModel({
        required this.status,
        required this.data,
        required this.message,
    });

    PickerCategoryModel copyWith({
        bool? status,
        List<PickerCategList>? data,
        String? message,
    }) =>
        PickerCategoryModel(
            status: status ?? this.status,
            data: data ?? this.data,
            message: message ?? this.message,
        );

    factory PickerCategoryModel.fromRawJson(String str) => PickerCategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PickerCategoryModel.fromJson(Map<String, dynamic> json) => PickerCategoryModel(
        status: json["status"],
        data: List<PickerCategList>.from(json["data"].map((x) => PickerCategList.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class PickerCategList {
    String categoryId;
    ServiceMaster serviceMaster;

    PickerCategList({
        required this.categoryId,
        required this.serviceMaster,
    });

    PickerCategList copyWith({
        String? categoryId,
        ServiceMaster? serviceMaster,
    }) =>
        PickerCategList(
            categoryId: categoryId ?? this.categoryId,
            serviceMaster: serviceMaster ?? this.serviceMaster,
        );

    factory PickerCategList.fromRawJson(String str) => PickerCategList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PickerCategList.fromJson(Map<String, dynamic> json) => PickerCategList(
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
