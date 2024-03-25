import 'dart:convert';

class AuthModel {
  bool status;
  Data data;
  String message;

  AuthModel({
    required this.status,
    required this.data,
    required this.message,
  });

  factory AuthModel.fromRawJson(String str) {
    final jsonData = json.decode(str);
    return AuthModel.fromJson(jsonData);
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: json["status"] ?? false,
      data: Data.fromJson(json["data"] ?? {}),
      message: json["message"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  int id;
  String username;
  String userType;
  String tokEn;

  Data({
    required this.id,
    required this.username,
    required this.userType,
    required this.tokEn,
  });

  factory Data.fromRawJson(String str) {
    final jsonData = json.decode(str);
    return Data.fromJson(jsonData);
  }

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? 0,
      username: json["username"] ?? "",
      userType: json["user_type"] ?? "",
      tokEn: json["tok_en"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "user_type": userType,
    "tok_en": tokEn,
  };
}

