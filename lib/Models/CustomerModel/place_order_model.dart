import 'dart:convert';
/// status : true
/// data : [{"order":{"order_id":"ae45283c-d4b7-4f61-88d9-e5a1187f8b90","order_number":"261d7124","pickup_date":"2024-01-31","pickup_time":"09:00 AM - 10:00 AM","staff":{"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0"},"customer":{"customer_id":"a59b6ef2-e15e-4175-80c3-141e8caf720c","name":"Deepesh Georgee","mobile":"0564529335"},"order_type":"Normal","status":"Confirmed","Delivery_date":null,"Delivery_time":null},"cart":[{"cart_id":"5a2766b0-4d23-405d-9b50-af73f97ef853","item_service":{"item_ser_id":"c837b09e-f3d1-44bf-9ad8-c39b371235ba","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}},"sub_category":{"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":"0541b01d-12ba-4c36-8b40-0976091023e9"}},"quantity":"1","amount":"20"}]}]
/// message : "Payment Added Successfully!"

PlaceOrderModel placeOrderModelFromJson(String str) => PlaceOrderModel.fromJson(json.decode(str));
String placeOrderModelToJson(PlaceOrderModel data) => json.encode(data.toJson());
class PlaceOrderModel {
  PlaceOrderModel({
      this.status, 
      this.data, 
      this.message,});

  PlaceOrderModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(PlaceOrderData.fromJson(v));
      });
    }
    message = json['message'];
  }
  bool? status;
  List<PlaceOrderData>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['message'] = message;
    return map;
  }

}

/// order : {"order_id":"ae45283c-d4b7-4f61-88d9-e5a1187f8b90","order_number":"261d7124","pickup_date":"2024-01-31","pickup_time":"09:00 AM - 10:00 AM","staff":{"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0"},"customer":{"customer_id":"a59b6ef2-e15e-4175-80c3-141e8caf720c","name":"Deepesh Georgee","mobile":"0564529335"},"order_type":"Normal","status":"Confirmed","Delivery_date":null,"Delivery_time":null}
/// cart : [{"cart_id":"5a2766b0-4d23-405d-9b50-af73f97ef853","item_service":{"item_ser_id":"c837b09e-f3d1-44bf-9ad8-c39b371235ba","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}},"sub_category":{"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":"0541b01d-12ba-4c36-8b40-0976091023e9"}},"quantity":"1","amount":"20"}]

PlaceOrderData dataFromJson(String str) => PlaceOrderData.fromJson(json.decode(str));
String dataToJson(PlaceOrderData data) => json.encode(data.toJson());
class PlaceOrderData {
  PlaceOrderData({
      this.order, 
      this.cart,});

  PlaceOrderData.fromJson(dynamic json) {
    order = json['order'] != null ? Order.fromJson(json['order']) : null;
    if (json['cart'] != null) {
      cart = [];
      json['cart'].forEach((v) {
        cart?.add(Cart.fromJson(v));
      });
    }
  }
  Order? order;
  List<Cart>? cart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (order != null) {
      map['order'] = order?.toJson();
    }
    if (cart != null) {
      map['cart'] = cart?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// cart_id : "5a2766b0-4d23-405d-9b50-af73f97ef853"
/// item_service : {"item_ser_id":"c837b09e-f3d1-44bf-9ad8-c39b371235ba","item":{"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"},"category":{"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}},"sub_category":{"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":"0541b01d-12ba-4c36-8b40-0976091023e9"}}
/// quantity : "1"
/// amount : "20"

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));
String cartToJson(Cart data) => json.encode(data.toJson());
class Cart {
  Cart({
      this.cartId, 
      this.itemService, 
      this.quantity, 
      this.amount,});

  Cart.fromJson(dynamic json) {
    cartId = json['cart_id'];
    itemService = json['item_service'] != null ? ItemService.fromJson(json['item_service']) : null;
    quantity = json['quantity'];
    amount = json['amount'];
  }
  String? cartId;
  ItemService? itemService;
  String? quantity;
  String? amount;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cart_id'] = cartId;
    if (itemService != null) {
      map['item_service'] = itemService?.toJson();
    }
    map['quantity'] = quantity;
    map['amount'] = amount;
    return map;
  }

}

