import 'dart:convert';

class PickerAddtoCartModel {
  bool status;
  List<AddCartList> data;
  String message;

  PickerAddtoCartModel({
    required this.status,
    required this.data,
    required this.message,
  });

  PickerAddtoCartModel copyWith({
    bool? status,
    List<AddCartList>? data,
    String? message,
  }) =>
      PickerAddtoCartModel(
        status: status ?? this.status,
        data: data ?? this.data,
        message: message ?? this.message,
      );

  factory PickerAddtoCartModel.fromRawJson(String str) => PickerAddtoCartModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PickerAddtoCartModel.fromJson(Map<String, dynamic> json) => PickerAddtoCartModel(
    status: json["status"],
    data: List<AddCartList>.from(json["data"].map((x) => AddCartList.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class AddCartList {
  String cartId;
  String quantity;
  String amount;
  ItemService itemService;

  AddCartList({
    required this.cartId,
    required this.quantity,
    required this.amount,
    required this.itemService,
  });

  AddCartList copyWith({
    String? cartId,
    String? quantity,
    String? amount,
    ItemService? itemService,
  }) =>
      AddCartList(
        cartId: cartId ?? this.cartId,
        quantity: quantity ?? this.quantity,
        amount: amount ?? this.amount,
        itemService: itemService ?? this.itemService,
      );

  factory AddCartList.fromRawJson(String str) => AddCartList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddCartList.fromJson(Map<String, dynamic> json) => AddCartList(
    cartId: json["cart_id"],
    quantity: json["quantity"],
    amount: json["amount"],
    itemService: ItemService.fromJson(json["item_service"]),
  );

  Map<String, dynamic> toJson() => {
    "cart_id": cartId,
    "quantity": quantity,
    "amount": amount,
    "item_service": itemService.toJson(),
  };
}

class ItemService {
  String itemSerId;
  Item item;

  ItemService({
    required this.itemSerId,
    required this.item,
  });

  ItemService copyWith({
    String? itemSerId,
    Item? item,
  }) =>
      ItemService(
        itemSerId: itemSerId ?? this.itemSerId,
        item: item ?? this.item,
      );

  factory ItemService.fromRawJson(String str) => ItemService.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ItemService.fromJson(Map<String, dynamic> json) => ItemService(
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
