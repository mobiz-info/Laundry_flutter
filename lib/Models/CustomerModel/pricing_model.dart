// To parse this JSON data, do
//
//     final pricingModel = pricingModelFromJson(jsonString);

import 'dart:convert';

PricingModel pricingModelFromJson(String str) => PricingModel.fromJson(json.decode(str));

String pricingModelToJson(PricingModel data) => json.encode(data.toJson());

class PricingModel {
  final bool? status;
  final List<PricingData>? data;
  final String? message;

  PricingModel({
    this.status,
    this.data,
    this.message,
  });

  factory PricingModel.fromJson(Map<String, dynamic> json) => PricingModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<PricingData>.from(json["data"]!.map((x) => PricingData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class PricingData {
  final String? categoryId;
  final String? serviceMaster;
  final List<TarifCategory>? tarifCategory;

  PricingData({
    this.categoryId,
    this.serviceMaster,
    this.tarifCategory,
  });

  factory PricingData.fromJson(Map<String, dynamic> json) => PricingData(
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