/// item_ser_id : "c837b09e-f3d1-44bf-9ad8-c39b371235ba"
/// item : {"item_id":"a4b6880c-faa4-4dda-9e28-b3b690e8df95","item_name":"Shirts","item_image":"/media/shirts.jpeg"}
/// category : {"category_id":"ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b","service_master":{"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}}
/// sub_category : {"sub_cat_id":"ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955","sub_service_master":"0541b01d-12ba-4c36-8b40-0976091023e9"}

ItemService itemServiceFromJson(String str) => ItemService.fromJson(json.decode(str));
String itemServiceToJson(ItemService data) => json.encode(data.toJson());
class ItemService {
  ItemService({
      this.itemSerId, 
      this.item, 
      this.category, 
      this.subCategory,});

  ItemService.fromJson(dynamic json) {
    itemSerId = json['item_ser_id'];
    item = json['item'] != null ? Item.fromJson(json['item']) : null;
    category = json['category'] != null ? Category.fromJson(json['category']) : null;
    subCategory = json['sub_category'] != null ? SubCategory.fromJson(json['sub_category']) : null;
  }
  String? itemSerId;
  Item? item;
  Category? category;
  SubCategory? subCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_ser_id'] = itemSerId;
    if (item != null) {
      map['item'] = item?.toJson();
    }
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (subCategory != null) {
      map['sub_category'] = subCategory?.toJson();
    }
    return map;
  }

}

/// sub_cat_id : "ac5cbc4f-7dbe-40cd-9e42-e7e3e0aa8955"
/// sub_service_master : "0541b01d-12ba-4c36-8b40-0976091023e9"

SubCategory subCategoryFromJson(String str) => SubCategory.fromJson(json.decode(str));
String subCategoryToJson(SubCategory data) => json.encode(data.toJson());
class SubCategory {
  SubCategory({
      this.subCatId, 
      this.subServiceMaster,});

  SubCategory.fromJson(dynamic json) {
    subCatId = json['sub_cat_id'];
    subServiceMaster = json['sub_service_master'];
  }
  String? subCatId;
  String? subServiceMaster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sub_cat_id'] = subCatId;
    map['sub_service_master'] = subServiceMaster;
    return map;
  }

}

/// category_id : "ee6b720e-f5aa-45aa-9d7b-c55f2c37fd9b"
/// service_master : {"category_name":"Dry Cleaning","category_image":"/media/dry.jpeg"}

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));
String categoryToJson(Category data) => json.encode(data.toJson());
class Category {
  Category({
      this.categoryId, 
      this.serviceMaster,});

  Category.fromJson(dynamic json) {
    categoryId = json['category_id'];
    serviceMaster = json['service_master'] != null ? ServiceMaster.fromJson(json['service_master']) : null;
  }
  String? categoryId;
  ServiceMaster? serviceMaster;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = categoryId;
    if (serviceMaster != null) {
      map['service_master'] = serviceMaster?.toJson();
    }
    return map;
  }

}

/// category_name : "Dry Cleaning"
/// category_image : "/media/dry.jpeg"

ServiceMaster serviceMasterFromJson(String str) => ServiceMaster.fromJson(json.decode(str));
String serviceMasterToJson(ServiceMaster data) => json.encode(data.toJson());
class ServiceMaster {
  ServiceMaster({
      this.categoryName, 
      this.categoryImage,});

  ServiceMaster.fromJson(dynamic json) {
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
  }
  String? categoryName;
  String? categoryImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_name'] = categoryName;
    map['category_image'] = categoryImage;
    return map;
  }

}

/// item_id : "a4b6880c-faa4-4dda-9e28-b3b690e8df95"
/// item_name : "Shirts"
/// item_image : "/media/shirts.jpeg"

Item itemFromJson(String str) => Item.fromJson(json.decode(str));
String itemToJson(Item data) => json.encode(data.toJson());
class Item {
  Item({
      this.itemId, 
      this.itemName, 
      this.itemImage,});

