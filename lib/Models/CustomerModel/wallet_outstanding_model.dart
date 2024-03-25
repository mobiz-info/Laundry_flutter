import 'dart:convert';

class CustomerBalanceModel {
  bool stats;
  CData data;
  String message;

  CustomerBalanceModel({
    required this.stats,
    required this.data,
    required this.message,
  });

  CustomerBalanceModel copyWith({
    bool? stats,
    CData? data,
    String? message,
  }) =>
      CustomerBalanceModel(
        stats: stats ?? this.stats,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory CustomerBalanceModel.fromRawJson(String str) => CustomerBalanceModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerBalanceModel.fromJson(Map<String, dynamic> json) => CustomerBalanceModel(
    stats: json["stats"],
    data: CData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "stats": stats,
    "data": data.toJson(),
    "message": message,
  };
}

class CData {
  String walletBalance;
  num outstanding;
  String name;

  CData({
    required this.walletBalance,
    required this.outstanding,
    required this.name
  });

  CData copyWith({
    String? walletBalance,
    num? outstanding,
    String? name,
  }) =>
      CData(
        walletBalance: walletBalance ?? this.walletBalance,
        outstanding: outstanding ?? this.outstanding,
        name: name ?? this.name,
      );

  factory CData.fromRawJson(String str) => CData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CData.fromJson(Map<String, dynamic> json) => CData(
    walletBalance: json["wallet_balance"],
    outstanding: json["outstanding"],
    name: json["name"]
  );

  Map<String, dynamic> toJson() => {
    "wallet_balance": walletBalance,
    "outstanding": outstanding,
    "name": name
  };
}
