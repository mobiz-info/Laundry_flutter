import 'dart:convert';
/// status : true
/// data : {"address_list":[{"pickup_address_id":"04882634-ab7a-465f-a5fe-85f129cb1b5b","building_name_no":"Loft","floor_no":"34","flat_no_house_no":"16b","person_incharge_mob":"23554466","name":"deepesh","GPSE":"5","GPSN":"3","emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","area":null,"location":"7a5bbc12-b6b2-47df-9729-21b41e18fb9a","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"110728bc-e71e-4b1c-9675-cd3ddd8f0c16","building_name_no":"Artech","floor_no":"34","flat_no_house_no":"16b","person_incharge_mob":"4355226672","name":"deepesh","GPSE":"5","GPSN":"3","emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","area":null,"location":"6a9d82b7-fd19-4f04-982b-caec2a30fb85","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"41e61860-3cdd-4fc0-8bc3-6a40da36166f","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":"","GPSE":"5","GPSN":"3","emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"75f3aad4-2b51-4f36-abc7-731786a731eb","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":null,"GPSE":null,"GPSN":null,"emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"866baa21-a854-4bb9-8469-1384e9f7813b","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":null,"GPSE":null,"GPSN":null,"emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"a47c68ac-2460-47d5-b120-bc51f9ba0e48","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":null,"GPSE":null,"GPSN":null,"emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"d8549d0b-39e7-4f09-98ed-32882ec2a45e","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":"deepesh","GPSE":"5","GPSN":"3","emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"building_name_no":"skyline","floor_no":"5","flat_no_house_no":"0","person_incharge_mob":"0564529335","name":"Deepesh George"}],"adress_count":8}
/// message : "Data passed successfully!"

MyAddressesListModel myAddressesListModelFromJson(String str) => MyAddressesListModel.fromJson(json.decode(str));
String myAddressesListModelToJson(MyAddressesListModel data) => json.encode(data.toJson());
class MyAddressesListModel {
  MyAddressesListModel({
      this.status, 
      this.data, 
      this.message,});

  MyAddressesListModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? MyAddressesData.fromJson(json['data']) : null;
    message = json['message'];
  }
  bool? status;
  MyAddressesData? data;
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

/// address_list : [{"pickup_address_id":"04882634-ab7a-465f-a5fe-85f129cb1b5b","building_name_no":"Loft","floor_no":"34","flat_no_house_no":"16b","person_incharge_mob":"23554466","name":"deepesh","GPSE":"5","GPSN":"3","emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","area":null,"location":"7a5bbc12-b6b2-47df-9729-21b41e18fb9a","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"110728bc-e71e-4b1c-9675-cd3ddd8f0c16","building_name_no":"Artech","floor_no":"34","flat_no_house_no":"16b","person_incharge_mob":"4355226672","name":"deepesh","GPSE":"5","GPSN":"3","emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","area":null,"location":"6a9d82b7-fd19-4f04-982b-caec2a30fb85","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"41e61860-3cdd-4fc0-8bc3-6a40da36166f","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":"","GPSE":"5","GPSN":"3","emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"75f3aad4-2b51-4f36-abc7-731786a731eb","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":null,"GPSE":null,"GPSN":null,"emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"866baa21-a854-4bb9-8469-1384e9f7813b","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":null,"GPSE":null,"GPSN":null,"emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"a47c68ac-2460-47d5-b120-bc51f9ba0e48","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":null,"GPSE":null,"GPSN":null,"emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"pickup_address_id":"d8549d0b-39e7-4f09-98ed-32882ec2a45e","building_name_no":null,"floor_no":null,"flat_no_house_no":null,"person_incharge_mob":null,"name":"deepesh","GPSE":"5","GPSN":"3","emirate":null,"area":null,"location":null,"customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"},{"building_name_no":"skyline","floor_no":"5","flat_no_house_no":"0","person_incharge_mob":"0564529335","name":"Deepesh George"}]
/// adress_count : 8

MyAddressesData dataFromJson(String str) => MyAddressesData.fromJson(json.decode(str));
String dataToJson(MyAddressesData data) => json.encode(data.toJson());
class MyAddressesData {
  MyAddressesData({
      this.addressList, 
      this.adressCount,});

  MyAddressesData.fromJson(dynamic json) {
    if (json['address_list'] != null) {
      addressList = [];
      json['address_list'].forEach((v) {
        addressList?.add(MyAddressList.fromJson(v));
      });
    }
    adressCount = json['adress_count'];
  }
  List<MyAddressList>? addressList;
  int? adressCount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (addressList != null) {
      map['address_list'] = addressList?.map((v) => v.toJson()).toList();
    }
    map['adress_count'] = adressCount;
    return map;
  }

}

/// pickup_address_id : "04882634-ab7a-465f-a5fe-85f129cb1b5b"
/// building_name_no : "Loft"
/// floor_no : "34"
/// flat_no_house_no : "16b"
/// person_incharge_mob : "23554466"
/// name : "deepesh"
/// GPSE : "5"
/// GPSN : "3"
/// emirate : "d6795abd-31e1-41a7-8c03-e0548b14b5e7"
/// area : null
/// location : "7a5bbc12-b6b2-47df-9729-21b41e18fb9a"
/// customer : "a59b6ef2-e15e-4175-80c3-141e8caf720c"

MyAddressList addressListFromJson(String str) => MyAddressList.fromJson(json.decode(str));
String addressListToJson(MyAddressList data) => json.encode(data.toJson());
class MyAddressList {
  MyAddressList({
      this.pickupAddressId, 
      this.buildingNameNo, 
      this.floorNo, 
      this.flatNoHouseNo, 
      this.personInchargeMob, 
      this.name, 
      this.gpse, 
      this.gpsn, 
      this.emirate, 
      this.area, 
      this.location, 
      this.customer,});

  MyAddressList.fromJson(dynamic json) {
    pickupAddressId = json['pickup_address_id'];
    buildingNameNo = json['building_name_no'];
    floorNo = json['floor_no'];
    flatNoHouseNo = json['flat_no_house_no'];
    personInchargeMob = json['person_incharge_mob'];
    name = json['name'];
    gpse = json['GPSE'];
    gpsn = json['GPSN'];
    emirate = json['emirate'];
    area = json['area'];
    location = json['location'];
    customer = json['customer'];
  }
  String? pickupAddressId;
  String? buildingNameNo;
  String? floorNo;
  String? flatNoHouseNo;
  String? personInchargeMob;
  String? name;
  String? gpse;
  String? gpsn;
  String? emirate;
  dynamic area;
  String? location;
  String? customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pickup_address_id'] = pickupAddressId;
    map['building_name_no'] = buildingNameNo;
    map['floor_no'] = floorNo;
    map['flat_no_house_no'] = flatNoHouseNo;
    map['person_incharge_mob'] = personInchargeMob;
    map['name'] = name;
    map['GPSE'] = gpse;
    map['GPSN'] = gpsn;
    map['emirate'] = emirate;
    map['area'] = area;
    map['location'] = location;
    map['customer'] = customer;
    return map;
  }

}