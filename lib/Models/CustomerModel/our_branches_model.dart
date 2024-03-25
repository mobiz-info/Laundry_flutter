// To parse this JSON data, do
//
//     final ourBranchesModel = ourBranchesModelFromJson(jsonString);

import 'dart:convert';

OurBranchesModel ourBranchesModelFromJson(String str) => OurBranchesModel.fromJson(json.decode(str));

String ourBranchesModelToJson(OurBranchesModel data) => json.encode(data.toJson());

class OurBranchesModel {
  final bool? status;
  final OurBranchesData? data;
  final String? message;

  OurBranchesModel({
    this.status,
    this.data,
    this.message,
  });

  factory OurBranchesModel.fromJson(Map<String, dynamic> json) => OurBranchesModel(
    status: json["status"],
    data: json["data"] == null ? null : OurBranchesData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class OurBranchesData {
  final CustomerLocations? customerLocations;
  final List<Branch>? branches;

  OurBranchesData({
    this.customerLocations,
    this.branches,
  });

  factory OurBranchesData.fromJson(Map<String, dynamic> json) => OurBranchesData(
    customerLocations: json["customer_locations"] == null ? null : CustomerLocations.fromJson(json["customer_locations"]),
    branches: json["branches"] == null ? [] : List<Branch>.from(json["branches"]!.map((x) => Branch.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "customer_locations": customerLocations?.toJson(),
    "branches": branches == null ? [] : List<dynamic>.from(branches!.map((x) => x.toJson())),
  };
}

class Branch {
  final String? locationName;
  final String? branchName;
  final String? branchAddress;
  final String? branchPhone;

  Branch({
    this.locationName,
    this.branchName,
    this.branchAddress,
    this.branchPhone,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
    locationName: json["location__name"],
    branchName: json["branch__name"],
    branchAddress: json["branch__address"],
    branchPhone: json["branch__Phone"],
  );

  Map<String, dynamic> toJson() => {
    "location__name": locationName,
    "branch__name": branchName,
    "branch__address": branchAddress,
    "branch__Phone": branchPhone,
  };
}

class CustomerLocations {
  final String? gpsn;
  final String? gpse;

  CustomerLocations({
    this.gpsn,
    this.gpse,
  });

  factory CustomerLocations.fromJson(Map<String, dynamic> json) => CustomerLocations(
    gpsn: json["GPSN"],
    gpse: json["GPSE"],
  );

  Map<String, dynamic> toJson() => {
    "GPSN": gpsn,
    "GPSE": gpse,
  };
}
