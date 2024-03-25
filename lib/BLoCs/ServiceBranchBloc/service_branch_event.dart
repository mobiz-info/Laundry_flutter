part of 'service_branch_bloc.dart';

abstract class ServiceBranchEvent extends Equatable {
  const ServiceBranchEvent();
}

class GetServiceDashEvent extends ServiceBranchEvent {
  final String token;

  const GetServiceDashEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetSerOrderStatusEvent extends ServiceBranchEvent {
  final String token;
  final String mobileNum;
  final String orderNum;

  const GetSerOrderStatusEvent(this.token, this.mobileNum, this.orderNum);

  @override
  List<Object?> get props => [token, mobileNum, orderNum];
}

class GetEngageOrdersEvent extends ServiceBranchEvent {
  final String token;

  const GetEngageOrdersEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetGenInvoiceEvent extends ServiceBranchEvent {
  final String token;

  const GetGenInvoiceEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetSearchInvoiceEvent extends ServiceBranchEvent {
  final String token;
  final String orderNum;

  const GetSearchInvoiceEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetSearchEngageEvent extends ServiceBranchEvent {
  final String token;
  final String orderNum;

  const GetSearchEngageEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetEngageStatusEvent extends ServiceBranchEvent {
  final String token;
  final String? orderNum;

  const GetEngageStatusEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetPendingOrdersEvent extends ServiceBranchEvent {
  final String token;

  const GetPendingOrdersEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetCompletedOrdersEvent extends ServiceBranchEvent {
  final String token;

  const GetCompletedOrdersEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetPendingStatusEvent extends ServiceBranchEvent {
  final String token;
  final String? orderNum;

  const GetPendingStatusEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetCompletedStatusEvent extends ServiceBranchEvent {
  final String token;
  final String? orderNum;

  const GetCompletedStatusEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetReadyDeliveryEvent extends ServiceBranchEvent {
  final String token;

  const GetReadyDeliveryEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetSearchReadyDeliveryEvent extends ServiceBranchEvent {
  final String token;
  final String orderNum;

  const GetSearchReadyDeliveryEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetNewOrderSearchEvent extends ServiceBranchEvent {
  final String token;
  final String mobileNum;

  const GetNewOrderSearchEvent(this.token, this.mobileNum);

  @override
  List<Object?> get props => [token, mobileNum];
}

class GetSerDeliveryModeEvent extends ServiceBranchEvent {
  final String token;

  const GetSerDeliveryModeEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetSerDeliveryDateEvent extends ServiceBranchEvent {
  final String token;
  final String deliveryMode;

  const GetSerDeliveryDateEvent(this.token, this.deliveryMode);

  @override
  List<Object?> get props => [token, deliveryMode];
}

class GetSerDeliveryTimeEvent extends ServiceBranchEvent {
  final String token;
  final String date;

  const GetSerDeliveryTimeEvent(this.token, this.date);

  @override
  List<Object?> get props => [token, date];
}

class GetAddOrderEvent extends ServiceBranchEvent {
  final String token;
  final String customerId;
  final String orderType;
  final String deliveryDate;
  final String deliveryTime;

  const GetAddOrderEvent(this.token, this.customerId, this.orderType, this.deliveryDate, this.deliveryTime);

  @override
  List<Object?> get props => [token, customerId, orderType, deliveryDate, deliveryTime];
}

class GetSearchPendingOrdersEvent extends ServiceBranchEvent {
  final String token;
  final String orderNum;

  const GetSearchPendingOrdersEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetSearchCompletedOrdersEvent extends ServiceBranchEvent {
  final String token;
  final String orderNum;

  const GetSearchCompletedOrdersEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetServiceCategoryEvent extends ServiceBranchEvent {
  final String token;

  const GetServiceCategoryEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetServiceSubCategoryEvent extends ServiceBranchEvent {
  final String token;
  final String categoryId;

  const GetServiceSubCategoryEvent(this.token, this.categoryId);

  @override
  List<Object?> get props => [token, categoryId];
}

class GetAcceptOrdersEvent extends ServiceBranchEvent {
  final String token;

  const GetAcceptOrdersEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetAcceptStatusEvent extends ServiceBranchEvent {
  final String token;

  const GetAcceptStatusEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetServiceItemsListEvent extends ServiceBranchEvent {
  final String token;
  final String catId;
  final String subCatId;
  final String customerId;
  final String orderId;

  const GetServiceItemsListEvent(this.token, this.catId, this.subCatId, this.customerId, this.orderId);

  @override
  List<Object?> get props => [token, catId, subCatId, customerId, orderId];
}

class GetItemsIncDecEvent extends ServiceBranchEvent {
  final String token;
  final String orderId;
  final String priceListId;
  final String itemServiceId;
  final String quantity;

  const GetItemsIncDecEvent(this.token, this.orderId, this.priceListId, this.itemServiceId, this.quantity);

  @override
  List<Object?> get props => [token, orderId, priceListId, itemServiceId, quantity];
}

class GetItemsAddCartEvent extends ServiceBranchEvent {
  final String token;
  final String orderId;
  final String priceListId;
  final String itemServiceId;
  final String quantity;
  final String amount;

  const GetItemsAddCartEvent(this.token, this.orderId, this.priceListId, this.itemServiceId, this.quantity, this.amount);

  @override
  List<Object?> get props => [token, orderId, priceListId, itemServiceId, quantity, amount];
}

class GetSerCartListEvent extends ServiceBranchEvent {
  final String token;
  final String orderId;

  const GetSerCartListEvent(this.token, this.orderId);

  @override
  List<Object?> get props => [token, orderId];
}

class GetSerCartCountEvent extends ServiceBranchEvent {
  final String token;
  final String orderId;

  const GetSerCartCountEvent(this.token, this.orderId);

  @override
  List<Object?> get props => [token, orderId];
}

class GetCartIncDecEvent extends ServiceBranchEvent {
  final String token;
  final String cartId;
  final String orderId;
  final String priceListId;
  final String itemServiceId;
  final String quantity;

  const GetCartIncDecEvent(this.token, this.cartId, this.orderId, this.priceListId, this.itemServiceId, this.quantity);

  @override
  List<Object?> get props => [token, cartId, orderId, priceListId, itemServiceId, quantity];
}

class GetDeliveryAddressEvent extends ServiceBranchEvent {
  // final String token;
  // final String customerId;
  SerCartListData? data;
  Map<String, String?> address;

  GetDeliveryAddressEvent(this.data, this.address);

  @override
  List<Object?> get props => [data, address];
}

class GetPaymentListEvent extends ServiceBranchEvent {
  final String token;

  GetPaymentListEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetCartDeleteEvent extends ServiceBranchEvent {
  final String token;
  final String cartId;

  GetCartDeleteEvent(this.token, this.cartId);

  @override
  List<Object?> get props => [token, cartId];
}

class GetSearchAcceptEvent extends ServiceBranchEvent {
  final String token;
  final String orderNum;

  const GetSearchAcceptEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetNewOrdersEvent extends ServiceBranchEvent {
  final String token;

  const GetNewOrdersEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetNewOrderStatusEvent extends ServiceBranchEvent {
  final String token;
  final String? orderNum;

  const GetNewOrderStatusEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetSearchNewOrderEvent extends ServiceBranchEvent {
  final String token;
  final String orderNum;

  const GetSearchNewOrderEvent(this.token, this.orderNum);

  @override
  List<Object?> get props => [token, orderNum];
}

class GetSerCartWalletBalEvent extends ServiceBranchEvent {
  final String token;
  final String customerId;
  final String orderId;

  const GetSerCartWalletBalEvent(this.token, this.customerId, this.orderId);

  @override
  List<Object?> get props => [token, customerId, orderId];
}

class GetSerPlaceOrderEvent extends ServiceBranchEvent {
  final String token;
  final String customerId;
  final String orderId;
  final int discount;
  final int netTaxable;
  final int vat;
  final int grandTotal;
  final String collectMode;
  final int payedAmount;
  final String customerAddress;

  GetSerPlaceOrderEvent(this.token, this.customerId, this.orderId, this.discount, this.netTaxable, this.vat, this.grandTotal, this.collectMode, this.payedAmount, this.customerAddress);

  @override
  List<Object?> get props => [token, customerId, orderId, discount, netTaxable, vat, grandTotal, collectMode, payedAmount, customerAddress];
}

class GetSerThankYouEvent extends ServiceBranchEvent {
  final String token;
  final String orderId;
  final String customerId;

  const GetSerThankYouEvent(this.token, this.orderId, this.customerId);

  @override
  List<Object?> get props => [token, orderId, customerId];
}