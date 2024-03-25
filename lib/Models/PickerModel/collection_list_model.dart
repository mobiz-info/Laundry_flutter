import 'dart:convert';

class PickerCollectionListModel {
  bool status;
  List<dynamic> data;
  Totals totals;
  String message;

  PickerCollectionListModel({
    required this.status,
    required this.data,
    required this.totals,
    required this.message,
  });

  PickerCollectionListModel copyWith({
    bool? status,
    List<dynamic>? data,
    Totals? totals,
    String? message,
  }) =>
      PickerCollectionListModel(
        status: status ?? this.status,
        data: data ?? this.data,
        totals: totals ?? this.totals,
        message: message ?? this.message,
      );

  factory PickerCollectionListModel.fromRawJson(String str) => PickerCollectionListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerCollectionListModel.fromJson(Map<String, dynamic> json) => PickerCollectionListModel(
    status: json["status"],
    data: List<dynamic>.from(json["data"].map((x) => x)),
    totals: Totals.fromJson(json["totals"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x)),
    "totals": totals.toJson(),
    "message": message,
  };
}

class Totals {
  int totalAmount;
  int totalBalance;

  Totals({
    required this.totalAmount,
    required this.totalBalance,
  });

  Totals copyWith({
    int? totalAmount,
    int? totalBalance,
  }) =>
      Totals(
        totalAmount: totalAmount ?? this.totalAmount,
        totalBalance: totalBalance ?? this.totalBalance,
      );

  factory Totals.fromRawJson(String str) => Totals.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Totals.fromJson(Map<String, dynamic> json) => Totals(
    totalAmount: json["total_amount"],
    totalBalance: json["total_balance"],
  );

  Map<String, dynamic> toJson() => {
    "total_amount": totalAmount,
    "total_balance": totalBalance,
  };
}
