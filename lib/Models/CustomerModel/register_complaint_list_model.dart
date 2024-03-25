// To parse this JSON data, do
//
//     final registerComplaintListModel = registerComplaintListModelFromJson(jsonString);

import 'dart:convert';

RegisterComplaintListModel registerComplaintListModelFromJson(String str) => RegisterComplaintListModel.fromJson(json.decode(str));

String registerComplaintListModelToJson(RegisterComplaintListModel data) => json.encode(data.toJson());

class RegisterComplaintListModel {
  final bool? status;
  final RegisterComplaintListData? data;
  final String? message;

  RegisterComplaintListModel({
    this.status,
    this.data,
    this.message,
  });

  factory RegisterComplaintListModel.fromJson(Map<String, dynamic> json) => RegisterComplaintListModel(
    status: json["status"],
    data: json["data"] == null ? null : RegisterComplaintListData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class RegisterComplaintListData {
  final List<Cart>? cart;
  final int? cartCount;
  final String? walletBalance;
  final DeliveryAddress? deliveryAddress;
  final String? paymentMethod;
  final String? serviceType;
  final String? vat;
  final String? netTaxable;
  final String? totalOrderprice;
  final List<ComplaintList>? complaintList;

  RegisterComplaintListData({
    this.cart,
    this.cartCount,
    this.walletBalance,
    this.deliveryAddress,
    this.paymentMethod,
    this.serviceType,
    this.vat,
    this.netTaxable,
    this.totalOrderprice,
    this.complaintList,
  });

  factory RegisterComplaintListData.fromJson(Map<String, dynamic> json) => RegisterComplaintListData(
    cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
    cartCount: json["cart_count"],
    walletBalance: json["wallet_balance"],
    deliveryAddress: json["delivery_address"] == null ? null : DeliveryAddress.fromJson(json["delivery_address"]),
    paymentMethod: json["payment_method"],
    serviceType: json["Service_type"],
    vat: json["VAT"],
    netTaxable: json["Net_taxable"],
    totalOrderprice: json["total_orderprice"],
    complaintList: json["complaint_list"] == null ? [] : List<ComplaintList>.from(json["complaint_list"]!.map((x) => ComplaintList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
    "cart_count": cartCount,
    "wallet_balance": walletBalance,
    "delivery_address": deliveryAddress?.toJson(),
    "payment_method": paymentMethod,
    "Service_type": serviceType,
    "VAT": vat,
    "Net_taxable": netTaxable,
    "total_orderprice": totalOrderprice,
    "complaint_list": complaintList == null ? [] : List<dynamic>.from(complaintList!.map((x) => x.toJson())),
  };
}

class Cart {
  final String? cartId;
  final Order? order;
  final String? quantity;
  final String? amount;
  final ItemService? itemService;
  final String? priceList;

  Cart({
    this.cartId,
    this.order,
    this.quantity,
    this.amount,
    this.itemService,
    this.priceList,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cart_id"],
    order: json["order"] == null ? null : Order.fromJson(json["order"]),
    quantity: json["quantity"],
    amount: json["amount"],
    itemService: json["item_service"] == null ? null : ItemService.fromJson(json["item_service"]),
    priceList: json["price_list"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "order": order?.toJson(),
    "quantity": quantity,
    "amount": amount,
    "item_service": itemService?.toJson(),
    "price_list": priceList,
  };
}

class ItemService {
  final String? itemSerId;
  final Item? item;
  final Category? category;
  final SubCategory? subCategory;

  ItemService({
    this.itemSerId,
    this.item,
    this.category,
    this.subCategory,
  });

  factory ItemService.fromJson(Map<String, dynamic> json) => ItemService(
    itemSerId: json["item_ser_id"],
    item: json["item"] == null ? null : Item.fromJson(json["item"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subCategory: json["sub_category"] == null ? null : SubCategory.fromJson(json["sub_category"]),
  );

  Map<String, dynamic> toJson() => {
    "item_ser_id": itemSerId,
    "item": item?.toJson(),
    "category": category?.toJson(),
    "sub_category": subCategory?.toJson(),
  };
}

class Category {
  final String? categoryId;
  final ServiceMaster? serviceMaster;

  Category({
    this.categoryId,
    this.serviceMaster,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"],
    serviceMaster: json["service_master"] == null ? null : ServiceMaster.fromJson(json["service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "service_master": serviceMaster?.toJson(),
  };
}

class ServiceMaster {
  final String? categoryName;
  final String? categoryImage;

  ServiceMaster({
    this.categoryName,
    this.categoryImage,
  });

  factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "category_image": categoryImage,
  };
}

class Item {
  final String? itemId;
  final String? itemName;
  final String? itemImage;

  Item({
    this.itemId,
    this.itemName,
    this.itemImage,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemId: json["item_id"],
    itemName: json["item_name"],
    itemImage: json["item_image"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "item_name": itemName,
    "item_image": itemImage,
  };
}

class SubCategory {
  final String? subCatId;
  final SubServiceMaster? subServiceMaster;

  SubCategory({
    this.subCatId,
    this.subServiceMaster,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    subCatId: json["sub_cat_id"],
    subServiceMaster: json["sub_service_master"] == null ? null : SubServiceMaster.fromJson(json["sub_service_master"]),
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_service_master": subServiceMaster?.toJson(),
  };
}

class SubServiceMaster {
  final String? subCatName;
  final String? subCatImage;

  SubServiceMaster({
    this.subCatName,
    this.subCatImage,
  });

  factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
    subCatName: json["sub_cat_name"],
    subCatImage: json["sub_cat_image"],
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_name": subCatName,
    "sub_cat_image": subCatImage,
  };
}

class Order {
  final String? orderId;
  final DateTime? createdDate;
  final String? orderNumber;
  final DateTime? pickupDate;
  final String? pickupTime;
  final String? customer;
  final String? totalAmount;
  final DateTime? deliveryDate;
  final String? status;
  final DateTime? orderDate;
  final String? deliveryTime;
  final String? orderType;
  final String? netTaxable;
  final String? vat;

  Order({
    this.orderId,
    this.createdDate,
    this.orderNumber,
    this.pickupDate,
    this.pickupTime,
    this.customer,
    this.totalAmount,
    this.deliveryDate,
    this.status,
    this.orderDate,
    this.deliveryTime,
    this.orderType,
    this.netTaxable,
    this.vat,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: json["pickup_date"] == null ? null : DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    customer: json["customer"],
    totalAmount: json["total_amount"],
    deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
    status: json["status"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    deliveryTime: json["Delivery_time"],
    orderType: json["order_type"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "created_date": createdDate?.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "customer": customer,
    "total_amount": totalAmount,
    "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
    "status": status,
    "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "order_type": orderType,
    "net_taxable": netTaxable,
    "vat": vat,
  };
}

class ComplaintList {
  final String? complaintId;
  final String? complaintType;

  ComplaintList({
    this.complaintId,
    this.complaintType,
  });

  factory ComplaintList.fromJson(Map<String, dynamic> json) => ComplaintList(
    complaintId: json["complaint_id"],
    complaintType: json["complaint_type"],
  );

  Map<String, dynamic> toJson() => {
    "complaint_id": complaintId,
    "complaint_type": complaintType,
  };
}

class DeliveryAddress {
  final dynamic name;
  final dynamic customerType;
  final dynamic buildingNo;
  final dynamic roomNo;
  final dynamic buildingName;
  final dynamic floorNumber;
  final dynamic flatNumber;

  DeliveryAddress({
    this.name,
    this.customerType,
    this.buildingNo,
    this.roomNo,
    this.buildingName,
    this.floorNumber,
    this.flatNumber,
  });

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
    name: json["name"],
    customerType: json["customer_type"],
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "customer_type": customerType,
    "building_no": buildingNo,
    "room_no": roomNo,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
  };
}
