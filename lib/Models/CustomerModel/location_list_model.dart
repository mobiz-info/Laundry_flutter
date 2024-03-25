import 'dart:convert';
/// status : true
/// data : {"location_list":[{"location_id":"6a9d82b7-fd19-4f04-982b-caec2a30fb85","created_by":"mobiz","created_date":"2023-11-06T16:58:56.018008Z","name":"Brayw st","area":"263c1d1c-809e-439c-9236-a2f92931bf3e"}]}
/// message : "Successfully Passed Data!"

LocationListModel locationListModelFromJson(String str) => LocationListModel.fromJson(json.decode(str));
String locationListModelToJson(LocationListModel data) => json.encode(data.toJson());
class LocationListModel {
  LocationListModel({
      this.status, 
      this.data, 
      this.message,});

  LocationListModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? LocationData.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  LocationData? data;
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

/// location_list : [{"location_id":"6a9d82b7-fd19-4f04-982b-caec2a30fb85","created_by":"mobiz","created_date":"2023-11-06T16:58:56.018008Z","name":"Brayw st","area":"263c1d1c-809e-439c-9236-a2f92931bf3e"}]

LocationData dataFromJson(String str) => LocationData.fromJson(json.decode(str));
String dataToJson(LocationData data) => json.encode(data.toJson());
class LocationData {
  LocationData({
      this.locationList,});

  LocationData.fromJson(dynamic json) {
    if (json['location_list'] != null) {
      locationList = [];
      json['location_list'].forEach((v) {
        locationList?.add(LocationList.fromJson(v));
      });
    }
  }
  List<LocationList>? locationList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (locationList != null) {
      map['location_list'] = locationList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// location_id : "6a9d82b7-fd19-4f04-982b-caec2a30fb85"
/// created_by : "mobiz"
/// created_date : "2023-11-06T16:58:56.018008Z"
/// name : "Brayw st"
/// area : "263c1d1c-809e-439c-9236-a2f92931bf3e"

LocationList locationListFromJson(String str) => LocationList.fromJson(json.decode(str));
String locationListToJson(LocationList data) => json.encode(data.toJson());
class LocationList {
  LocationList({
      this.locationId, 
      this.createdBy, 
      this.createdDate, 
      this.name, 
      this.area,});

  LocationList.fromJson(dynamic json) {
    locationId = json['location_id'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    name = json['name'];
    area = json['area'];
  }
  String? locationId;
  String? createdBy;
  String? createdDate;
  String? name;
  String? area;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['location_id'] = locationId;
    map['created_by'] = createdBy;
    map['created_date'] = createdDate;
    map['name'] = name;
    map['area'] = area;
    return map;
  }

}