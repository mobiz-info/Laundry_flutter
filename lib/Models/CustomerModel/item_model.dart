import 'dart:convert';

class CustomerItemModel {
  bool status;
  List<List<ItemList>> data;
  String message;

  CustomerItemModel({
    required this.status,
    required this.data,
    required this.message,
  });

  CustomerItemModel copyWith({
    bool? status,
    List<List<ItemList>>? data,
    String? message,
  }) =>
      CustomerItemModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory CustomerItemModel.fromRawJson(String str) => CustomerItemModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CustomerItemModel.fromJson(Map<String, dynamic> json) => CustomerItemModel(
    status: json["status"],
    data: List<List<ItemList>>.from(json["data"].map((x) => List<ItemList>.from(x.map((x) => ItemList.fromJson(x))))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
    "message": message,
  };
}

class ItemList {
  String priceListId;
  String amount;
  ItemServices itemServices;

  ItemList({
    required this.priceListId,
    required this.amount,
    required this.itemServices,
  });

  ItemList copyWith({
    String? priceListId,
    String? amount,
    ItemServices? itemServices,
  }) =>
      ItemList(
        priceListId: priceListId ?? this.priceListId,
        amount: amount ?? this.amount,
        itemServices: itemServices ?? this.itemServices,
      );

  factory ItemList.fromRawJson(String str) => ItemList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    priceListId: json["price_list_id"],
    amount: json["amount"],
    itemServices: ItemServices.fromJson(json["item_services"]),
  );

  Map<String, dynamic> toJson() => {
    "price_list_id": priceListId,
    "amount": amount,
    "item_services": itemServices.toJson(),
  };
}

class ItemServices {
  String itemSerId;
  Item item;

  ItemServices({
    required this.itemSerId,
    required this.item,
  });

  ItemServices copyWith({
    String? itemSerId,
    Item? item,
  }) =>
      ItemServices(
        itemSerId: itemSerId ?? this.itemSerId,
        item: item ?? this.item,
      );

  factory ItemServices.fromRawJson(String str) => ItemServices.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemServices.fromJson(Map<String, dynamic> json) => ItemServices(
    itemSerId: json["item_ser_id"],
    item: Item.fromJson(json["item"]),
  );

  Map<String, dynamic> toJson() => {
    "item_ser_id": itemSerId,
    "item": item.toJson(),
  };
}

class Item {
  String itemId;
  String itemName;
  String itemImage;

  Item({
    required this.itemId,
    required this.itemName,
    required this.itemImage,
  });

  Item copyWith({
    String? itemId,
    String? itemName,
    String? itemImage,
  }) =>
      Item(
        itemId: itemId ?? this.itemId,
        itemName: itemName ?? this.itemName,
        itemImage: itemImage ?? this.itemImage,
      );

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
