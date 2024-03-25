// To parse this JSON data, do
//
//     final itemAddtoCartModel = itemAddtoCartModelFromJson(jsonString);

import 'dart:convert';

ItemAddtoCartModel itemAddtoCartModelFromJson(String str) => ItemAddtoCartModel.fromJson(json.decode(str));

String itemAddtoCartModelToJson(ItemAddtoCartModel data) => json.encode(data.toJson());

class ItemAddtoCartModel {
  final bool? status;
  final AddCartData? data;
  final String? message;

  ItemAddtoCartModel({
    this.status,
    this.data,
    this.message,
  });

  factory ItemAddtoCartModel.fromJson(Map<String, dynamic> json) => ItemAddtoCartModel(
    status: json["status"],
    data: json["data"] == null ? null : AddCartData.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class AddCartData {
  final List<Cart>? cart;
  final int? cartCount;

  AddCartData({
    this.cart,
    this.cartCount,
  });

  factory AddCartData.fromJson(Map<String, dynamic> json) => AddCartData(
    cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
    cartCount: json["cart_count"],
  );

  Map<String, dynamic> toJson() => {
    "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
    "cart_count": cartCount,
  };
}

class Cart {
  final String? cartId;
  final ItemService? itemService;
  final String? quantity;
  final String? amount;

  Cart({
    this.cartId,
    this.itemService,
    this.quantity,
    this.amount,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cart_id"],
    itemService: json["item_service"] == null ? null : ItemService.fromJson(json["item_service"]),
    quantity: json["quantity"],
    amount: json["amount"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "item_service": itemService?.toJson(),
    "quantity": quantity,
    "amount": amount,
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
  final String? subServiceMaster;

  SubCategory({
    this.subCatId,
    this.subServiceMaster,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    subCatId: json["sub_cat_id"],
    subServiceMaster: json["sub_service_master"],
  );

  Map<String, dynamic> toJson() => {
    "sub_cat_id": subCatId,
    "sub_service_master": subServiceMaster,
  };
}

// // To parse this JSON data, do
// //
// //     final itemAddtoCartModel = itemAddtoCartModelFromJson(jsonString);
//
// import 'dart:convert';
//
// ItemAddtoCartModel itemAddtoCartModelFromJson(String str) => ItemAddtoCartModel.fromJson(json.decode(str));
//
// String itemAddtoCartModelToJson(ItemAddtoCartModel data) => json.encode(data.toJson());
//
// class ItemAddtoCartModel {
//   final bool? status;
//   final AddCartData? data;
//   final String? message;
//
//   ItemAddtoCartModel({
//     this.status,
//     this.data,
//     this.message,
//   });
//
//   factory ItemAddtoCartModel.fromJson(Map<String, dynamic> json) => ItemAddtoCartModel(
//     status: json["status"],
//     data: json["data"] == null ? null : AddCartData.fromJson(json["data"]),
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
// class AddCartData {
//   final List<Cart>? cart;
//   final int? cartCount;
//
//   AddCartData({
//     this.cart,
//     this.cartCount,
//   });
//
//   factory AddCartData.fromJson(Map<String, dynamic> json) => AddCartData(
//     cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
//     cartCount: json["cart_count"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
//     "cart_count": cartCount,
//   };
// }
//
// class Cart {
//   final String? cartId;
//   final Order? order;
//   final String? quantity;
//   final String? amount;
//   final ItemService? itemService;
//
//   Cart({
//     this.cartId,
//     this.order,
//     this.quantity,
//     this.amount,
//     this.itemService,
//   });
//
//   factory Cart.fromJson(Map<String, dynamic> json) => Cart(
//     cartId: json["cart_id"],
//     order: json["order"] == null ? null : Order.fromJson(json["order"]),
//     quantity: json["quantity"],
//     amount: json["amount"],
//     itemService: json["item_service"] == null ? null : ItemService.fromJson(json["item_service"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "cart_id": cartId,
//     "order": order?.toJson(),
//     "quantity": quantity,
//     "amount": amount,
//     "item_service": itemService?.toJson(),
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
//   final String? orderNumber;
//   final String? totalAmount;
//   final dynamic pickupDate;
//   final dynamic pickupTime;
//   final dynamic staff;
//   final Customer? customer;
//   final String? orderType;
//   final String? status;
//   final DateTime? deliveryDate;
//   final String? deliveryTime;
//
//   Order({
//     this.orderId,
//     this.orderNumber,
//     this.totalAmount,
//     this.pickupDate,
//     this.pickupTime,
//     this.staff,
//     this.customer,
//     this.orderType,
//     this.status,
//     this.deliveryDate,
//     this.deliveryTime,
//   });
//
//   factory Order.fromJson(Map<String, dynamic> json) => Order(
//     orderId: json["order_id"],
//     orderNumber: json["order_number"],
//     totalAmount: json["total_amount"],
//     pickupDate: json["pickup_date"],
//     pickupTime: json["pickup_time"],
//     staff: json["staff"],
//     customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
//     orderType: json["order_type"],
//     status: json["status"],
//     deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
//     deliveryTime: json["Delivery_time"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "order_id": orderId,
//     "order_number": orderNumber,
//     "total_amount": totalAmount,
//     "pickup_date": pickupDate,
//     "pickup_time": pickupTime,
//     "staff": staff,
//     "customer": customer?.toJson(),
//     "order_type": orderType,
//     "status": status,
//     "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
//     "Delivery_time": deliveryTime,
//   };
// }
//
// class Customer {
//   final String? customerId;
//   final String? name;
//   final String? mobile;
//
//   Customer({
//     this.customerId,
//     this.name,
//     this.mobile,
//   });
//
//   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
//     customerId: json["customer_id"],
//     name: json["name"],
//     mobile: json["mobile"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "customer_id": customerId,
//     "name": name,
//     "mobile": mobile,
//   };
// }
//
// // // To parse this JSON data, do
// // //
// // //     final itemAddtoCart = itemAddtoCartFromJson(jsonString);
// //
// // import 'dart:convert';
// //
// // ItemAddtoCartModel itemAddtoCartFromJson(String str) => ItemAddtoCartModel.fromJson(json.decode(str));
// //
// // String itemAddtoCartToJson(ItemAddtoCartModel data) => json.encode(data.toJson());
// //
// // class ItemAddtoCartModel {
// //   final bool? status;
// //   final List<AddCartData>? data;
// //   final String? message;
// //
// //   ItemAddtoCartModel({
// //     this.status,
// //     this.data,
// //     this.message,
// //   });
// //
// //   factory ItemAddtoCartModel.fromJson(Map<String, dynamic> json) => ItemAddtoCartModel(
// //     status: json["status"],
// //     data: json["data"] == null ? [] : List<AddCartData>.from(json["data"]!.map((x) => AddCartData.fromJson(x))),
// //     message: json["message"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "status": status,
// //     "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
// //     "message": message,
// //   };
// // }
// //
// // class AddCartData {
// //   final String? cartId;
// //   final Order? order;
// //   final String? quantity;
// //   final String? amount;
// //   final ItemService? itemService;
// //
// //   AddCartData({
// //     this.cartId,
// //     this.order,
// //     this.quantity,
// //     this.amount,
// //     this.itemService,
// //   });
// //
// //   factory AddCartData.fromJson(Map<String, dynamic> json) => AddCartData(
// //     cartId: json["cart_id"],
// //     order: json["order"] == null ? null : Order.fromJson(json["order"]),
// //     quantity: json["quantity"],
// //     amount: json["amount"],
// //     itemService: json["item_service"] == null ? null : ItemService.fromJson(json["item_service"]),
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "cart_id": cartId,
// //     "order": order?.toJson(),
// //     "quantity": quantity,
// //     "amount": amount,
// //     "item_service": itemService?.toJson(),
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
// //   final Customer? customer;
// //   final dynamic staff;
// //   final String? createdBy;
// //   final DateTime? createdDate;
// //   final String? orderNumber;
// //   final dynamic pickupDate;
// //   final dynamic pickupTime;
// //   final String? pickupMode;
// //   final bool? confirmPickup;
// //   final String? status;
// //   final String? orderType;
// //   final String? totalAmount;
// //   final String? orderVia;
// //   final DateTime? orderDate;
// //   final DateTime? deliveryDate;
// //   final String? deliveryTime;
// //   final bool? paidStatus;
// //   final dynamic discount;
// //   final dynamic netTaxable;
// //   final dynamic vat;
// //   final dynamic grantTotal;
// //   final dynamic invoice;
// //
// //   Order({
// //     this.orderId,
// //     this.customer,
// //     this.staff,
// //     this.createdBy,
// //     this.createdDate,
// //     this.orderNumber,
// //     this.pickupDate,
// //     this.pickupTime,
// //     this.pickupMode,
// //     this.confirmPickup,
// //     this.status,
// //     this.orderType,
// //     this.totalAmount,
// //     this.orderVia,
// //     this.orderDate,
// //     this.deliveryDate,
// //     this.deliveryTime,
// //     this.paidStatus,
// //     this.discount,
// //     this.netTaxable,
// //     this.vat,
// //     this.grantTotal,
// //     this.invoice,
// //   });
// //
// //   factory Order.fromJson(Map<String, dynamic> json) => Order(
// //     orderId: json["order_id"],
// //     customer: json["customer"] == null ? null : Customer.fromJson(json["customer"]),
// //     staff: json["staff"],
// //     createdBy: json["created_by"],
// //     createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
// //     orderNumber: json["order_number"],
// //     pickupDate: json["pickup_date"],
// //     pickupTime: json["pickup_time"],
// //     pickupMode: json["Pickup_mode"],
// //     confirmPickup: json["confirm_pickup"],
// //     status: json["status"],
// //     orderType: json["order_type"],
// //     totalAmount: json["total_amount"],
// //     orderVia: json["order_via"],
// //     orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
// //     deliveryDate: json["Delivery_date"] == null ? null : DateTime.parse(json["Delivery_date"]),
// //     deliveryTime: json["Delivery_time"],
// //     paidStatus: json["paid_status"],
// //     discount: json["discount"],
// //     netTaxable: json["net_taxable"],
// //     vat: json["vat"],
// //     grantTotal: json["grant_total"],
// //     invoice: json["invoice"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "order_id": orderId,
// //     "customer": customer?.toJson(),
// //     "staff": staff,
// //     "created_by": createdBy,
// //     "created_date": createdDate?.toIso8601String(),
// //     "order_number": orderNumber,
// //     "pickup_date": pickupDate,
// //     "pickup_time": pickupTime,
// //     "Pickup_mode": pickupMode,
// //     "confirm_pickup": confirmPickup,
// //     "status": status,
// //     "order_type": orderType,
// //     "total_amount": totalAmount,
// //     "order_via": orderVia,
// //     "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
// //     "Delivery_date": "${deliveryDate!.year.toString().padLeft(4, '0')}-${deliveryDate!.month.toString().padLeft(2, '0')}-${deliveryDate!.day.toString().padLeft(2, '0')}",
// //     "Delivery_time": deliveryTime,
// //     "paid_status": paidStatus,
// //     "discount": discount,
// //     "net_taxable": netTaxable,
// //     "vat": vat,
// //     "grant_total": grantTotal,
// //     "invoice": invoice,
// //   };
// // }
// //
// // class Customer {
// //   final String? customerId;
// //   final String? name;
// //   final String? mobile;
// //
// //   Customer({
// //     this.customerId,
// //     this.name,
// //     this.mobile,
// //   });
// //
// //   factory Customer.fromJson(Map<String, dynamic> json) => Customer(
// //     customerId: json["customer_id"],
// //     name: json["name"],
// //     mobile: json["mobile"],
// //   );
// //
// //   Map<String, dynamic> toJson() => {
// //     "customer_id": customerId,
// //     "name": name,
// //     "mobile": mobile,
// //   };
// // }
