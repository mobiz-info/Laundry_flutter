import 'dart:convert';

class CustomersubCategoryModel {
    bool status;
    List<SubCatList> data;
    String message;

    CustomersubCategoryModel({
        required this.status,
        required this.data,
        required this.message,
    });

    CustomersubCategoryModel copyWith({
        bool? status,
        List<SubCatList>? data,
        String? message,
    }) => 
        CustomersubCategoryModel(
            status: status ?? this.status,
            data: data ?? this.data,
            message: message ?? this.message,
        );

    factory CustomersubCategoryModel.fromRawJson(String str) => CustomersubCategoryModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CustomersubCategoryModel.fromJson(Map<String, dynamic> json) => CustomersubCategoryModel(
        status: json["status"],
        data: List<SubCatList>.from(json["data"].map((x) => SubCatList.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class SubCatList {
    String subCatId;
    String subCatName;
    SubServiceMaster subServiceMaster;
    BranchMainService branchMainService;

    SubCatList({
        required this.subCatId,
        required this.subCatName,
        required this.subServiceMaster,
        required this.branchMainService,
    });

    SubCatList copyWith({
        String? subCatId,
        String? subCatName,
        SubServiceMaster? subServiceMaster,
        BranchMainService? branchMainService,
    }) => 
        SubCatList(
            subCatId: subCatId ?? this.subCatId,
            subCatName: subCatName ?? this.subCatName,
            subServiceMaster: subServiceMaster ?? this.subServiceMaster,
            branchMainService: branchMainService ?? this.branchMainService,
        );

    factory SubCatList.fromRawJson(String str) => SubCatList.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubCatList.fromJson(Map<String, dynamic> json) => SubCatList(
        subCatId: json["sub_cat_id"],
        subCatName: json["sub_cat_name"],
        subServiceMaster: SubServiceMaster.fromJson(json["sub_service_master"]),
        branchMainService: BranchMainService.fromJson(json["branch_main_service"]),
    );

    Map<String, dynamic> toJson() => {
        "sub_cat_id": subCatId,
        "sub_cat_name": subCatName,
        "sub_service_master": subServiceMaster.toJson(),
        "branch_main_service": branchMainService.toJson(),
    };
}

class BranchMainService {
    String categoryId;
    String categoryName;
    ServiceMaster serviceMaster;

    BranchMainService({
        required this.categoryId,
        required this.categoryName,
        required this.serviceMaster,
    });

    BranchMainService copyWith({
        String? categoryId,
        String? categoryName,
        ServiceMaster? serviceMaster,
    }) => 
        BranchMainService(
            categoryId: categoryId ?? this.categoryId,
            categoryName: categoryName ?? this.categoryName,
            serviceMaster: serviceMaster ?? this.serviceMaster,
        );

    factory BranchMainService.fromRawJson(String str) => BranchMainService.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory BranchMainService.fromJson(Map<String, dynamic> json) => BranchMainService(
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

class SubServiceMaster {
    String subCatImage;

    SubServiceMaster({
        required this.subCatImage,
    });

    SubServiceMaster copyWith({
        String? subCatImage,
    }) => 
        SubServiceMaster(
            subCatImage: subCatImage ?? this.subCatImage,
        );

    factory SubServiceMaster.fromRawJson(String str) => SubServiceMaster.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
        subCatImage: json["sub_cat_image"],
    );

    Map<String, dynamic> toJson() => {
        "sub_cat_image": subCatImage,
    };
}
