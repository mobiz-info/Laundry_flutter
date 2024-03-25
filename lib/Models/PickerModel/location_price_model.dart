import 'dart:convert';

class LocationPriceGroupModel {
  bool status;
  LpData data;
  String message;

  LocationPriceGroupModel({
    required this.status,
    required this.data,
    required this.message,
  });

  LocationPriceGroupModel copyWith({
    bool? status,
    LpData? data,
    String? message,
  }) =>
      LocationPriceGroupModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory LocationPriceGroupModel.fromRawJson(String str) => LocationPriceGroupModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationPriceGroupModel.fromJson(Map<String, dynamic> json) => LocationPriceGroupModel(
    status: json["status"],
    data: LpData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class LpData {
  CustomerTypeList customerTypeList;
  List<PriceGroupList> priceGroupList;

  LpData({
    required this.customerTypeList,
    required this.priceGroupList,
  });

  LpData copyWith({
    CustomerTypeList? customerTypeList,
    List<PriceGroupList>? priceGroupList,
  }) =>
      LpData(
        customerTypeList: customerTypeList ?? this.customerTypeList,
        priceGroupList: priceGroupList ?? this.priceGroupList,
      );

  factory LpData.fromRawJson(String str) => LpData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LpData.fromJson(Map<String, dynamic> json) => LpData(
    customerTypeList: CustomerTypeList.fromJson(json["customer_type_list"]),
    priceGroupList: List<PriceGroupList>.from(json["price_group_list"].map((x) => PriceGroupList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customer_type_list": customerTypeList.toJson(),
    "price_group_list": List<dynamic>.from(priceGroupList.map((x) => x.toJson())),
  };
}

class CustomerTypeList {
  String home;
  String coOperate;

  CustomerTypeList({
    required this.home,
    required this.coOperate,
  });

  CustomerTypeList copyWith({
    String? home,
    String? coOperate,
  }) =>
      CustomerTypeList(
        home: home ?? this.home,
        coOperate: coOperate ?? this.coOperate,
      );

  factory CustomerTypeList.fromRawJson(String str) => CustomerTypeList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerTypeList.fromJson(Map<String, dynamic> json) => CustomerTypeList(
    home: json["Home"],
    coOperate: json["Co-operate"],
  );

  Map<String, dynamic> toJson() => {
    "Home": home,
    "Co-operate": coOperate,
  };
}

class PriceGroupList {
  String priceGroupId;
  dynamic createdBy;
  DateTime createdAt;
  String name;

  PriceGroupList({
    required this.priceGroupId,
    required this.createdBy,
    required this.createdAt,
    required this.name,
  });

  PriceGroupList copyWith({
    String? priceGroupId,
    dynamic createdBy,
    DateTime? createdAt,
    String? name,
  }) =>
      PriceGroupList(
        priceGroupId: priceGroupId ?? this.priceGroupId,
        createdBy: createdBy ?? this.createdBy,
        createdAt: createdAt ?? this.createdAt,
        name: name ?? this.name,
      );

  factory PriceGroupList.fromRawJson(String str) => PriceGroupList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PriceGroupList.fromJson(Map<String, dynamic> json) => PriceGroupList(
    priceGroupId: json["price_group_id"],
    createdBy: json["created_by"],
    createdAt: DateTime.parse(json["created_at"]),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "price_group_id": priceGroupId,
    "created_by": createdBy,
    "created_at": createdAt.toIso8601String(),
    "name": name,
  };
}
