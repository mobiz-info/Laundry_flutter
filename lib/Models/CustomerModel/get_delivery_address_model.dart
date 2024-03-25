// To parse this JSON data, do
//
//     final getDeliveryAddressModel = getDeliveryAddressModelFromJson(jsonString);

import 'dart:convert';

GetDeliveryAddressModel getDeliveryAddressModelFromJson(String str) => GetDeliveryAddressModel.fromJson(json.decode(str));

String getDeliveryAddressModelToJson(GetDeliveryAddressModel data) => json.encode(data.toJson());

class GetDeliveryAddressModel {
  final bool? status;
  final List<Map<String, String?>>? data;
  final String? message;

  GetDeliveryAddressModel({
    this.status,
    this.data,
    this.message,
  });

  factory GetDeliveryAddressModel.fromJson(Map<String, dynamic> json) => GetDeliveryAddressModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<Map<String, String?>>.from(json["data"]!.map((x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
    "message": message,
  };
}


// // To parse this JSON data, do
// //
// //     final getDeliveryAddressModel = getDeliveryAddressModelFromJson(jsonString);
//
// import 'dart:convert';
//
// GetDeliveryAddressModel getDeliveryAddressModelFromJson(String str) => GetDeliveryAddressModel.fromJson(json.decode(str));
//
// String getDeliveryAddressModelToJson(GetDeliveryAddressModel data) => json.encode(data.toJson());
//
// class GetDeliveryAddressModel {
//   final bool? status;
//   final List<DeliveryAddrData>? data;
//   final String? message;
//
//   GetDeliveryAddressModel({
//     this.status,
//     this.data,
//     this.message,
//   });
//
//   factory GetDeliveryAddressModel.fromJson(Map<String, dynamic> json) => GetDeliveryAddressModel(
//     status: json["status"],
//     data: json["data"] == null ? [] : List<DeliveryAddrData>.from(json["data"]!.map((x) => DeliveryAddrData.fromJson(x))),
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//     "message": message,
//   };
// }
//
// class DeliveryAddrData {
//   final String? pickupAddressId;
//   final dynamic buildingNameNo;
//   final dynamic floorNo;
//   final dynamic flatNoHouseNo;
//   final dynamic personInchargeMob;
//   final String? name;
//   final String? gpse;
//   final String? gpsn;
//   final dynamic emirate;
//   final dynamic location;
//   final String? customer;
//
//   DeliveryAddrData({
//     this.pickupAddressId,
//     this.buildingNameNo,
//     this.floorNo,
//     this.flatNoHouseNo,
//     this.personInchargeMob,
//     this.name,
//     this.gpse,
//     this.gpsn,
//     this.emirate,
//     this.location,
//     this.customer,
//   });
//
//   factory DeliveryAddrData.fromJson(Map<String, dynamic> json) => DeliveryAddrData(
//     pickupAddressId: json["pickup_address_id"],
//     buildingNameNo: json["building_name_no"],
//     floorNo: json["floor_no"],
//     flatNoHouseNo: json["flat_no_house_no"],
//     personInchargeMob: json["person_incharge_mob"],
//     name: json["name"],
//     gpse: json["GPSE"],
//     gpsn: json["GPSN"],
//     emirate: json["emirate"],
//     location: json["location"],
//     customer: json["customer"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "pickup_address_id": pickupAddressId,
//     "building_name_no": buildingNameNo,
//     "floor_no": floorNo,
//     "flat_no_house_no": flatNoHouseNo,
//     "person_incharge_mob": personInchargeMob,
//     "name": name,
//     "GPSE": gpse,
//     "GPSN": gpsn,
//     "emirate": emirate,
//     "location": location,
//     "customer": customer,
//   };
// }
//
