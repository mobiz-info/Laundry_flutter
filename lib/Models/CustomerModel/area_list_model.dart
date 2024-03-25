import 'dart:convert';
/// status : true
/// data : {"area_list":[{"area_id":"1b26cdc2-c3d6-4361-87ea-7b611551e82d","created_by":"mobiz","created_date":"2023-11-07T04:31:11.374904Z","name":"Al Nahda","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"263c1d1c-809e-439c-9236-a2f92931bf3e","created_by":"mobiz","created_date":"2023-11-06T16:57:45.461231Z","name":"Jumerirah","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"8403c320-f36c-4019-ae03-54c7b45a1c14","created_by":"mobiz","created_date":"2023-11-06T16:56:47.996780Z","name":"Jumeriah Village","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"5faa4ae5-67dd-42de-9e0e-dc4edc182e4a","created_by":"mobiz","created_date":"2023-11-06T16:56:01.564727Z","name":"Palm Jumeriah","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"6874f3fb-96be-4e16-b256-6ee5534b239d","created_by":"mobiz","created_date":"2023-11-06T16:55:46.759116Z","name":"IMPZ","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"0c77e8a3-ccc1-4986-88a2-0607f003cf08","created_by":"mobiz","created_date":"2023-11-06T16:55:39.230412Z","name":"Al Quoz","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"765c7d9e-f1f8-4620-953c-145662493547","created_by":"mobiz","created_date":"2023-11-06T16:55:34.332065Z","name":"Al Barsha","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"59d682a2-3b6f-462f-994a-3e4a2affd185","created_by":"mobiz","created_date":"2023-11-06T16:55:25.887791Z","name":"Discovery Garden","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"1d977c69-6988-4670-9df6-6fc800aec0ad","created_by":"mobiz","created_date":"2023-11-06T16:55:16.663629Z","name":"AL Quoz","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"}]}
/// message : "Successfully Passed Data!"

AreaListModel areaListModelFromJson(String str) => AreaListModel.fromJson(json.decode(str));
String areaListModelToJson(AreaListModel data) => json.encode(data.toJson());
class AreaListModel {
  AreaListModel({
      this.status, 
      this.data, 
      this.message,});

  AreaListModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? AreaData.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  AreaData? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

/// area_list : [{"area_id":"1b26cdc2-c3d6-4361-87ea-7b611551e82d","created_by":"mobiz","created_date":"2023-11-07T04:31:11.374904Z","name":"Al Nahda","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"263c1d1c-809e-439c-9236-a2f92931bf3e","created_by":"mobiz","created_date":"2023-11-06T16:57:45.461231Z","name":"Jumerirah","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"8403c320-f36c-4019-ae03-54c7b45a1c14","created_by":"mobiz","created_date":"2023-11-06T16:56:47.996780Z","name":"Jumeriah Village","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"5faa4ae5-67dd-42de-9e0e-dc4edc182e4a","created_by":"mobiz","created_date":"2023-11-06T16:56:01.564727Z","name":"Palm Jumeriah","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"6874f3fb-96be-4e16-b256-6ee5534b239d","created_by":"mobiz","created_date":"2023-11-06T16:55:46.759116Z","name":"IMPZ","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"0c77e8a3-ccc1-4986-88a2-0607f003cf08","created_by":"mobiz","created_date":"2023-11-06T16:55:39.230412Z","name":"Al Quoz","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"765c7d9e-f1f8-4620-953c-145662493547","created_by":"mobiz","created_date":"2023-11-06T16:55:34.332065Z","name":"Al Barsha","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"59d682a2-3b6f-462f-994a-3e4a2affd185","created_by":"mobiz","created_date":"2023-11-06T16:55:25.887791Z","name":"Discovery Garden","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"},{"area_id":"1d977c69-6988-4670-9df6-6fc800aec0ad","created_by":"mobiz","created_date":"2023-11-06T16:55:16.663629Z","name":"AL Quoz","is_dlt":false,"emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7"}]

AreaData dataFromJson(String str) => AreaData.fromJson(json.decode(str));
String dataToJson(AreaData data) => json.encode(data.toJson());
class AreaData {
  AreaData({
      this.areaList,});

  AreaData.fromJson(dynamic json) {
    if (json['area_list'] != null) {
      areaList = [];
      json['area_list'].forEach((v) {
        areaList?.add(AreaList.fromJson(v));
      });
    }
  }
  List<AreaList>? areaList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (areaList != null) {
      map['area_list'] = areaList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// area_id : "1b26cdc2-c3d6-4361-87ea-7b611551e82d"
/// created_by : "mobiz"
/// created_date : "2023-11-07T04:31:11.374904Z"
/// name : "Al Nahda"
/// is_dlt : false
/// emirate : "d6795abd-31e1-41a7-8c03-e0548b14b5e7"

AreaList areaListFromJson(String str) => AreaList.fromJson(json.decode(str));
String areaListToJson(AreaList data) => json.encode(data.toJson());
class AreaList {
  AreaList({
      this.areaId, 
      this.createdBy, 
      this.createdDate, 
      this.name, 
      this.isDlt, 
      this.emirate,});

  AreaList.fromJson(dynamic json) {
    areaId = json['area_id'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    name = json['name'];
    isDlt = json['is_dlt'];
    emirate = json['emirate'];
  }
  String? areaId;
  String? createdBy;
  String? createdDate;
  String? name;
  bool? isDlt;
  String? emirate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['area_id'] = areaId;
    map['created_by'] = createdBy;
    map['created_date'] = createdDate;
    map['name'] = name;
    map['is_dlt'] = isDlt;
    map['emirate'] = emirate;
    return map;
  }

}