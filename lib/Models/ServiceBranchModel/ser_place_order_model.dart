// To parse this JSON data, do
//
//     final serPlaceOrderModel = serPlaceOrderModelFromJson(jsonString);

import 'dart:convert';

SerPlaceOrderModel serPlaceOrderModelFromJson(String str) => SerPlaceOrderModel.fromJson(json.decode(str));

String serPlaceOrderModelToJson(SerPlaceOrderModel data) => json.encode(data.toJson());

class SerPlaceOrderModel {
  final bool? status;
  final List<SerPlaceOrderData>? data;
  final String? message;

  SerPlaceOrderModel({
    this.status,
    this.data,
    this.message,
  });

  factory SerPlaceOrderModel.fromJson(Map<String, dynamic> json) => SerPlaceOrderModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<SerPlaceOrderData>.from(json["data"]!.map((x) => SerPlaceOrderData.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "message": message,
  };
}

class SerPlaceOrderData {
  final DataOrder? order;
  final List<Cart>? cart;

  SerPlaceOrderData({
    this.order,
    this.cart,
  });

  factory SerPlaceOrderData.fromJson(Map<String, dynamic> json) => SerPlaceOrderData(
    order: json["order"] == null ? null : DataOrder.fromJson(json["order"]),
    cart: json["cart"] == null ? [] : List<Cart>.from(json["cart"]!.map((x) => Cart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order": order?.toJson(),
    "cart": cart == null ? [] : List<dynamic>.from(cart!.map((x) => x.toJson())),
  };
}

class Cart {
  final String? cartId;
  final CartOrder? order;
  final String? quantity;
  final String? amount;
  final ItemService? itemService;

  Cart({
    this.cartId,
    this.order,
    this.quantity,
    this.amount,
    this.itemService,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cart_id"],
    order: json["order"] == null ? null : CartOrder.fromJson(json["order"]),
    quantity: json["quantity"],
    amount: json["amount"],
    itemService: json["item_service"] == null ? null : ItemService.fromJson(json["item_service"]),
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "order": order?.toJson(),
    "quantity": quantity,
    "amount": amount,
    "item_service": itemService?.toJson(),
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

class CartOrder {
  final String? orderId;
  final PurpleCustomer? customer;
  final Staff? staff;
  final String? createdBy;
  final DateTime? createdDate;
  final String? orderNumber;
  final DateTime? pickupDate;
  final String? pickupTime;
  final String? pickupMode;
  final bool? confirmPickup;
  final String? status;
  final String? orderType;
  final String? totalAmount;
  final String? orderVia;
  final DateTime? orderDate;
  final dynamic deliveryDate;
  final dynamic deliveryTime;
  final bool? paidStatus;
  final String? discount;
  final String? netTaxable;
  final String? vat;
  final String? grantTotal;
  final dynamic invoice;
  final String? customerAddress;

  CartOrder({
    this.orderId,
    this.customer,
    this.staff,
    this.createdBy,
    this.createdDate,
    this.orderNumber,
    this.pickupDate,
    this.pickupTime,
    this.pickupMode,
    this.confirmPickup,
    this.status,
    this.orderType,
    this.totalAmount,
    this.orderVia,
    this.orderDate,
    this.deliveryDate,
    this.deliveryTime,
    this.paidStatus,
    this.discount,
    this.netTaxable,
    this.vat,
    this.grantTotal,
    this.invoice,
    this.customerAddress,
  });

  factory CartOrder.fromJson(Map<String, dynamic> json) => CartOrder(
    orderId: json["order_id"],
    customer: json["customer"] == null ? null : PurpleCustomer.fromJson(json["customer"]),
    staff: json["staff"] == null ? null : Staff.fromJson(json["staff"]),
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: json["pickup_date"] == null ? null : DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    pickupMode: json["Pickup_mode"],
    confirmPickup: json["confirm_pickup"],
    status: json["status"],
    orderType: json["order_type"],
    totalAmount: json["total_amount"],
    orderVia: json["order_via"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    deliveryDate: json["Delivery_date"],
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    discount: json["discount"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    grantTotal: json["grant_total"],
    invoice: json["invoice"],
    customerAddress: json["customer_address"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "customer": customer?.toJson(),
    "staff": staff?.toJson(),
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "Pickup_mode": pickupMode,
    "confirm_pickup": confirmPickup,
    "status": status,
    "order_type": orderType,
    "total_amount": totalAmount,
    "order_via": orderVia,
    "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
    "Delivery_date": deliveryDate,
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "discount": discount,
    "net_taxable": netTaxable,
    "vat": vat,
    "grant_total": grantTotal,
    "invoice": invoice,
    "customer_address": customerAddress,
  };
}

class PurpleCustomer {
  final String? customerId;
  final String? createdBy;
  final DateTime? createdDate;
  final String? name;
  final String? customerType;
  final String? buildingNo;
  final String? roomNo;
  final String? mobile;
  final dynamic altMobile;
  final String? whatsApp;
  final dynamic creditLimit;
  final dynamic creditDays;
  final dynamic creditInvoices;
  final String? gpse;
  final String? gpsn;
  final String? status;
  final dynamic trn;
  final dynamic billingAddrs;
  final dynamic designation;
  final String? buildingName;
  final String? floorNumber;
  final String? flatNumber;
  final String? altEmail;
  final dynamic companyName;
  final int? user;
  final String? staff;
  final String? location;
  final String? pricegroup;

  PurpleCustomer({
    this.customerId,
    this.createdBy,
    this.createdDate,
    this.name,
    this.customerType,
    this.buildingNo,
    this.roomNo,
    this.mobile,
    this.altMobile,
    this.whatsApp,
    this.creditLimit,
    this.creditDays,
    this.creditInvoices,
    this.gpse,
    this.gpsn,
    this.status,
    this.trn,
    this.billingAddrs,
    this.designation,
    this.buildingName,
    this.floorNumber,
    this.flatNumber,
    this.altEmail,
    this.companyName,
    this.user,
    this.staff,
    this.location,
    this.pricegroup,
  });

  factory PurpleCustomer.fromJson(Map<String, dynamic> json) => PurpleCustomer(
    customerId: json["customer_id"],
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    name: json["name"],
    customerType: json["customer_type"],
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    mobile: json["mobile"],
    altMobile: json["alt_mobile"],
    whatsApp: json["whats_app"],
    creditLimit: json["credit_limit"],
    creditDays: json["credit_days"],
    creditInvoices: json["credit_invoices"],
    gpse: json["GPSE"],
    gpsn: json["GPSN"],
    status: json["status"],
    trn: json["TRN"],
    billingAddrs: json["billing_addrs"],
    designation: json["designation"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
    altEmail: json["alt_email"],
    companyName: json["company_name"],
    user: json["user"],
    staff: json["staff"],
    location: json["Location"],
    pricegroup: json["Pricegroup"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "name": name,
    "customer_type": customerType,
    "building_no": buildingNo,
    "room_no": roomNo,
    "mobile": mobile,
    "alt_mobile": altMobile,
    "whats_app": whatsApp,
    "credit_limit": creditLimit,
    "credit_days": creditDays,
    "credit_invoices": creditInvoices,
    "GPSE": gpse,
    "GPSN": gpsn,
    "status": status,
    "TRN": trn,
    "billing_addrs": billingAddrs,
    "designation": designation,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
    "alt_email": altEmail,
    "company_name": companyName,
    "user": user,
    "staff": staff,
    "Location": location,
    "Pricegroup": pricegroup,
  };
}

class Staff {
  final String? staffId;
  final String? name;
  final String? curMobile;
  final String? perMobile;

  Staff({
    this.staffId,
    this.name,
    this.curMobile,
    this.perMobile,
  });

  factory Staff.fromJson(Map<String, dynamic> json) => Staff(
    staffId: json["staff_id"],
    name: json["name"],
    curMobile: json["cur_mobile"],
    perMobile: json["per_mobile"],
  );

  Map<String, dynamic> toJson() => {
    "staff_id": staffId,
    "name": name,
    "cur_mobile": curMobile,
    "per_mobile": perMobile,
  };
}

class DataOrder {
  final String? orderId;
  final FluffyCustomer? customer;
  final String? createdBy;
  final DateTime? createdDate;
  final String? orderNumber;
  final DateTime? pickupDate;
  final String? pickupTime;
  final String? pickupMode;
  final bool? confirmPickup;
  final String? status;
  final String? orderType;
  final String? totalAmount;
  final String? orderVia;
  final DateTime? orderDate;
  final dynamic deliveryDate;
  final dynamic deliveryTime;
  final bool? paidStatus;
  final String? discount;
  final String? netTaxable;
  final String? vat;
  final String? grantTotal;
  final String? staff;
  final dynamic invoice;
  final String? customerAddress;

  DataOrder({
    this.orderId,
    this.customer,
    this.createdBy,
    this.createdDate,
    this.orderNumber,
    this.pickupDate,
    this.pickupTime,
    this.pickupMode,
    this.confirmPickup,
    this.status,
    this.orderType,
    this.totalAmount,
    this.orderVia,
    this.orderDate,
    this.deliveryDate,
    this.deliveryTime,
    this.paidStatus,
    this.discount,
    this.netTaxable,
    this.vat,
    this.grantTotal,
    this.staff,
    this.invoice,
    this.customerAddress,
  });

  factory DataOrder.fromJson(Map<String, dynamic> json) => DataOrder(
    orderId: json["order_id"],
    customer: json["customer"] == null ? null : FluffyCustomer.fromJson(json["customer"]),
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: json["pickup_date"] == null ? null : DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    pickupMode: json["Pickup_mode"],
    confirmPickup: json["confirm_pickup"],
    status: json["status"],
    orderType: json["order_type"],
    totalAmount: json["total_amount"],
    orderVia: json["order_via"],
    orderDate: json["order_date"] == null ? null : DateTime.parse(json["order_date"]),
    deliveryDate: json["Delivery_date"],
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    discount: json["discount"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    grantTotal: json["grant_total"],
    staff: json["staff"],
    invoice: json["invoice"],
    customerAddress: json["customer_address"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "customer": customer?.toJson(),
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate!.year.toString().padLeft(4, '0')}-${pickupDate!.month.toString().padLeft(2, '0')}-${pickupDate!.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "Pickup_mode": pickupMode,
    "confirm_pickup": confirmPickup,
    "status": status,
    "order_type": orderType,
    "total_amount": totalAmount,
    "order_via": orderVia,
    "order_date": "${orderDate!.year.toString().padLeft(4, '0')}-${orderDate!.month.toString().padLeft(2, '0')}-${orderDate!.day.toString().padLeft(2, '0')}",
    "Delivery_date": deliveryDate,
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "discount": discount,
    "net_taxable": netTaxable,
    "vat": vat,
    "grant_total": grantTotal,
    "staff": staff,
    "invoice": invoice,
    "customer_address": customerAddress,
  };
}

class FluffyCustomer {
  final String? customerId;
  final Location? location;
  final String? createdBy;
  final DateTime? createdDate;
  final String? name;
  final String? customerType;
  final String? buildingNo;
  final String? roomNo;
  final String? mobile;
  final dynamic altMobile;
  final String? whatsApp;
  final dynamic creditLimit;
  final dynamic creditDays;
  final dynamic creditInvoices;
  final String? gpse;
  final String? gpsn;
  final String? status;
  final dynamic trn;
  final dynamic billingAddrs;
  final dynamic designation;
  final String? buildingName;
  final String? floorNumber;
  final String? flatNumber;
  final String? altEmail;
  final dynamic companyName;
  final int? user;
  final String? staff;
  final String? pricegroup;

  FluffyCustomer({
    this.customerId,
    this.location,
    this.createdBy,
    this.createdDate,
    this.name,
    this.customerType,
    this.buildingNo,
    this.roomNo,
    this.mobile,
    this.altMobile,
    this.whatsApp,
    this.creditLimit,
    this.creditDays,
    this.creditInvoices,
    this.gpse,
    this.gpsn,
    this.status,
    this.trn,
    this.billingAddrs,
    this.designation,
    this.buildingName,
    this.floorNumber,
    this.flatNumber,
    this.altEmail,
    this.companyName,
    this.user,
    this.staff,
    this.pricegroup,
  });

  factory FluffyCustomer.fromJson(Map<String, dynamic> json) => FluffyCustomer(
    customerId: json["customer_id"],
    location: json["Location"] == null ? null : Location.fromJson(json["Location"]),
    createdBy: json["created_by"],
    createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
    name: json["name"],
    customerType: json["customer_type"],
    buildingNo: json["building_no"],
    roomNo: json["room_no"],
    mobile: json["mobile"],
    altMobile: json["alt_mobile"],
    whatsApp: json["whats_app"],
    creditLimit: json["credit_limit"],
    creditDays: json["credit_days"],
    creditInvoices: json["credit_invoices"],
    gpse: json["GPSE"],
    gpsn: json["GPSN"],
    status: json["status"],
    trn: json["TRN"],
    billingAddrs: json["billing_addrs"],
    designation: json["designation"],
    buildingName: json["building_name"],
    floorNumber: json["floor_number"],
    flatNumber: json["flat_number"],
    altEmail: json["alt_email"],
    companyName: json["company_name"],
    user: json["user"],
    staff: json["staff"],
    pricegroup: json["Pricegroup"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "Location": location?.toJson(),
    "created_by": createdBy,
    "created_date": createdDate?.toIso8601String(),
    "name": name,
    "customer_type": customerType,
    "building_no": buildingNo,
    "room_no": roomNo,
    "mobile": mobile,
    "alt_mobile": altMobile,
    "whats_app": whatsApp,
    "credit_limit": creditLimit,
    "credit_days": creditDays,
    "credit_invoices": creditInvoices,
    "GPSE": gpse,
    "GPSN": gpsn,
    "status": status,
    "TRN": trn,
    "billing_addrs": billingAddrs,
    "designation": designation,
    "building_name": buildingName,
    "floor_number": floorNumber,
    "flat_number": flatNumber,
    "alt_email": altEmail,
    "company_name": companyName,
    "user": user,
    "staff": staff,
    "Pricegroup": pricegroup,
  };
}

class Location {
  final String? name;

  Location({
    this.name,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
