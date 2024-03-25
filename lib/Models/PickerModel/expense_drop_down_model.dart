import 'dart:convert';

class ExpenseDropDownModel {
  bool status;
  String data;
  String message;

  ExpenseDropDownModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ExpenseDropDownModel copyWith({
    bool? status,
    String? data,
    String? message,
  }) =>
      ExpenseDropDownModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ExpenseDropDownModel.fromRawJson(String str) => ExpenseDropDownModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExpenseDropDownModel.fromJson(Map<String, dynamic> json) => ExpenseDropDownModel(
    status: json["status"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data,
    "message": message,
  };
}
