// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
  final bool? status;
  final OrderDetailsData? data;
  final String? message;

  OrderDetailsModel({
    this.status,
    this.data,
    this.message,
  });

  factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
    status: json["status"],
    data: json["data"] == null ? null : OrderDetailsData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class OrderDetailsData {
  final List<Cart>? cart;
  final int? cartCount;
  final String? walletBalance;
  final List<DeliveryAddress>? deliveryAddress;
  final String? paymentMethod;
  final String? walletBalanceUsed;
  final String? vat;
  final String? netTaxable;
  final String? amountPayble;

  OrderDetailsData({
    this.cart,
    this.cartCount,
    this.walletBalance,
    this.deliveryAddress,
    this.paymentMethod,
    this.walletBalanceUsed,
    this.vat,
    this.netTaxable,
    this.amountPayble,
  });

  factory OrderDetailsData.fromJson(Map<String, dynamic> json) => OrderDetailsData(
    cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
    cartCount: json["cart_count"],
    walletBalance: json["wallet_balance"],
    deliveryAddress: json["delivery_address"] == null ? [] : List<DeliveryAddress>.from(json["delivery_address"]!.map((x) => DeliveryAddress.fromJson(x))),
    paymentMethod: json["payment_method"],
    walletBalanceUsed: json["wallet_balance_used"],
    vat: json["VAT"],
    netTaxable: json["Net_taxable"],
    amountPayble: json["amount_payble"],
  );

  Map<String, dynamic> toJson() => {
    "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
    "cart_count": cartCount,
    "wallet_balance": walletBalance,
    "delivery_address": deliveryAddress == null ? [] : List<dynamic>.from(deliveryAddress!.map((x) => x.toJson())),
    "payment_method": paymentMethod,
    "wallet_balance_used": walletBalanceUsed,
    "VAT": vat,
    "Net_taxable": netTaxable,
    "amount_payble": amountPayble,
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
  final dynamic pickupDate;
  final dynamic pickupTime;
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
    pickupDate: json["pickup_date"],
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
    "pickup_date": pickupDate,
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

class DeliveryAddress {
  final String? name;
  final String? customerType;
  final String? buildingNo;
  final String? roomNo;
  final String? buildingNameNo;
  final String? floorNo;
  final String? flatNoHouseNo;

  DeliveryAddress({
    this.name,
    this.customerType,
    this.buildingNo,
    this.roomNo,
    this.buildingNameNo,
    this.floorNo,
    this.flatNoHouseNo,
  });

  factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
    name: json["name"],
    customerType: json["customer_type"],
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    buildingNameNo: json["building_name_no"],
    floorNo: json["floor_no"],
    flatNoHouseNo: json["flat_no_house_no"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "customer_type": customerType,
    "building_no": buildingNo,
    "room_no": roomNo,
    "building_name_no": buildingNameNo,
    "floor_no": floorNo,
    "flat_no_house_no": flatNoHouseNo,
  };
}


// // To parse this JSON data, do
// //
// //     final orderDetailsModel = orderDetailsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));
//
// String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());
//
// class OrderDetailsModel {
//   final bool? status;
//   final OrderDetailsData? data;
//   final String? message;
//
//   OrderDetailsModel({
//     this.status,
//     this.data,
//     this.message,
//   });
//
//   factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
//     status: json["status"],
//     data: json["data"] == null ? null : OrderDetailsData.fromJson(json["data"]),
//     message: json["message"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "data": data?.toJson(),
//     "message": message,
//   };
// }
//
// class OrderDetailsData {
//   final List<Cart>? cart;
//   final int? cartCount;
//   final String? walletBalance;
//   final List<DeliveryAddress>? deliveryAddress;
//   final String? paymentMethod;
//   final String? walletBalanceUsed;
//   final String? vat;
//   final String? netTaxable;
//   final String? amountPayble;
//
//   OrderDetailsData({
//     this.cart,
//     this.cartCount,
//     this.walletBalance,
//     this.deliveryAddress,
//     this.paymentMethod,
//     this.walletBalanceUsed,
//     this.vat,
//     this.netTaxable,
//     this.amountPayble,
//   });
//
//   factory OrderDetailsData.fromJson(Map<String, dynamic> json) => OrderDetailsData(
//     cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
//     cartCount: json["cart_count"],
//     walletBalance: json["wallet_balance"],
//     deliveryAddress: json["delivery_address"] == null ? [] : List<DeliveryAddress>.from(json["delivery_address"]!.map((x) => DeliveryAddress.fromJson(x))),
//     paymentMethod: json["payment_method"],
//     walletBalanceUsed: json["wallet_balance_used"],
//     vat: json["VAT"],
//     netTaxable: json["Net_taxable"],
//     amountPayble: json["amount_payble"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
//     "cart_count": cartCount,
//     "wallet_balance": walletBalance,
//     "delivery_address": deliveryAddress == null ? [] : List<dynamic>.from(deliveryAddress!.map((x) => x.toJson())),
//     "payment_method": paymentMethod,
//     "wallet_balance_used": walletBalanceUsed,
//     "VAT": vat,
//     "Net_taxable": netTaxable,
//     "amount_payble": amountPayble,
//   };
// }
//
// class Cart {
//   final String? cartId;
//   final Order? order;
//   final String? quantity;
//   final String? amount;
//   final ItemService? itemService;
//   final String? priceList;
//
//   Cart({
//     this.cartId,
//     this.order,
//     this.quantity,
//     this.amount,
//     this.itemService,
//     this.priceList,
//   });
//
//   factory Cart.fromJson(Map<String, dynamic> json) => Cart(
//     cartId: json["cart_id"],
//     order: json["order"] == null ? null : Order.fromJson(json["order"]),
//     quantity: json["quantity"],
//     amount: json["amount"],
//     itemService: json["item_service"] == null ? null : ItemService.fromJson(json["item_service"]),
//     priceList: json["price_list"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "cart_id": cartId,
//     "order": order?.toJson(),
//     "quantity": quantity,
//     "amount": amount,
//     "item_service": itemService?.toJson(),
//     "price_list": priceList,
//   };
// }
//
// class ItemService {
//   final String? itemSerId;
//   final Item? item;
//   final Category? category;
//   final SubCategory? subCategory;
//
//   ItemService({
//     this.itemSerId,
//     this.item,
//     this.category,
//     this.subCategory,
//   });
//
//   factory ItemService.fromJson(Map<String, dynamic> json) => ItemService(
//     itemSerId: json["item_ser_id"],
//     item: json["item"] == null ? null : Item.fromJson(json["item"]),
//     category: json["category"] == null ? null : Category.fromJson(json["category"]),
//     subCategory: json["sub_category"] == null ? null : SubCategory.fromJson(json["sub_category"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "item_ser_id": itemSerId,
//     "item": item?.toJson(),
//     "category": category?.toJson(),
//     "sub_category": subCategory?.toJson(),
//   };
// }
//
// class Category {
//   final String? categoryId;
//   final ServiceMaster? serviceMaster;
//
//   Category({
//     this.categoryId,
//     this.serviceMaster,
//   });
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     categoryId: json["category_id"],
//     serviceMaster: json["service_master"] == null ? null : ServiceMaster.fromJson(json["service_master"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "category_id": categoryId,
//     "service_master": serviceMaster?.toJson(),
//   };
// }
//
// class ServiceMaster {
//   final String? categoryName;
//   final String? categoryImage;
//
//   ServiceMaster({
//     this.categoryName,
//     this.categoryImage,
//   });
//
//   factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
//     categoryName: json["category_name"],
//     categoryImage: json["category_image"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "category_name": categoryName,
//     "category_image": categoryImage,
//   };
// }
//
// class Item {
//   final String? itemId;
//   final String? itemName;
//   final String? itemImage;
//
//   Item({
//     this.itemId,
//     this.itemName,
//     this.itemImage,
//   });
//
//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//     itemId: json["item_id"],
//     itemName: json["item_name"],
//     itemImage: json["item_image"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "item_id": itemId,
//     "item_name": itemName,
//     "item_image": itemImage,
//   };
// }
//
// class SubCategory {
//   final String? subCatId;
//   final SubServiceMaster? subServiceMaster;
//
//   SubCategory({
//     this.subCatId,
//     this.subServiceMaster,
//   });
//
//   factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
//     subCatId: json["sub_cat_id"],
//     subServiceMaster: json["sub_service_master"] == null ? null : SubServiceMaster.fromJson(json["sub_service_master"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "sub_cat_id": subCatId,
//     "sub_service_master": subServiceMaster?.toJson(),
//   };
// }
//
// class SubServiceMaster {
//   final String? subCatName;
//   final String? subCatImage;
//
//   SubServiceMaster({
//     this.subCatName,
//     this.subCatImage,
//   });
//
//   factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
//     subCatName: json["sub_cat_name"],
//     subCatImage: json["sub_cat_image"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "sub_cat_name": subCatName,
//     "sub_cat_image": subCatImage,
//   };
// }
//
// class Order {
//   final String? orderId;
//   final DateTime? createdDate;
//   final String? orderNumber;
//   final DateTime? pickupDate;
//   final String? pickupTime;
//   final String? customer;
//   final String? totalAmount;
//   final DateTime? deliveryDate;
//   final String? status;
//   final DateTime? orderDate;
//   final String? deliveryTime;
//   final String? orderType;
//   final String? netTaxable;
//   final String? vat;
//
//   Order({
//     this.orderId,
//     this.createdDate,
//     this.orderNumber,
//     this.pickupDate,
//     this.pickupTime,
//     this.customer,
//     this.totalAmount,
//     this.deliveryDate,
//     this.status,
//     this.orderDate,
//     this.deliveryTime,
//     this.orderType,
//     this.netTaxable,
//     this.vat,
//   });
//
//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//     orderId: json["order_id"],
//     createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
//     orderNumber: json["order_number"],
//     pickupDate: json["pickup_date"] == null ? null : DateTime.parse(json["pickup_date"]),
//     pickupTime: json["pickup_time"],
//     customer: json["customer"],
//     totalAmount: json["total_amount"],
//     deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
//     status: json["status"],
//     orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
//     deliveryTime: json["Delivery_time"],
//     orderType: json["order_type"],
//     netTaxable: json["net_taxable"],
//     vat: json["vat"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "order_id": orderId,
//     "created_date": createdDate?.toIso8601String(),
//     "order_number": orderNumber,
//     "pickup_date": "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
//     "pickup_time": pickupTime,
//     "customer": customer,
//     "total_amount": totalAmount,
//     "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
//     "status": status,
//     "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
//     "Delivery_time": deliveryTime,
//     "order_type": orderType,
//     "net_taxable": netTaxable,
//     "vat": vat,
//   };
// }
//
// class DeliveryAddress {
//   final String? pickupAddressId;
//   final String? buildingNameNo;
//   final String? floorNo;
//   final String? flatNoHouseNo;
//   final dynamic personInchargeMob;
//   final dynamic name;
//   final dynamic gpse;
//   final dynamic gpsn;
//   final dynamic emirate;
//   final dynamic area;
//   final dynamic location;
//   final String? customer;
//
//   DeliveryAddress({
//     this.pickupAddressId,
//     this.buildingNameNo,
//     this.floorNo,
//     this.flatNoHouseNo,
//     this.personInchargeMob,
//     this.name,
//     this.gpse,
//     this.gpsn,
//     this.emirate,
//     this.area,
//     this.location,
//     this.customer,
//   });
//
//   factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
//     pickupAddressId: json["pickup_address_id"],
//     buildingNameNo: json["building_name_no"],
//     floorNo: json["floor_no"],
//     flatNoHouseNo: json["flat_no_house_no"],
//     personInchargeMob: json["person_incharge_mob"],
//     name: json["name"],
//     gpse: json["GPSE"],
//     gpsn: json["GPSN"],
//     emirate: json["emirate"],
//     area: json["area"],
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
//     "area": area,
//     "location": location,
//     "customer": customer,
//   };
// }
//
//
// // // To parse this JSON data, do
// // //
// // //     final orderDetailsModel = orderDetailsModelFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));
// //
// // String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());
// //
// // class OrderDetailsModel {
// //   final bool? status;
// //   final OrderDetailsData? data;
// //   final String? message;
// //
// //   OrderDetailsModel({
// //     this.status,
// //     this.data,
// //     this.message,
// //   });
// //
// //   factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
// //     status: json["status"],
// //     data: json["data"] == null ? null : OrderDetailsData.fromJson(json["data"]),
// //     message: json["message"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "status": status,
// //     "data": data?.toJson(),
// //     "message": message,
// //   };
// // }
// //
// // class OrderDetailsData {
// //   final List<Cart>? cart;
// //   final int? cartCount;
// //   final String? walletBalance;
// //   final List<DeliveryAddress>? deliveryAddress;
// //   final String? paymentMethod;
// //   final int? walletBalanceUsed;
// //   final String? vat;
// //   final String? netTaxable;
// //   final String? amountPayble;
// //
// //   OrderDetailsData({
// //     this.cart,
// //     this.cartCount,
// //     this.walletBalance,
// //     this.deliveryAddress,
// //     this.paymentMethod,
// //     this.walletBalanceUsed,
// //     this.vat,
// //     this.netTaxable,
// //     this.amountPayble,
// //   });
// //
// //   factory OrderDetailsData.fromJson(Map<String, dynamic> json) => OrderDetailsData(
// //     cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
// //     cartCount: json["cart_count"],
// //     walletBalance: json["wallet_balance"],
// //     deliveryAddress: json["delivery_address"] == null ? [] : List<DeliveryAddress>.from(json["delivery_address"]!.map((x) => DeliveryAddress.fromJson(x))),
// //     paymentMethod: json["payment_method"],
// //     walletBalanceUsed: json["wallet_balance_used"],
// //     vat: json["VAT"],
// //     netTaxable: json["Net_taxable"],
// //     amountPayble: json["amount_payble"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
// //     "cart_count": cartCount,
// //     "wallet_balance": walletBalance,
// //     "delivery_address": deliveryAddress == null ? [] : List<dynamic>.from(deliveryAddress!.map((x) => x.toJson())),
// //     "payment_method": paymentMethod,
// //     "wallet_balance_used": walletBalanceUsed,
// //     "VAT": vat,
// //     "Net_taxable": netTaxable,
// //     "amount_payble": amountPayble,
// //   };
// // }
// //
// // class Cart {
// //   final String? cartId;
// //   final Order? order;
// //   final String? quantity;
// //   final String? amount;
// //   final ItemService? itemService;
// //   final String? priceList;
// //
// //   Cart({
// //     this.cartId,
// //     this.order,
// //     this.quantity,
// //     this.amount,
// //     this.itemService,
// //     this.priceList,
// //   });
// //
// //   factory Cart.fromJson(Map<String, dynamic> json) => Cart(
// //     cartId: json["cart_id"],
// //     order: json["order"] == null ? null : Order.fromJson(json["order"]),
// //     quantity: json["quantity"],
// //     amount: json["amount"],
// //     itemService: json["item_service"] == null ? null : ItemService.fromJson(json["item_service"]),
// //     priceList: json["price_list"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "cart_id": cartId,
// //     "order": order?.toJson(),
// //     "quantity": quantity,
// //     "amount": amount,
// //     "item_service": itemService?.toJson(),
// //     "price_list": priceList,
// //   };
// // }
// //
// // class ItemService {
// //   final String? itemSerId;
// //   final Item? item;
// //   final Category? category;
// //   final SubCategory? subCategory;
// //
// //   ItemService({
// //     this.itemSerId,
// //     this.item,
// //     this.category,
// //     this.subCategory,
// //   });
// //
// //   factory ItemService.fromJson(Map<String, dynamic> json) => ItemService(
// //     itemSerId: json["item_ser_id"],
// //     item: json["item"] == null ? null : Item.fromJson(json["item"]),
// //     category: json["category"] == null ? null : Category.fromJson(json["category"]),
// //     subCategory: json["sub_category"] == null ? null : SubCategory.fromJson(json["sub_category"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "item_ser_id": itemSerId,
// //     "item": item?.toJson(),
// //     "category": category?.toJson(),
// //     "sub_category": subCategory?.toJson(),
// //   };
// // }
// //
// // class Category {
// //   final String? categoryId;
// //   final ServiceMaster? serviceMaster;
// //
// //   Category({
// //     this.categoryId,
// //     this.serviceMaster,
// //   });
// //
// //   factory Category.fromJson(Map<String, dynamic> json) => Category(
// //     categoryId: json["category_id"],
// //     serviceMaster: json["service_master"] == null ? null : ServiceMaster.fromJson(json["service_master"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "category_id": categoryId,
// //     "service_master": serviceMaster?.toJson(),
// //   };
// // }
// //
// // class ServiceMaster {
// //   final String? categoryName;
// //   final String? categoryImage;
// //
// //   ServiceMaster({
// //     this.categoryName,
// //     this.categoryImage,
// //   });
// //
// //   factory ServiceMaster.fromJson(Map<String, dynamic> json) => ServiceMaster(
// //     categoryName: json["category_name"],
// //     categoryImage: json["category_image"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "category_name": categoryName,
// //     "category_image": categoryImage,
// //   };
// // }
// //
// // class Item {
// //   final String? itemId;
// //   final String? itemName;
// //   final String? itemImage;
// //
// //   Item({
// //     this.itemId,
// //     this.itemName,
// //     this.itemImage,
// //   });
// //
// //   factory Item.fromJson(Map<String, dynamic> json) => Item(
// //     itemId: json["item_id"],
// //     itemName: json["item_name"],
// //     itemImage: json["item_image"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "item_id": itemId,
// //     "item_name": itemName,
// //     "item_image": itemImage,
// //   };
// // }
// //
// // class SubCategory {
// //   final String? subCatId;
// //   final SubServiceMaster? subServiceMaster;
// //
// //   SubCategory({
// //     this.subCatId,
// //     this.subServiceMaster,
// //   });
// //
// //   factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
// //     subCatId: json["sub_cat_id"],
// //     subServiceMaster: json["sub_service_master"] == null ? null : SubServiceMaster.fromJson(json["sub_service_master"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "sub_cat_id": subCatId,
// //     "sub_service_master": subServiceMaster?.toJson(),
// //   };
// // }
// //
// // class SubServiceMaster {
// //   final String? subCatName;
// //   final String? subCatImage;
// //
// //   SubServiceMaster({
// //     this.subCatName,
// //     this.subCatImage,
// //   });
// //
// //   factory SubServiceMaster.fromJson(Map<String, dynamic> json) => SubServiceMaster(
// //     subCatName: json["sub_cat_name"],
// //     subCatImage: json["sub_cat_image"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "sub_cat_name": subCatName,
// //     "sub_cat_image": subCatImage,
// //   };
// // }
// //
// // class Order {
// //   final String? orderId;
// //   final DateTime? createdDate;
// //   final String? orderNumber;
// //   final DateTime? pickupDate;
// //   final String? pickupTime;
// //   final String? customer;
// //   final String? totalAmount;
// //   final DateTime? deliveryDate;
// //   final String? status;
// //   final DateTime? orderDate;
// //   final String? deliveryTime;
// //   final String? orderType;
// //   final String? netTaxable;
// //   final String? vat;
// //
// //   Order({
// //     this.orderId,
// //     this.createdDate,
// //     this.orderNumber,
// //     this.pickupDate,
// //     this.pickupTime,
// //     this.customer,
// //     this.totalAmount,
// //     this.deliveryDate,
// //     this.status,
// //     this.orderDate,
// //     this.deliveryTime,
// //     this.orderType,
// //     this.netTaxable,
// //     this.vat,
// //   });
// //
// //   factory Order.fromJson(Map<String, dynamic> json) => Order(
// //     orderId: json["order_id"],
// //     createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
// //     orderNumber: json["order_number"],
// //     pickupDate: json["pickup_date"] == null ? null : DateTime.parse(json["pickup_date"]),
// //     pickupTime: json["pickup_time"],
// //     customer: json["customer"],
// //     totalAmount: json["total_amount"],
// //     deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
// //     status: json["status"],
// //     orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
// //     deliveryTime: json["Delivery_time"],
// //     orderType: json["order_type"],
// //     netTaxable: json["net_taxable"],
// //     vat: json["vat"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "order_id": orderId,
// //     "created_date": createdDate?.toIso8601String(),
// //     "order_number": orderNumber,
// //     "pickup_date": "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
// //     "pickup_time": pickupTime,
// //     "customer": customer,
// //     "total_amount": totalAmount,
// //     "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
// //     "status": status,
// //     "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
// //     "Delivery_time": deliveryTime,
// //     "order_type": orderType,
// //     "net_taxable": netTaxable,
// //     "vat": vat,
// //   };
// // }
// //
// // class DeliveryAddress {
// //   final String? pickupAddressId;
// //   final dynamic buildingNameNo;
// //   final dynamic floorNo;
// //   final dynamic flatNoHouseNo;
// //   final dynamic personInchargeMob;
// //   final dynamic name;
// //   final dynamic gpse;
// //   final dynamic gpsn;
// //   final dynamic emirate;
// //   final dynamic area;
// //   final dynamic location;
// //   final String? customer;
// //
// //   DeliveryAddress({
// //     this.pickupAddressId,
// //     this.buildingNameNo,
// //     this.floorNo,
// //     this.flatNoHouseNo,
// //     this.personInchargeMob,
// //     this.name,
// //     this.gpse,
// //     this.gpsn,
// //     this.emirate,
// //     this.area,
// //     this.location,
// //     this.customer,
// //   });
// //
// //   factory DeliveryAddress.fromJson(Map<String, dynamic> json) => DeliveryAddress(
// //     pickupAddressId: json["pickup_address_id"],
// //     buildingNameNo: json["building_name_no"],
// //     floorNo: json["floor_no"],
// //     flatNoHouseNo: json["flat_no_house_no"],
// //     personInchargeMob: json["person_incharge_mob"],
// //     name: json["name"],
// //     gpse: json["GPSE"],
// //     gpsn: json["GPSN"],
// //     emirate: json["emirate"],
// //     area: json["area"],
// //     location: json["location"],
// //     customer: json["customer"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "pickup_address_id": pickupAddressId,
// //     "building_name_no": buildingNameNo,
// //     "floor_no": floorNo,
// //     "flat_no_house_no": flatNoHouseNo,
// //     "person_incharge_mob": personInchargeMob,
// //     "name": name,
// //     "GPSE": gpse,
// //     "GPSN": gpsn,
// //     "emirate": emirate,
// //     "area": area,
// //     "location": location,
// //     "customer": customer,
// //   };
// // }
// //
// //
// // // import 'dart:convert';
// // // /// status : true
// // // /// data : {"cart":[{"cart_id":"7db559c2-3498-4a0b-b599-793f8858ae89","order":{"order_id":"962f8aec-b45a-485d-8fba-51c223851a02","created_date":"2024-03-13T07:32:00.664184Z","order_number":"6444e324","pickup_date":"2024-03-13","pickup_time":"08:00 AM - 09:00 AM","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"20.0","Delivery_date":null,"status":"Confirmed","order_date":"2024-03-13","Delivery_time":null,"order_type":"Normal","net_taxable":"0","vat":"0"},"quantity":"1","amount":"20","item_service":{"item_ser_id":"c837b09e-f3d1-44bf-9ad8-c39b371235ba","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}},"sub_category":{"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":{"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}}},"price_list":"0fe1adcc-611f-44a9-bf14-932be3eb4d4d"}],"cart_count":1,"wallet_balance":"496.0","delivery_address":[{"pickup_address_id":"2966d138-bfd4-477f-8831-e9d71698cfce","building_name_no":"106","floor_no":"2","flat_no_house_no":"343","person_incharge_mob":"9786491986","name":"Santhiya","GPSE":"37.421998333333335","GPSN":"-122.08400000000002","emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08","location":"7a5bbc12-b6b2-47df-9729-21b41e18fb9a","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"}],"payment_method":"Cash on delivery","wallet_balance_used":0,"VAT":"0","Net_taxable":"0","amount_payble":"20.0"}
// // // /// message : "Customer Cart List!"
// // //
// // // OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));
// // // String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());
// // // class OrderDetailsModel {
// // //   OrderDetailsModel({
// // //       this.status,
// // //       this.data,
// // //       this.message,});
// // //
// // //   OrderDetailsModel.fromJson(dynamic json) {
// // //     status = json['status'];
// // //     data = json['data'] != null ? OrderDetailsData.fromJson(json['data']) : null;
// // //     message = json['message'];
// // //   }
// // //   bool? status;
// // //   OrderDetailsData? data;
// // //   String? message;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['status'] = status;
// // //     if (data != null) {
// // //       map['data'] = data?.toJson();
// // //     }
// // //     map['message'] = message;
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// cart : [{"cart_id":"7db559c2-3498-4a0b-b599-793f8858ae89","order":{"order_id":"962f8aec-b45a-485d-8fba-51c223851a02","created_date":"2024-03-13T07:32:00.664184Z","order_number":"6444e324","pickup_date":"2024-03-13","pickup_time":"08:00 AM - 09:00 AM","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"20.0","Delivery_date":null,"status":"Confirmed","order_date":"2024-03-13","Delivery_time":null,"order_type":"Normal","net_taxable":"0","vat":"0"},"quantity":"1","amount":"20","item_service":{"item_ser_id":"c837b09e-f3d1-44bf-9ad8-c39b371235ba","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}},"sub_category":{"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":{"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}}},"price_list":"0fe1adcc-611f-44a9-bf14-932be3eb4d4d"}]
// // // /// cart_count : 1
// // // /// wallet_balance : "496.0"
// // // /// delivery_address : [{"pickup_address_id":"2966d138-bfd4-477f-8831-e9d71698cfce","building_name_no":"106","floor_no":"2","flat_no_house_no":"343","person_incharge_mob":"9786491986","name":"Santhiya","GPSE":"37.421998333333335","GPSN":"-122.08400000000002","emirate":"d6795abd-31e1-41a7-8c03-e0548b14b5e7","area":"0c77e8a3-ccc1-4986-88a2-0607f003cf08","location":"7a5bbc12-b6b2-47df-9729-21b41e18fb9a","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c"}]
// // // /// payment_method : "Cash on delivery"
// // // /// wallet_balance_used : 0
// // // /// VAT : "0"
// // // /// Net_taxable : "0"
// // // /// amount_payble : "20.0"
// // //
// // // OrderDetailsData dataFromJson(String str) => OrderDetailsData.fromJson(json.decode(str));
// // // String dataToJson(OrderDetailsData data) => json.encode(data.toJson());
// // // class OrderDetailsData {
// // //   OrderDetailsData({
// // //       this.cart,
// // //       this.cartCount,
// // //       this.walletBalance,
// // //       this.deliveryAddress,
// // //       this.paymentMethod,
// // //       this.walletBalanceUsed,
// // //       this.vat,
// // //       this.netTaxable,
// // //       this.amountPayble,});
// // //
// // //   OrderDetailsData.fromJson(dynamic json) {
// // //     if (json['cart'] != null) {
// // //       cart = [];
// // //       json['cart'].forEach((v) {
// // //         cart?.add(Cart.fromJson(v));
// // //       });
// // //     }
// // //     cartCount = json['cart_count'];
// // //     walletBalance = json['wallet_balance'];
// // //     if (json['delivery_address'] != null) {
// // //       deliveryAddress = [];
// // //       json['delivery_address'].forEach((v) {
// // //         deliveryAddress?.add(DeliveryAddress.fromJson(v));
// // //       });
// // //     }
// // //     paymentMethod = json['payment_method'];
// // //     walletBalanceUsed = json['wallet_balance_used'];
// // //     vat = json['VAT'];
// // //     netTaxable = json['Net_taxable'];
// // //     amountPayble = json['amount_payble'].toString();
// // //   }
// // //   List<Cart>? cart;
// // //   int? cartCount;
// // //   String? walletBalance;
// // //   List<DeliveryAddress>? deliveryAddress;
// // //   String? paymentMethod;
// // //   int? walletBalanceUsed;
// // //   String? vat;
// // //   String? netTaxable;
// // //   String? amountPayble;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     if (cart != null) {
// // //       map['cart'] = cart?.map((v) => v.toJson()).toList();
// // //     }
// // //     map['cart_count'] = cartCount;
// // //     map['wallet_balance'] = walletBalance;
// // //     if (deliveryAddress != null) {
// // //       map['delivery_address'] = deliveryAddress?.map((v) => v.toJson()).toList();
// // //     }
// // //     map['payment_method'] = paymentMethod;
// // //     map['wallet_balance_used'] = walletBalanceUsed;
// // //     map['VAT'] = vat;
// // //     map['Net_taxable'] = netTaxable;
// // //     map['amount_payble'] = amountPayble;
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// pickup_address_id : "2966d138-bfd4-477f-8831-e9d71698cfce"
// // // /// building_name_no : "106"
// // // /// floor_no : "2"
// // // /// flat_no_house_no : "343"
// // // /// person_incharge_mob : "9786491986"
// // // /// name : "Santhiya"
// // // /// GPSE : "37.421998333333335"
// // // /// GPSN : "-122.08400000000002"
// // // /// emirate : "d6795abd-31e1-41a7-8c03-e0548b14b5e7"
// // // /// area : "0c77e8a3-ccc1-4986-88a2-0607f003cf08"
// // // /// location : "7a5bbc12-b6b2-47df-9729-21b41e18fb9a"
// // // /// customer : "a59b6ef2-e15e-4175-80c3-141e8caf720c"
// // //
// // // DeliveryAddress deliveryAddressFromJson(String str) => DeliveryAddress.fromJson(json.decode(str));
// // // String deliveryAddressToJson(DeliveryAddress data) => json.encode(data.toJson());
// // // class DeliveryAddress {
// // //   DeliveryAddress({
// // //       this.pickupAddressId,
// // //       this.buildingNameNo,
// // //       this.floorNo,
// // //       this.flatNoHouseNo,
// // //       this.personInchargeMob,
// // //       this.name,
// // //       this.gpse,
// // //       this.gpsn,
// // //       this.emirate,
// // //       this.area,
// // //       this.location,
// // //       this.customer,});
// // //
// // //   DeliveryAddress.fromJson(dynamic json) {
// // //     pickupAddressId = json['pickup_address_id'] ?? '--';
// // //     buildingNameNo = json['building_name_no'] ?? '--';
// // //     floorNo = json['floor_no'] ?? '--';
// // //     flatNoHouseNo = json['flat_no_house_no'] ?? '--';
// // //     personInchargeMob = json['person_incharge_mob'] ?? '--';
// // //     name = json['name'] ?? '--';
// // //     gpse = json['GPSE'] ?? '--';
// // //     gpsn = json['GPSN'] ?? '--';
// // //     emirate = json['emirate'] ?? '--';
// // //     area = json['area'] ?? '--';
// // //     location = json['location'] ?? '--';
// // //     customer = json['customer'] ?? '--';
// // //   }
// // //   String? pickupAddressId;
// // //   String? buildingNameNo;
// // //   String? floorNo;
// // //   String? flatNoHouseNo;
// // //   String? personInchargeMob;
// // //   String? name;
// // //   String? gpse;
// // //   String? gpsn;
// // //   String? emirate;
// // //   String? area;
// // //   String? location;
// // //   String? customer;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['pickup_address_id'] = pickupAddressId;
// // //     map['building_name_no'] = buildingNameNo;
// // //     map['floor_no'] = floorNo;
// // //     map['flat_no_house_no'] = flatNoHouseNo;
// // //     map['person_incharge_mob'] = personInchargeMob;
// // //     map['name'] = name;
// // //     map['GPSE'] = gpse;
// // //     map['GPSN'] = gpsn;
// // //     map['emirate'] = emirate;
// // //     map['area'] = area;
// // //     map['location'] = location;
// // //     map['customer'] = customer;
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// cart_id : "7db559c2-3498-4a0b-b599-793f8858ae89"
// // // /// order : {"order_id":"962f8aec-b45a-485d-8fba-51c223851a02","created_date":"2024-03-13T07:32:00.664184Z","order_number":"6444e324","pickup_date":"2024-03-13","pickup_time":"08:00 AM - 09:00 AM","customer":"a59b6ef2-e15e-4175-80c3-141e8caf720c","total_amount":"20.0","Delivery_date":null,"status":"Confirmed","order_date":"2024-03-13","Delivery_time":null,"order_type":"Normal","net_taxable":"0","vat":"0"}
// // // /// quantity : "1"
// // // /// amount : "20"
// // // /// item_service : {"item_ser_id":"c837b09e-f3d1-44bf-9ad8-c39b371235ba","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}},"sub_category":{"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":{"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}}}
// // // /// price_list : "0fe1adcc-611f-44a9-bf14-932be3eb4d4d"
// // //
// // // Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));
// // // String cartToJson(Cart data) => json.encode(data.toJson());
// // // class Cart {
// // //   Cart({
// // //       this.cartId,
// // //       this.order,
// // //       this.quantity,
// // //       this.amount,
// // //       this.itemService,
// // //       this.priceList,});
// // //
// // //   Cart.fromJson(dynamic json) {
// // //     cartId = json['cart_id'];
// // //     order = json['order'] != null ? Order.fromJson(json['order']) : null;
// // //     quantity = json['quantity'];
// // //     amount = json['amount'];
// // //     itemService = json['item_service'] != null ? ItemService.fromJson(json['item_service']) : null;
// // //     priceList = json['price_list'];
// // //   }
// // //   String? cartId;
// // //   Order? order;
// // //   String? quantity;
// // //   String? amount;
// // //   ItemService? itemService;
// // //   String? priceList;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['cart_id'] = cartId;
// // //     if (order != null) {
// // //       map['order'] = order?.toJson();
// // //     }
// // //     map['quantity'] = quantity;
// // //     map['amount'] = amount;
// // //     if (itemService != null) {
// // //       map['item_service'] = itemService?.toJson();
// // //     }
// // //     map['price_list'] = priceList;
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// item_ser_id : "c837b09e-f3d1-44bf-9ad8-c39b371235ba"
// // // /// item : {"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"}
// // // /// category : {"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}}
// // // /// sub_category : {"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":{"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}}
// // //
// // // ItemService itemServiceFromJson(String str) => ItemService.fromJson(json.decode(str));
// // // String itemServiceToJson(ItemService data) => json.encode(data.toJson());
// // // class ItemService {
// // //   ItemService({
// // //       this.itemSerId,
// // //       this.item,
// // //       this.category,
// // //       this.subCategory,});
// // //
// // //   ItemService.fromJson(dynamic json) {
// // //     itemSerId = json['item_ser_id'];
// // //     item = json['item'] != null ? Item.fromJson(json['item']) : null;
// // //     category = json['category'] != null ? Category.fromJson(json['category']) : null;
// // //     subCategory = json['sub_category'] != null ? SubCategory.fromJson(json['sub_category']) : null;
// // //   }
// // //   String? itemSerId;
// // //   Item? item;
// // //   Category? category;
// // //   SubCategory? subCategory;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['item_ser_id'] = itemSerId;
// // //     if (item != null) {
// // //       map['item'] = item?.toJson();
// // //     }
// // //     if (category != null) {
// // //       map['category'] = category?.toJson();
// // //     }
// // //     if (subCategory != null) {
// // //       map['sub_category'] = subCategory?.toJson();
// // //     }
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// sub_cat_id : "ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955"
// // // /// sub_service_master : {"sub_cat_name":"Dry Cleaning","sub_cat_image":"/media/dry_5CJhkjo.jpeg"}
// // //
// // // SubCategory subCategoryFromJson(String str) => SubCategory.fromJson(json.decode(str));
// // // String subCategoryToJson(SubCategory data) => json.encode(data.toJson());
// // // class SubCategory {
// // //   SubCategory({
// // //       this.subCatId,
// // //       this.subServiceMaster,});
// // //
// // //   SubCategory.fromJson(dynamic json) {
// // //     subCatId = json['sub_cat_id'];
// // //     subServiceMaster = json['sub_service_master'] != null ? SubServiceMaster.fromJson(json['sub_service_master']) : null;
// // //   }
// // //   String? subCatId;
// // //   SubServiceMaster? subServiceMaster;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['sub_cat_id'] = subCatId;
// // //     if (subServiceMaster != null) {
// // //       map['sub_service_master'] = subServiceMaster?.toJson();
// // //     }
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// sub_cat_name : "Dry Cleaning"
// // // /// sub_cat_image : "/media/dry_5CJhkjo.jpeg"
// // //
// // // SubServiceMaster subServiceMasterFromJson(String str) => SubServiceMaster.fromJson(json.decode(str));
// // // String subServiceMasterToJson(SubServiceMaster data) => json.encode(data.toJson());
// // // class SubServiceMaster {
// // //   SubServiceMaster({
// // //       this.subCatName,
// // //       this.subCatImage,});
// // //
// // //   SubServiceMaster.fromJson(dynamic json) {
// // //     subCatName = json['sub_cat_name'];
// // //     subCatImage = json['sub_cat_image'];
// // //   }
// // //   String? subCatName;
// // //   String? subCatImage;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['sub_cat_name'] = subCatName;
// // //     map['sub_cat_image'] = subCatImage;
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// category_id : "ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b"
// // // /// service_master : {"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}
// // //
// // // Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
// // // String categoryToJson(Category data) => json.encode(data.toJson());
// // // class Category {
// // //   Category({
// // //       this.categoryId,
// // //       this.serviceMaster,});
// // //
// // //   Category.fromJson(dynamic json) {
// // //     categoryId = json['category_id'];
// // //     serviceMaster = json['service_master'] != null ? ServiceMaster.fromJson(json['service_master']) : null;
// // //   }
// // //   String? categoryId;
// // //   ServiceMaster? serviceMaster;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['category_id'] = categoryId;
// // //     if (serviceMaster != null) {
// // //       map['service_master'] = serviceMaster?.toJson();
// // //     }
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// category_name : "Dry Cleaning"
// // // /// category_image : "/media/dry.jpeg"
// // //
// // // ServiceMaster serviceMasterFromJson(String str) => ServiceMaster.fromJson(json.decode(str));
// // // String serviceMasterToJson(ServiceMaster data) => json.encode(data.toJson());
// // // class ServiceMaster {
// // //   ServiceMaster({
// // //       this.categoryName,
// // //       this.categoryImage,});
// // //
// // //   ServiceMaster.fromJson(dynamic json) {
// // //     categoryName = json['category_name'];
// // //     categoryImage = json['category_image'];
// // //   }
// // //   String? categoryName;
// // //   String? categoryImage;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['category_name'] = categoryName;
// // //     map['category_image'] = categoryImage;
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// item_id : "a4b6880c-faa4-4dda-9e28-b3b690e8df95"
// // // /// item_name : "Shirts"
// // // /// item_image : "/media/shirts.jpeg"
// // //
// // // Item itemFromJson(String str) => Item.fromJson(json.decode(str));
// // // String itemToJson(Item data) => json.encode(data.toJson());
// // // class Item {
// // //   Item({
// // //       this.itemId,
// // //       this.itemName,
// // //       this.itemImage,});
// // //
// // //   Item.fromJson(dynamic json) {
// // //     itemId = json['item_id'];
// // //     itemName = json['item_name'];
// // //     itemImage = json['item_image'];
// // //   }
// // //   String? itemId;
// // //   String? itemName;
// // //   String? itemImage;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['item_id'] = itemId;
// // //     map['item_name'] = itemName;
// // //     map['item_image'] = itemImage;
// // //     return map;
// // //   }
// // //
// // // }
// // //
// // // /// order_id : "962f8aec-b45a-485d-8fba-51c223851a02"
// // // /// created_date : "2024-03-13T07:32:00.664184Z"
// // // /// order_number : "6444e324"
// // // /// pickup_date : "2024-03-13"
// // // /// pickup_time : "08:00 AM - 09:00 AM"
// // // /// customer : "a59b6ef2-e15e-4175-80c3-141e8caf720c"
// // // /// total_amount : "20.0"
// // // /// Delivery_date : null
// // // /// status : "Confirmed"
// // // /// order_date : "2024-03-13"
// // // /// Delivery_time : null
// // // /// order_type : "Normal"
// // // /// net_taxable : "0"
// // // /// vat : "0"
// // //
// // // Order orderFromJson(String str) => Order.fromJson(json.decode(str));
// // // String orderToJson(Order data) => json.encode(data.toJson());
// // // class Order {
// // //   Order({
// // //       this.orderId,
// // //       this.createdDate,
// // //       this.orderNumber,
// // //       this.pickupDate,
// // //       this.pickupTime,
// // //       this.customer,
// // //       this.totalAmount,
// // //       this.deliveryDate,
// // //       this.status,
// // //       this.orderDate,
// // //       this.deliveryTime,
// // //       this.orderType,
// // //       this.netTaxable,
// // //       this.vat,});
// // //
// // //   Order.fromJson(dynamic json) {
// // //     orderId = json['order_id'];
// // //     createdDate = json['created_date'];
// // //     orderNumber = json['order_number'];
// // //     pickupDate = json['pickup_date'];
// // //     pickupTime = json['pickup_time'];
// // //     customer = json['customer'];
// // //     totalAmount = json['total_amount'];
// // //     deliveryDate = json['Delivery_date'];
// // //     status = json['status'];
// // //     orderDate = json['order_date'];
// // //     deliveryTime = json['Delivery_time'];
// // //     orderType = json['order_type'];
// // //     netTaxable = json['net_taxable'];
// // //     vat = json['vat'];
// // //   }
// // //   String? orderId;
// // //   String? createdDate;
// // //   String? orderNumber;
// // //   String? pickupDate;
// // //   String? pickupTime;
// // //   String? customer;
// // //   String? totalAmount;
// // //   dynamic deliveryDate;
// // //   String? status;
// // //   String? orderDate;
// // //   dynamic deliveryTime;
// // //   String? orderType;
// // //   String? netTaxable;
// // //   String? vat;
// // //
// // //   Map<String, dynamic> toJson() {
// // //     final map = <String, dynamic>{};
// // //     map['order_id'] = orderId;
// // //     map['created_date'] = createdDate;
// // //     map['order_number'] = orderNumber;
// // //     map['pickup_date'] = pickupDate;
// // //     map['pickup_time'] = pickupTime;
// // //     map['customer'] = customer;
// // //     map['total_amount'] = totalAmount;
// // //     map['Delivery_date'] = deliveryDate;
// // //     map['status'] = status;
// // //     map['order_date'] = orderDate;
// // //     map['Delivery_time'] = deliveryTime;
// // //     map['order_type'] = orderType;
// // //     map['net_taxable'] = netTaxable;
// // //     map['vat'] = vat;
// // //     return map;
// // //   }
// // //
// // // }