import 'dart:convert';

class ExpenseListModel {
  bool status;
  List<Datum> data;
  String message;

  ExpenseListModel({
    required this.status,
    required this.data,
    required this.message,
  });

  ExpenseListModel copyWith({
    bool? status,
    List<Datum>? data,
    String? message,
  }) =>
      ExpenseListModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory ExpenseListModel.fromRawJson(String str) => ExpenseListModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ExpenseListModel.fromJson(Map<String, dynamic> json) => ExpenseListModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  String createdBy;
  String expenseType;
  DateTime expenseDate;
  String amount;
  String remarks;
  String staff;

  Datum({
    required this.createdBy,
    required this.expenseType,
    required this.expenseDate,
    required this.amount,
    required this.remarks,
    required this.staff,
  });

  Datum copyWith({
    String? createdBy,
    String? expenseType,
    DateTime? expenseDate,
    String? amount,
    String? remarks,
    String? staff,
  }) =>
      Datum(
        createdBy: createdBy ?? this.createdBy,
        expenseType: expenseType ?? this.expenseType,
        expenseDate: expenseDate ?? this.expenseDate,
        amount: amount ?? this.amount,
        remarks: remarks ?? this.remarks,
        staff: staff ?? this.staff,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
