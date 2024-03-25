import 'dart:convert';

class PickerOutstandingDueModel {
  bool status;
  List<OutStand> data;
  String message;

  PickerOutstandingDueModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerOutstandingDueModel copyWith({
    bool? status,
    List<OutStand>? data,
    String? message,
  }) =>
      PickerOutstandingDueModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerOutstandingDueModel.fromRawJson(String str) => PickerOutstandingDueModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerOutstandingDueModel.fromJson(Map<String, dynamic> json) => PickerOutstandingDueModel(
    status: json["status"],
    data: List<OutStand>.from(json["data"].map((x) => OutStand.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class OutStand {
  String outstandingId;
  Collection collection;
  dynamic createdBy;
  DateTime createdDate;
  DateTime outstandingDate;
  String short;

  OutStand({
    required this.outstandingId,
    required this.collection,
    required this.createdBy,
    required this.createdDate,
    required this.outstandingDate,
    required this.short,
  });

  OutStand copyWith({
    String? outstandingId,
    Collection? collection,
    dynamic createdBy,
    DateTime? createdDate,
    DateTime? outstandingDate,
    String? short,
  }) =>
      OutStand(
        outstandingId: outstandingId ?? this.outstandingId,
        collection: collection ?? this.collection,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        outstandingDate: outstandingDate ?? this.outstandingDate,
        short: short ?? this.short,
      );

  factory OutStand.fromRawJson(String str) => OutStand.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OutStand.fromJson(Map<String, dynamic> json) => OutStand(
    outstandingId: json["outstanding_id"],
    collection: Collection.fromJson(json["collection"]),
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    outstandingDate: DateTime.parse(json["outstanding_date"]),
    short: json["short"],
  );

  Map<String, dynamic> toJson() => {
    "outstanding_id": outstandingId,
    "collection": collection.toJson(),
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "outstanding_date": "${outstandingDate.year.toString().padLeft(4, '0')}-${outstandingDate.month.toString().padLeft(2, '0')}-${outstandingDate.day.toString().padLeft(2, '0')}",
    "short": short,
  };
}

class Collection {
  Customer customer;
  String collectAmount;
  String collectMode;

  Collection({
    required this.customer,
    required this.collectAmount,
    required this.collectMode,
  });

  Collection copyWith({
    Customer? customer,
    String? collectAmount,
    String? collectMode,
  }) =>
      Collection(
        customer: customer ?? this.customer,
        collectAmount: collectAmount ?? this.collectAmount,
        collectMode: collectMode ?? this.collectMode,
      );

  factory Collection.fromRawJson(String str) => Collection.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    customer: Customer.fromJson(json["customer"]),
    collectAmount: json["collect_amount"],
    collectMode: json["collect_mode"],
  );

  Map<String, dynamic> toJson() => {
    "customer": customer.toJson(),
    "collect_amount": collectAmount,
    "collect_mode": collectMode,
  };
}

class Customer {
  String name;
  String buildingNo;
  Location location;

  Customer({
    required this.name,
    required this.buildingNo,
    required this.location,
  });

  Customer copyWith({
    String? name,
    String? buildingNo,
    Location? location,
  }) =>
      Customer(
        name: name ?? this.name,
        buildingNo: buildingNo ?? this.buildingNo,
        location: location ?? this.location,
      );

  factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
    name: json["name"],
    buildingNo: json["building_no"],
    location: Location.fromJson(json["Location"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "building_no": buildingNo,
    "Location": location.toJson(),
  };
}

class Location {
  String name;

  Location({
    required this.name,
  });

  Location copyWith({
    String? name,
  }) =>
      Location(
        name: name ?? this.name,
      );

  factory Location.fromRawJson(String str) => Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
