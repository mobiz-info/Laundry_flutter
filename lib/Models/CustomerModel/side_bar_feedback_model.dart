// To parse this JSON data, do
//
//     final sideBarFeedbackModel = sideBarFeedbackModelFromJson(jsonString);

import 'dart:convert';

SideBarFeedbackModel sideBarFeedbackModelFromJson(String str) => SideBarFeedbackModel.fromJson(json.decode(str));

String sideBarFeedbackModelToJson(SideBarFeedbackModel data) => json.encode(data.toJson());

class SideBarFeedbackModel {
  final bool? status;
  final SideBarFeedbackData? data;
  final String? message;

  SideBarFeedbackModel({
    this.status,
    this.data,
    this.message,
  });

  factory SideBarFeedbackModel.fromJson(Map<String, dynamic> json) => SideBarFeedbackModel(
    status: json["status"],
    data: json["data"] == null ? null : SideBarFeedbackData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class SideBarFeedbackData {
  final String? feedbackId;
  final DateTime? createdDate;
  final String? feedback;
  final String? review;
  final String? customer;

  SideBarFeedbackData({
    this.feedbackId,
    this.createdDate,
    this.feedback,
    this.review,
    this.customer,
  });

  factory SideBarFeedbackData.fromJson(Map<String, dynamic> json) => SideBarFeedbackData(
    feedbackId: json["feedback_id"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    feedback: json["feedback"],
    review: json["review"],
    customer: json["Customer"],
  );

  Map<String, dynamic> toJson() => {
    "feedback_id": feedbackId,
    "created_date": createdDate?.toIso8601String(),
    "feedback": feedback,
    "review": review,
    "Customer": customer,
  };
}
