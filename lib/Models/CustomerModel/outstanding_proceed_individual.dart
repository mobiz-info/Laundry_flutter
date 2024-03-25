import 'dart:convert';
/// status : true
/// message : "payment done successfully"

OutstandingProceedIndividual outstandingProceedIndividualFromJson(String str) => OutstandingProceedIndividual.fromJson(json.decode(str));
String outstandingProceedIndividualToJson(OutstandingProceedIndividual data) => json.encode(data.toJson());
class OutstandingProceedIndividual {
  OutstandingProceedIndividual({
      this.status, 
      this.message,});

  OutstandingProceedIndividual.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  bool? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}