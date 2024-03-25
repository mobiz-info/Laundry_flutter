// To parse this JSON data, do
//
//     final orderItemsModel = orderItemsModelFromJson(jsonString);

import 'dart:convert';

OrderItemsModel orderItemsModelFromJson(String str) => OrderItemsModel.fromJson(json.decode(str));

String orderItemsModelToJson(OrderItemsModel data) => json.encode(data.toJson());

class OrderItemsModel {
  final bool? status;
  final List<ItemsList>? data;
  final String? message;

  OrderItemsModel({
    this.status,
    this.data,
    this.message,
  });

  factory OrderItemsModel.fromJson(Map<String, dynamic> json) => OrderItemsModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ItemsList>.from(json["data"]!.map((x) => ItemsList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class ItemsList {
  final String? priceListId;
  final String? amount;
  final OrderItemServices? itemServices;

  ItemsList({
    this.priceListId,
    this.amount,
    this.itemServices,
  });

  factory ItemsList.fromJson(Map<String, dynamic> json) => ItemsList(
    priceListId: json["price_list_id"],
    amount: json["amount"],
    itemServices: json["item_services"] == null ? null : OrderItemServices.fromJson(json["item_services"]),
  );

  Map<String, dynamic> toJson() => {
    "price_list_id": priceListId,
    "amount": amount,
    "item_services": itemServices?.toJson(),
  };
}

class OrderItemServices {
  final String? itemSerId;
  final Item? item;
  final Category? category;
  final SubCategory? subCategory;

  OrderItemServices({
    this.itemSerId,
    this.item,
    this.category,
    this.subCategory,
  });

  factory OrderItemServices.fromJson(Map<String, dynamic> json) => OrderItemServices(
    itemSerId: json["item_ser_id"],
    item: json["item"] == null ? null : Item.fromJson(json["item"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subCategory: json["sub_category"] == null ? null : SubCategory.fromJson(json["sub_category"]),
  );

  Map<String, dynamic> toJson() => {
    "item_ser_id": itemSerId,
    "item": item?.toJson(),
    "category": category?.toJson(),
    "sub_category": subCategory?.toJson(),
  };
}

class Category {
  final String? categoryId;
  final ServiceMaster? serviceMaster;

  Category({
    this.categoryId,
    this.serviceMaster,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
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

class Item {
  final String? itemId;
  final String? itemName;
  final String? itemImage;

  Item({
    this.itemId,
    this.itemName,
    this.itemImage,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemId: json["item_id"],
    itemName: json["item_name"],
    itemImage: json["item_image"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "item_image": itemImage,
  };
}

class SubCategory {
  final String? subCatId;
  final SubServiceMaster? subServiceMaster;

  SubCategory({
    this.subCatId,
    this.subServiceMaster,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    subCatId: json["sub_cat_id"],
    subServiceMaster: json["sub_service_master"] == null ? null : SubServiceMaster.fromJson(json["sub_service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_service_master": subServiceMaster?.toJson(),
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
