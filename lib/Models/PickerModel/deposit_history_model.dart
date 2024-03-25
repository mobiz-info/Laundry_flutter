import 'dart:convert';

class PickerDepositHistoryModel {
  bool status;
  List<DepoHist> data;
  String message;

  PickerDepositHistoryModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerDepositHistoryModel copyWith({
    bool? status,
    List<DepoHist>? data,
    String? message,
  }) =>
      PickerDepositHistoryModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerDepositHistoryModel.fromRawJson(String str) => PickerDepositHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerDepositHistoryModel.fromJson(Map<String, dynamic> json) => PickerDepositHistoryModel(
    status: json["status"],
    data: List<DepoHist>.from(json["data"].map((x) => DepoHist.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class DepoHist {
  String pickerDepositeId;
  String createdBy;
  DateTime createdDate;
  String totalAmount;
  String excess;
  String short;
  DateTime depositeDate;
  String staff;

  DepoHist({
    required this.pickerDepositeId,
    required this.createdBy,
    required this.createdDate,
    required this.totalAmount,
    required this.excess,
    required this.short,
    required this.depositeDate,
    required this.staff,
  });

  DepoHist copyWith({
    String? pickerDepositeId,
    String? createdBy,
    DateTime? createdDate,
    String? totalAmount,
    String? excess,
    String? short,
    DateTime? depositeDate,
    String? staff,
  }) =>
      DepoHist(
        pickerDepositeId: pickerDepositeId ?? this.pickerDepositeId,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        totalAmount: totalAmount ?? this.totalAmount,
        excess: excess ?? this.excess,
        short: short ?? this.short,
        depositeDate: depositeDate ?? this.depositeDate,
        staff: staff ?? this.staff,
      );

  factory DepoHist.fromRawJson(String str) => DepoHist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DepoHist.fromJson(Map<String, dynamic> json) => DepoHist(
    pickerDepositeId: json["picker_deposite_id"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    totalAmount: json["total_amount"],
    excess: json["excess"],
    short: json["short"],
    depositeDate: DateTime.parse(json["deposite_date"]),
    staff: json["staff"],
  );

  Map<String, dynamic> toJson() => {
    "picker_deposite_id": pickerDepositeId,
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "total_amount": totalAmount,
    "excess": excess,
    "short": short,
    "deposite_date": "${depositeDate.year.toString().padLeft(4, '0')}-${depositeDate.month.toString().padLeft(2, '0')}-${depositeDate.day.toString().padLeft(2, '0')}",
    "staff": staff,
  };
}
