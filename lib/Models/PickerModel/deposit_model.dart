import 'dart:convert';

class DepositModel {
  bool status;
  Data data;
  String message;

  DepositModel({
    required this.status,
    required this.data,
    required this.message,
  });

  DepositModel copyWith({
    bool? status,
    Data? data,
    String? message,
  }) =>
      DepositModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory DepositModel.fromRawJson(String str) => DepositModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepositModel.fromJson(Map<String, dynamic> json) => DepositModel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  String createdBy;
  DateTime createdDate;
  String totalAmount;
  String excess;
  String short;
  String staff;

  Data({
    required this.createdBy,
    required this.createdDate,
    required this.totalAmount,
    required this.excess,
    required this.short,
    required this.staff,
  });

  Data copyWith({
    String? createdBy,
    DateTime? createdDate,
    String? totalAmount,
    String? excess,
    String? short,
    String? staff,
  }) =>
      Data(
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        totalAmount: totalAmount ?? this.totalAmount,
        excess: excess ?? this.excess,
        short: short ?? this.short,
        staff: staff ?? this.staff,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    totalAmount: json["total_amount"],
    excess: json["excess"],
    short: json["short"],
    staff: json["staff"],
  );

  Map<String, dynamic> toJson() => {
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "total_amount": totalAmount,
    "excess": excess,
    "short": short,
    "staff": staff,
  };
}
