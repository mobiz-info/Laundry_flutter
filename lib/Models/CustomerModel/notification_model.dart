// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  final bool? status;
  final List<NotificationData>? data;
  final String? message;

  NotificationModel({
    this.status,
    this.data,
    this.message,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<NotificationData>.from(json["data"]!.map((x) => NotificationData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class NotificationData {
  final CreatedOn? createdOn;
  final String? noticicationId;
  final String? title;
  final String? body;
  final int? user;

  NotificationData({
    this.createdOn,
    this.noticicationId,
    this.title,
    this.body,
    this.user,
  });

  factory NotificationData.fromJson(Map<String, dynamic> json) => NotificationData(
    createdOn: json["created_on"] == null ? null : CreatedOn.fromJson(json["created_on"]),
    noticicationId: json["noticication_id"],
    title: json["title"],
    body: json["body"],
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "created_on": createdOn?.toJson(),
    "noticication_id": noticicationId,
    "title": title,
    "body": body,
    "user": user,
  };
}

class CreatedOn {
  final DateTime? date;
  final String? time;
  final String? day;

  CreatedOn({
    this.date,
    this.time,
    this.day,
  });

  factory CreatedOn.fromJson(Map<String, dynamic> json) => CreatedOn(
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    time: json["time"],
    day: json["day"],
  );

  Map<String, dynamic> toJson() => {
    "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
    "time": time,
    "day": day,
  };
}
