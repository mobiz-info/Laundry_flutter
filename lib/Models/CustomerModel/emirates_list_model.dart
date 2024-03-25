import 'dart:convert';
/// status : true
/// data : {"emirates_list":[{"emirate_id":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","country":{"country_id":"5cc7186b-5417-4676-827b-61fa95d0e2e2","created_by":"mobiz","created_date":"2023-11-06T16:52:27.407878Z","name":"UAE","is_dlt":false},"created_by":"mobiz","created_date":"2023-11-06T16:53:00.260563Z","name":"Dubai","is_dlt":false}]}
/// message : "Successfully Passed Data!"

EmiratesListModel emiratesListModelFromJson(String str) => EmiratesListModel.fromJson(json.decode(str));
String emiratesListModelToJson(EmiratesListModel data) => json.encode(data.toJson());
class EmiratesListModel {
  EmiratesListModel({
      this.status, 
      this.data, 
      this.message,});

  EmiratesListModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? EmiratesData.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  EmiratesData? data;
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

/// emirates_list : [{"emirate_id":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","country":{"country_id":"5cc7186b-5417-4676-827b-61fa95d0e2e2","created_by":"mobiz","created_date":"2023-11-06T16:52:27.407878Z","name":"UAE","is_dlt":false},"created_by":"mobiz","created_date":"2023-11-06T16:53:00.260563Z","name":"Dubai","is_dlt":false}]

EmiratesData dataFromJson(String str) => EmiratesData.fromJson(json.decode(str));
String dataToJson(EmiratesData data) => json.encode(data.toJson());
class EmiratesData {
  EmiratesData({
      this.emiratesList,});

  EmiratesData.fromJson(dynamic json) {
    if (json['emirates_list'] != null) {
      emiratesList = [];
      json['emirates_list'].forEach((v) {
        emiratesList?.add(EmiratesList.fromJson(v));
      });
    }
  }
  List<EmiratesList>? emiratesList;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (emiratesList != null) {
      map['emirates_list'] = emiratesList?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// emirate_id : "d6795abd-31e1-41a7-8c03-e0548b14b5e7"
/// country : {"country_id":"5cc7186b-5417-4676-827b-61fa95d0e2e2","created_by":"mobiz","created_date":"2023-11-06T16:52:27.407878Z","name":"UAE","is_dlt":false}
/// created_by : "mobiz"
/// created_date : "2023-11-06T16:53:00.260563Z"
/// name : "Dubai"
/// is_dlt : false

EmiratesList emiratesListFromJson(String str) => EmiratesList.fromJson(json.decode(str));
String emiratesListToJson(EmiratesList data) => json.encode(data.toJson());
class EmiratesList {
  EmiratesList({
      this.emirateId, 
      this.country, 
      this.createdBy, 
      this.createdDate, 
      this.name, 
      this.isDlt,});

  EmiratesList.fromJson(dynamic json) {
    emirateId = json['emirate_id'];
    country = json['country'] != null ? Country.fromJson(json['country']) : null;
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    name = json['name'];
    isDlt = json['is_dlt'];
  }
  String? emirateId;
  Country? country;
  String? createdBy;
  String? createdDate;
  String? name;
  bool? isDlt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['emirate_id'] = emirateId;
    if (country != null) {
      map['country'] = country?.toJson();
    }
    map['created_by'] = createdBy;
    map['created_date'] = createdDate;
    map['name'] = name;
    map['is_dlt'] = isDlt;
    return map;
  }

}

/// country_id : "5cc7186b-5417-4676-827b-61fa95d0e2e2"
/// created_by : "mobiz"
/// created_date : "2023-11-06T16:52:27.407878Z"
/// name : "UAE"
/// is_dlt : false

Country countryFromJson(String str) => Country.fromJson(json.decode(str));
String countryToJson(Country data) => json.encode(data.toJson());
class Country {
  Country({
      this.countryId, 
      this.createdBy, 
      this.createdDate, 
      this.name, 
      this.isDlt,});

  Country.fromJson(dynamic json) {
    countryId = json['country_id'];
    createdBy = json['created_by'];
    createdDate = json['created_date'];
    name = json['name'];
    isDlt = json['is_dlt'];
  }
  String? countryId;
  String? createdBy;
  String? createdDate;
  String? name;
  bool? isDlt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_id'] = countryId;
    map['created_by'] = createdBy;
    map['created_date'] = createdDate;
    map['name'] = name;
    map['is_dlt'] = isDlt;
    return map;
  }

}