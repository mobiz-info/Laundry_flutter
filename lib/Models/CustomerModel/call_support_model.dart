import 'dart:convert';
/// status : true
/// data : [{"branch__Phone":"042884166"}]
/// message : "Successfully Passed Data!"

CallSupportModel callSupportModelFromJson(String str) => CallSupportModel.fromJson(json.decode(str));
String callSupportModelToJson(CallSupportModel data) => json.encode(data.toJson());
class CallSupportModel {
  CallSupportModel({
      this.status, 
      this.data, 
      this.message,});

  CallSupportModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(CallSupportData.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<CallSupportData>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

/// branch__Phone : "042884166"

CallSupportData dataFromJson(String str) => CallSupportData.fromJson(json.decode(str));
String dataToJson(CallSupportData data) => json.encode(data.toJson());
class CallSupportData {
  CallSupportData({
      this.branchPhone,});

  CallSupportData.fromJson(dynamic json) {
    branchPhone = json['branch__Phone'];
  }
  String? branchPhone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['branch__Phone'] = branchPhone;
    return map;
  }

}