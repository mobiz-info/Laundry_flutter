import 'dart:convert';

class PickerOrderConfirmModel {
  bool status;
  List<PckOrderCnfrmList> data;
  String message;

  PickerOrderConfirmModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerOrderConfirmModel copyWith({
    bool? status,
    List<PckOrderCnfrmList>? data,
    String? message,
  }) =>
      PickerOrderConfirmModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerOrderConfirmModel.fromRawJson(String str) => PickerOrderConfirmModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerOrderConfirmModel.fromJson(Map<String, dynamic> json) => PickerOrderConfirmModel(
    status: json["status"],
    data: List<PckOrderCnfrmList>.from(json["data"].map((x) => PckOrderCnfrmList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class PckOrderCnfrmList {
  Order order;
  List<Cart> cart;

  PckOrderCnfrmList({
    required this.order,
    required this.cart,
  });

  PckOrderCnfrmList copyWith({
    Order? order,
    List<Cart>? cart,
  }) =>
      PckOrderCnfrmList(
        order: order ?? this.order,
        cart: cart ?? this.cart,
      );

  factory PckOrderCnfrmList.fromRawJson(String str) => PckOrderCnfrmList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PckOrderCnfrmList.fromJson(Map<String, dynamic> json) => PckOrderCnfrmList(
    order: Order.fromJson(json["order"]),
    cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "order": order.toJson(),
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
  };
}

class Cart {
  String cartId;
  dynamic createdBy;
  DateTime createdDate;
  String quantity;
  String amount;
  String order;
  String itemService;
  String priceList;
  String serviceCategory;
  String serviceSubCategory;

  Cart({
    required this.cartId,
    required this.createdBy,
    required this.createdDate,
    required this.quantity,
    required this.amount,
    required this.order,
    required this.itemService,
    required this.priceList,
    required this.serviceCategory,
    required this.serviceSubCategory,
  });

  Cart copyWith({
    String? cartId,
    dynamic createdBy,
    DateTime? createdDate,
    String? quantity,
    String? amount,
    String? order,
    String? itemService,
    String? priceList,
    String? serviceCategory,
    String? serviceSubCategory,
  }) =>
      Cart(
        cartId: cartId ?? this.cartId,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        quantity: quantity ?? this.quantity,
        amount: amount ?? this.amount,
        order: order ?? this.order,
        itemService: itemService ?? this.itemService,
        priceList: priceList ?? this.priceList,
        serviceCategory: serviceCategory ?? this.serviceCategory,
        serviceSubCategory: serviceSubCategory ?? this.serviceSubCategory,
      );

  factory Cart.fromRawJson(String str) => Cart.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    cartId: json["cart_id"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    quantity: json["quantity"],
    amount: json["amount"],
    order: json["order"],
    itemService: json["item_service"],
    priceList: json["price_list"],
    serviceCategory: json["service_category"],
    serviceSubCategory: json["service_sub_category"],
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "quantity": quantity,
    "amount": amount,
    "order": order,
    "item_service": itemService,
    "price_list": priceList,
    "service_category": serviceCategory,
    "service_sub_category": serviceSubCategory,
  };
}

class Order {
  String orderId;
  String createdBy;
  DateTime createdDate;
  String orderNumber;
  DateTime pickupDate;
  String pickupTime;
  String pickupMode;
  bool confirmPickup;
  String status;
  String orderType;
  dynamic totalAmount;
  String orderVia;
  DateTime orderDate;
  DateTime deliveryDate;
  String deliveryTime;
  bool paidStatus;
  dynamic discount;
  dynamic netTaxable;
  dynamic vat;
  dynamic grantTotal;
  String staff;
  String customer;
  dynamic invoice;

  Order({
    required this.orderId,
    required this.createdBy,
    required this.createdDate,
    required this.orderNumber,
    required this.pickupDate,
    required this.pickupTime,
    required this.pickupMode,
    required this.confirmPickup,
    required this.status,
    required this.orderType,
    required this.totalAmount,
    required this.orderVia,
    required this.orderDate,
    required this.deliveryDate,
    required this.deliveryTime,
    required this.paidStatus,
    required this.discount,
    required this.netTaxable,
    required this.vat,
    required this.grantTotal,
    required this.staff,
    required this.customer,
    required this.invoice,
  });

  Order copyWith({
    String? orderId,
    String? createdBy,
    DateTime? createdDate,
    String? orderNumber,
    DateTime? pickupDate,
    String? pickupTime,
    String? pickupMode,
    bool? confirmPickup,
    String? status,
    String? orderType,
    dynamic totalAmount,
    String? orderVia,
    DateTime? orderDate,
    DateTime? deliveryDate,
    String? deliveryTime,
    bool? paidStatus,
    dynamic discount,
    dynamic netTaxable,
    dynamic vat,
    dynamic grantTotal,
    String? staff,
    String? customer,
    dynamic invoice,
  }) =>
      Order(
        orderId: orderId ?? this.orderId,
        createdBy: createdBy ?? this.createdBy,
        createdDate: createdDate ?? this.createdDate,
        orderNumber: orderNumber ?? this.orderNumber,
        pickupDate: pickupDate ?? this.pickupDate,
        pickupTime: pickupTime ?? this.pickupTime,
        pickupMode: pickupMode ?? this.pickupMode,
        confirmPickup: confirmPickup ?? this.confirmPickup,
        status: status ?? this.status,
        orderType: orderType ?? this.orderType,
        totalAmount: totalAmount ?? this.totalAmount,
        orderVia: orderVia ?? this.orderVia,
        orderDate: orderDate ?? this.orderDate,
        deliveryDate: deliveryDate ?? this.deliveryDate,
        deliveryTime: deliveryTime ?? this.deliveryTime,
        paidStatus: paidStatus ?? this.paidStatus,
        discount: discount ?? this.discount,
        netTaxable: netTaxable ?? this.netTaxable,
        vat: vat ?? this.vat,
        grantTotal: grantTotal ?? this.grantTotal,
        staff: staff ?? this.staff,
        customer: customer ?? this.customer,
        invoice: invoice ?? this.invoice,
      );

  factory Order.fromRawJson(String str) => Order.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    orderId: json["order_id"],
    createdBy: json["created_by"],
    createdDate: DateTime.parse(json["created_date"]),
    orderNumber: json["order_number"],
    pickupDate: DateTime.parse(json["pickup_date"]),
    pickupTime: json["pickup_time"],
    pickupMode: json["Pickup_mode"],
    confirmPickup: json["confirm_pickup"],
    status: json["status"],
    orderType: json["order_type"],
    totalAmount: json["total_amount"],
    orderVia: json["order_via"],
    orderDate: DateTime.parse(json["order_date"]),
    deliveryDate: DateTime.parse(json["Delivery_date"]),
    deliveryTime: json["Delivery_time"],
    paidStatus: json["paid_status"],
    discount: json["discount"],
    netTaxable: json["net_taxable"],
    vat: json["vat"],
    grantTotal: json["grant_total"],
    staff: json["staff"],
    customer: json["customer"],
    invoice: json["invoice"],
  );

  Map<String, dynamic> toJson() => {
    "order_id": orderId,
    "created_by": createdBy,
    "created_date": createdDate.toIso8601String(),
    "order_number": orderNumber,
    "pickup_date": "${pickupDate.year.toString().padLeft(4, '0')}-${pickupDate.month.toString().padLeft(2, '0')}-${pickupDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "Pickup_mode": pickupMode,
    "confirm_pickup": confirmPickup,
    "status": status,
    "order_type": orderType,
    "total_amount": totalAmount,
    "order_via": orderVia,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "Delivery_date": "${deliveryDate.year.toString().padLeft(4, '0')}-${deliveryDate.month.toString().padLeft(2, '0')}-${deliveryDate.day.toString().padLeft(2, '0')}",
    "Delivery_time": deliveryTime,
    "paid_status": paidStatus,
    "discount": discount,
    "net_taxable": netTaxable,
    "vat": vat,
    "grant_total": grantTotal,
    "staff": staff,
    "customer": customer,
    "invoice": invoice,
  };
}