  Item.fromJson(dynamic json) {
    itemId = json['item_id'];
    itemName = json['item_name'];
    itemImage = json['item_image'];
  }
  String? itemId;
  String? itemName;
  String? itemImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['item_id'] = itemId;
    map['item_name'] = itemName;
    map['item_image'] = itemImage;
    return map;
  }

}

/// order_id : "ae45283c-d4b7-4f61-88d9-e5a1187f8b90"
/// order_number : "261d7124"
/// pickup_date : "2024-01-31"
/// pickup_time : "09:00 AM - 10:00 AM"
/// staff : {"staff_id":"20c15a06-0797-413b-823a-c533e52c047e","name":"Ashok","cur_mobile":"0"}
/// customer : {"customer_id":"a59b6ef2-e15e-4175-80c3-141e8caf720c","name":"Deepesh Georgee","mobile":"0564529335"}
/// order_type : "Normal"
/// status : "Confirmed"
/// Delivery_date : null
/// Delivery_time : null

Order orderFromJson(String str) => Order.fromJson(json.decode(str));
String orderToJson(Order data) => json.encode(data.toJson());
class Order {
  Order({
      this.orderId, 
      this.orderNumber, 
      this.pickupDate, 
      this.pickupTime, 
      this.staff, 
      this.customer, 
      this.orderType, 
      this.status, 
      this.deliveryDate, 
      this.deliveryTime,});

  Order.fromJson(dynamic json) {
    orderId = json['order_id'];
    orderNumber = json['order_number'];
    pickupDate = json['pickup_date'];
    pickupTime = json['pickup_time'];
    staff = json['staff'] != null ? Staff.fromJson(json['staff']) : null;
    customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    orderType = json['order_type'];
    status = json['status'];
    deliveryDate = json['Delivery_date'];
    deliveryTime = json['Delivery_time'];
  }
  String? orderId;
  String? orderNumber;
  String? pickupDate;
  String? pickupTime;
  Staff? staff;
  Customer? customer;
  String? orderType;
  String? status;
  dynamic deliveryDate;
  dynamic deliveryTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = orderId;
    map['order_number'] = orderNumber;
    map['pickup_date'] = pickupDate;
    map['pickup_time'] = pickupTime;
    if (staff != null) {
      map['staff'] = staff?.toJson();
    }
    if (customer != null) {
      map['customer'] = customer?.toJson();
    }
    map['order_type'] = orderType;
    map['status'] = status;
    map['Delivery_date'] = deliveryDate;
    map['Delivery_time'] = deliveryTime;
    return map;
  }

}

/// customer_id : "a59b6ef2-e15e-4175-80c3-141e8caf720c"
/// name : "Deepesh Georgee"
/// mobile : "0564529335"

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));
String customerToJson(Customer data) => json.encode(data.toJson());
class Customer {
  Customer({
      this.customerId, 
      this.name, 
      this.mobile,});

  Customer.fromJson(dynamic json) {
    customerId = json['customer_id'];
    name = json['name'];
    mobile = json['mobile'];
  }
  String? customerId;
  String? name;
  String? mobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['customer_id'] = customerId;
    map['name'] = name;
    map['mobile'] = mobile;
    return map;
  }

}

/// staff_id : "20c15a06-0797-413b-823a-c533e52c047e"
/// name : "Ashok"
/// cur_mobile : "0"

Staff staffFromJson(String str) => Staff.fromJson(json.decode(str));
String staffToJson(Staff data) => json.encode(data.toJson());
class Staff {
  Staff({
      this.staffId, 
      this.name, 
      this.curMobile,});

  Staff.fromJson(dynamic json) {
    staffId = json['staff_id'];
    name = json['name'];
    curMobile = json['cur_mobile'];
  }
  String? staffId;
  String? name;
  String? curMobile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['staff_id'] = staffId;
    map['name'] = name;
    map['cur_mobile'] = curMobile;
    return map;
  }

}