// To parse this JSON data, do
//
//     final addAddressModel = addAddressModelFromJson(jsonString);

import 'dart:convert';

AddAddressModel addAddressModelFromJson(String str) => AddAddressModel.fromJson(json.decode(str));

String addAddressModelToJson(AddAddressModel data) => json.encode(data.toJson());

class AddAddressModel {
  final bool? status;
  final AddAddressData? data;
  final String? message;

  AddAddressModel({
    this.status,
    this.data,
    this.message,
  });

  factory AddAddressModel.fromJson(Map<String, dynamic> json) => AddAddressModel(
    status: json["status"],
    data: json["data"] == null ? null : AddAddressData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class AddAddressData {
  final String? pickupAddressId;
  final String? buildingNameNo;
  final String? floorNo;
  final String? flatNoHouseNo;
  final String? personInchargeMob;
  final String? name;
  final String? gpse;
  final String? gpsn;
  final String? emirate;
  final String? area;
  final String? location;
  final String? customer;

  AddAddressData({
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
    this.customer,
  });

  factory AddAddressData.fromJson(Map<String, dynamic> json) => AddAddressData(
    pickupAddressId: json["pickup_address_id"],
    buildingNameNo: json["building_name_no"],
    floorNo: json["floor_no"],
    flatNoHouseNo: json["flat_no_house_no"],
    personInchargeMob: json["person_incharge_mob"],
    name: json["name"],
    gpse: json["GPSE"],
    gpsn: json["GPSN"],
    emirate: json["emirate"],
    area: json["area"],
    location: json["location"],
    customer: json["customer"],
  );

  Map<String, dynamic> toJson() => {
    "pickup_address_id": pickupAddressId,
    "building_name_no": buildingNameNo,
    "floor_no": floorNo,
    "flat_no_house_no": flatNoHouseNo,
    "person_incharge_mob": personInchargeMob,
    "name": name,
    "GPSE": gpse,
    "GPSN": gpsn,
    "emirate": emirate,
    "area": area,
    "location": location,
    "customer": customer,
  };
}
