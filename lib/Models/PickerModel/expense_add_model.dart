import 'dart:convert';

class ExpenseAddModel {
  bool status;
  Data data;
  String message;

  ExpenseAddModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ExpenseAddModel copyWith({
    bool? status,
    Data? data,
    String? message,
  }) =>
      ExpenseAddModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ExpenseAddModel.fromRawJson(String str) => ExpenseAddModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExpenseAddModel.fromJson(Map<String, dynamic> json) => ExpenseAddModel(
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
  String expenseType;
  DateTime expenseDate;
  String amount;
  String remarks;
  String staff;

  Data({
    required this.createdBy,
    required this.expenseType,
    required this.expenseDate,
    required this.amount,
    required this.remarks,
    required this.staff,
  });

  Data copyWith({
    String? createdBy,
    String? expenseType,
    DateTime? expenseDate,
    String? amount,
    String? remarks,
    String? staff,
  }) =>
      Data(
        createdBy: createdBy ?? this.createdBy,
        expenseType: expenseType ?? this.expenseType,
        expenseDate: expenseDate ?? this.expenseDate,
        amount: amount ?? this.amount,
        remarks: remarks ?? this.remarks,
        staff: staff ?? this.staff,
      );

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    createdBy: json["created_by"],
    expenseType: json["expense_type"],
    expenseDate: DateTime.parse(json["expense_date"]),
    amount: json["Amount"],
    remarks: json["Remarks"],
    staff: json["staff"],
  );

  Map<String, dynamic> toJson() => {
    "created_by": createdBy,
    "expense_type": expenseType,
    "expense_date": "${expenseDate.year.toString().padLeft(4, '0')}-${expenseDate.month.toString().padLeft(2, '0')}-${expenseDate.day.toString().padLeft(2, '0')}",
    "Amount": amount,
    "Remarks": remarks,
    "staff": staff,
  };
}
