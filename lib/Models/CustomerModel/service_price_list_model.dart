// To parse this JSON data, do
//
//     final servicePriceListModel = servicePriceListModelFromJson(jsonString);

import 'dart:convert';

ServicePriceListModel servicePriceListModelFromJson(String str) => ServicePriceListModel.fromJson(json.decode(str));

String servicePriceListModelToJson(ServicePriceListModel data) => json.encode(data.toJson());

class ServicePriceListModel {
  final bool? status;
  final List<ServicePriceListData>? data;
  final String? message;

  ServicePriceListModel({
    this.status,
    this.data,
    this.message,
  });

  factory ServicePriceListModel.fromJson(Map<String, dynamic> json) => ServicePriceListModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<ServicePriceListData>.from(json["data"]!.map((x) => ServicePriceListData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class ServicePriceListData {
  final String? categoryId;
  final String? serviceMaster;
  final List<TarifCategory>? tarifCategory;

  ServicePriceListData({
    this.categoryId,
    this.serviceMaster,
    this.tarifCategory,
  });

  factory ServicePriceListData.fromJson(Map<String, dynamic> json) => ServicePriceListData(
    categoryId: json["category_id"],
    serviceMaster: json["service_master"],
    tarifCategory: json["tarif_category"] == null ? [] : List<TarifCategory>.from(json["tarif_category"]!.map((x) => TarifCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "service_master": serviceMaster,
    "tarif_category": tarifCategory == null ? [] : List<dynamic>.from(tarifCategory!.map((x) => x.toJson())),
  };
}

class TarifCategory {
  final String? item;
  final String? urgent;
  final String? express;
  final String? normal;

  TarifCategory({
    this.item,
    this.urgent,
    this.express,
    this.normal,
  });

  factory TarifCategory.fromJson(Map<String, dynamic> json) => TarifCategory(
    item: json["item"],
    urgent: json["urgent"],
    express: json["express"],
    normal: json["normal"],
  );

  Map<String, dynamic> toJson() => {
    "item": item,
    "urgent": urgent,
    "express": express,
    "normal": normal,
  };
}
