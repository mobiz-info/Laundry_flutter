// To parse this JSON data, do
//
//     final orderStatusFeedBackModel = orderStatusFeedBackModelFromJson(jsonString);

import 'dart:convert';

OrderStatusFeedBackModel orderStatusFeedBackModelFromJson(String str) => OrderStatusFeedBackModel.fromJson(json.decode(str));

String orderStatusFeedBackModelToJson(OrderStatusFeedBackModel data) => json.encode(data.toJson());

class OrderStatusFeedBackModel {
  final bool? status;
  final ReviewData? data;
  final String? message;

  OrderStatusFeedBackModel({
    this.status,
    this.data,
    this.message,
  });

  factory OrderStatusFeedBackModel.fromJson(Map<String, dynamic> json) => OrderStatusFeedBackModel(
    status: json["status"],
    data: json["data"] == null ? null : ReviewData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class ReviewData {
  final String? feedbackId;
  final DateTime? createdDate;
  final String? feedback;
  final String? review;
  final String? orderId;

  ReviewData({
    this.feedbackId,
    this.createdDate,
    this.feedback,
    this.review,
    this.orderId,
  });

  factory ReviewData.fromJson(Map<String, dynamic> json) => ReviewData(
    feedbackId: json["feedback_id"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    feedback: json["feedback"],
    review: json["review"],
    orderId: json["order_id"],
  );

  Map<String, dynamic> toJson() => {
    "feedback_id": feedbackId,
    "created_date": createdDate?.toIso8601String(),
    "feedback": feedback,
    "review": review,
    "order_id": orderId,
  };
}
