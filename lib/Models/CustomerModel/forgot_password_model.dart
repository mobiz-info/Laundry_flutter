import 'dart:convert';
/// message : "OTP sent successfully"
/// otp : "4572"

ForgotPasswordModel forgotPasswordModelFromJson(String str) => ForgotPasswordModel.fromJson(json.decode(str));
String forgotPasswordModelToJson(ForgotPasswordModel data) => json.encode(data.toJson());
class ForgotPasswordModel {
  ForgotPasswordModel({
      this.message,
      this.otp,});

  ForgotPasswordModel.fromJson(dynamic json) {
    message = json['message'];
    otp = json['otp'];
  }
  String? message;
  String? otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['otp'] = otp;
    return map;
  }

}