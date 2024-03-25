import 'dart:convert';

class PickerOrderHistoryModel {
  bool status;
  List<OrderHist> data;
  TotalCount totalCount;
  String message;

  PickerOrderHistoryModel({
    required this.status,
    required this.data,
    required this.totalCount,
    required this.message,
  });

  PickerOrderHistoryModel copyWith({
    bool? status,
    List<OrderHist>? data,
    TotalCount? totalCount,
    String? message,
  }) =>
      PickerOrderHistoryModel(
        status: status ?? this.status,
        data: data ?? this.data,
        totalCount: totalCount ?? this.totalCount,
        message: message ?? this.message,
      );

  factory PickerOrderHistoryModel.fromRawJson(String str) => PickerOrderHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerOrderHistoryModel.fromJson(Map<String, dynamic> json) => PickerOrderHistoryModel(
    status: json["status"],
    data: List<OrderHist>.from(json["data"].map((x) => OrderHist.fromJson(x))),
    totalCount: TotalCount.fromJson(json["total_count"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "total_count": totalCount.toJson(),
    "message": message,
  };
}

class OrderHist {
  String orderId;
  String orderNumber;
  DateTime pickupDate;
  String pickupTime;
  String status;
  DateTime orderDate;
  Customer customer;

  OrderHist({
    required this.orderId,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.status,
    required this.orderDate,
    required this.customer,
  });

  OrderHist copyWith({
    String? orderId,
    String? orderNumber,
    DateTime? pickupDate,
    String? pickupTime,
    String? status,
    DateTime? orderDate,
    Customer? customer,
  }) =>
      OrderHist(
        orderId: orderId ?? this.orderId,
        orderNumber: orderNumber ?? this.orderNumber,
        pickupDate: pickupDate ?? this.pickupDate,
        pickupTime: pickupTime ?? this.pickupTime,
        status: status ?? this.status,
        orderDate: orderDate ?? this.orderDate,
        customer: customer ?? this.customer,
      );

  factory OrderHist.fromRawJson(String str) => OrderHist.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory OrderHist.fromJson(Map<String, dynamic> json) => OrderHist(
    orderId: json["order_id"],
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    status: json["status"],
    orderDate: DateTime.parse(json["order_date"]),
    customer: Customer.fromJson(json["customer"]),
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "status": status,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "customer": customer.toJson(),
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

class TotalCount {
  int orderCount;

  TotalCount({
    required this.orderCount,
  });

  TotalCount copyWith({
    int? orderCount,
  }) =>
      TotalCount(
        orderCount: orderCount ?? this.orderCount,
      );

  factory TotalCount.fromRawJson(String str) => TotalCount.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TotalCount.fromJson(Map<String, dynamic> json) => TotalCount(
    orderCount: json["order_count"],
  );

  Map<String, dynamic> toJson() => {
    "order_count": orderCount,
  };
}
