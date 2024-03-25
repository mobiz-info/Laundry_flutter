part of 'service_branch_bloc.dart';

abstract class ServiceBranchState extends Equatable {
  const ServiceBranchState();
}

class ServiceBranchInitial extends ServiceBranchState {
  @override
  List<Object> get props => [];
}

class ServiceDashFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class ServiceDashFetched extends ServiceBranchState {
  final ServiceDashboardData? serviceDashboardData;

  const ServiceDashFetched(this.serviceDashboardData);

  @override
  List<Object?> get props => [serviceDashboardData];
}

class ServiceDashError extends ServiceBranchState {
  final String message;

  const ServiceDashError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerOrderStatusFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerOrderStatusFetched extends ServiceBranchState {
  final List<OrderStatusData>? orderStatusData;

  const SerOrderStatusFetched(this.orderStatusData);

  @override
  List<Object?> get props => [orderStatusData];
}

class SerOrderStatusError extends ServiceBranchState {
  final String message;

  const SerOrderStatusError(this.message);

  @override
  List<Object?> get props => [message];
}

class EngageOrdersFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class EngageOrdersFetched extends ServiceBranchState {
  final EngageOrdersData? engageOrdersData;

  const EngageOrdersFetched(this.engageOrdersData);

  @override
  List<Object?> get props => [engageOrdersData];
}

class EngageOrdersError extends ServiceBranchState {
  final String message;

  const EngageOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

class GenInvoiceFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class GenInvoiceFetched extends ServiceBranchState {
  final GenerateInvoiceData? generateInvoiceData;

  const GenInvoiceFetched(this.generateInvoiceData);

  @override
  List<Object?> get props => [generateInvoiceData];
}

class GenInvoiceError extends ServiceBranchState {
  final String message;

  const GenInvoiceError(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchInvoiceFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SearchInvoiceFetched extends ServiceBranchState {
  final GenInvoiceSearchData? data;

  const SearchInvoiceFetched(this.data);

  @override
  List<Object?> get props => [data];
}

class SearchInvoiceError extends ServiceBranchState {
  final String message;

  const SearchInvoiceError(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchEngageFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SearchEngageFetched extends ServiceBranchState {
  final EngageSearchData? engageSearchData;

  const SearchEngageFetched(this.engageSearchData);

  @override
  List<Object?> get props => [engageSearchData];
}

class SearchEngageError extends ServiceBranchState {
  final String message;

  const SearchEngageError(this.message);

  @override
  List<Object?> get props => [message];
}

class EngageStatusFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class EngageStatusFetched extends ServiceBranchState {
  final EngageOrdersData? engageOrdersData;

  const EngageStatusFetched(this.engageOrdersData);

  @override
  List<Object?> get props => [engageOrdersData];
}

class EngageStatusError extends ServiceBranchState {
  final String message;

  const EngageStatusError(this.message);

  @override
  List<Object?> get props => [message];
}

class PendingOrdersFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class PendingOrdersFetched extends ServiceBranchState {
  final PendingOrdersData? pendingOrdersData;

  const PendingOrdersFetched(this.pendingOrdersData);

  @override
  List<Object?> get props => [pendingOrdersData];
}

class PendingOrdersError extends ServiceBranchState {
  final String message;

  const PendingOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

class CompletedOrdersFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class CompletedOrdersFetched extends ServiceBranchState {
  final CompletedOrdersData? completedOrdersData;

  const CompletedOrdersFetched(this.completedOrdersData);

  @override
  List<Object?> get props => [completedOrdersData];
}

class CompletedOrdersError extends ServiceBranchState {
  final String message;

  const CompletedOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

class PendingStatusFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class PendingStatusFetched extends ServiceBranchState {
  final PendingOrdersData? pendingOrdersData;

  const PendingStatusFetched(this.pendingOrdersData);

  @override
  List<Object?> get props => [pendingOrdersData];
}

class PendingStatusError extends ServiceBranchState {
  final String message;

  const PendingStatusError(this.message);

  @override
  List<Object?> get props => [message];
}

class CompletedStatusFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class CompletedStatusFetched extends ServiceBranchState {
  final CompletedOrdersData? completedOrdersData;

  const CompletedStatusFetched(this.completedOrdersData);

  @override
  List<Object?> get props => [completedOrdersData];
}

class CompletedStatusError extends ServiceBranchState {
  final String message;

  const CompletedStatusError(this.message);

  @override
  List<Object?> get props => [message];
}

class ReadyDeliveryFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class ReadyDeliveryFetched extends ServiceBranchState {
  final ReadyDeliveryData? readyDeliveryData;

  const ReadyDeliveryFetched(this.readyDeliveryData);

  @override
  List<Object?> get props => [readyDeliveryData];
}

class ReadyDeliveryError extends ServiceBranchState {
  final String message;

  const ReadyDeliveryError(this.message);

  @override
  List<Object?> get props => [message];
}

class ReadyDeliverySearchFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class ReadyDeliverySearchFetched extends ServiceBranchState {
  final DeliverySearchData? data;

  const ReadyDeliverySearchFetched(this.data);

  @override
  List<Object?> get props => [data];
}

class ReadyDeliverySearchError extends ServiceBranchState {
  final String message;

  const ReadyDeliverySearchError(this.message);

  @override
  List<Object?> get props => [message];
}

class NewOrderSearchFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class NewOrderSearchFetched extends ServiceBranchState {
  List<OrderSearchData>? orderSearchData = [];

  NewOrderSearchFetched(this.orderSearchData);

  @override
  List<Object?> get props => [orderSearchData];
}

class NewOrderSearchError extends ServiceBranchState {
  final String message;

  const NewOrderSearchError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerDeliveryModeFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerDeliveryModeFetched extends ServiceBranchState {
  List<ServiceDeliveryModeData>? serviceDeliveryData = [];

  SerDeliveryModeFetched(this.serviceDeliveryData);

  @override
  List<Object?> get props => [serviceDeliveryData];
}

class SerDeliveryModeError extends ServiceBranchState {
  final String message;

  const SerDeliveryModeError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerDeliveryDateFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerDeliveryDateFetched extends ServiceBranchState {
  List<DeliveryDateData>? deliveryDateData = [];

  SerDeliveryDateFetched(this.deliveryDateData);

  @override
  List<Object?> get props => [deliveryDateData];
}

class SerDeliveryDateError extends ServiceBranchState {
  final String message;

  const SerDeliveryDateError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerDeliveryTimeFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerDeliveryTimeFetched extends ServiceBranchState {
  List<String>? deliveryTimeData;

  SerDeliveryTimeFetched(this.deliveryTimeData);

  @override
  List<Object?> get props => [deliveryTimeData];
}

class SerDeliveryTimeError extends ServiceBranchState {
  final String message;

  const SerDeliveryTimeError(this.message);

  @override
  List<Object?> get props => [message];
}

class AddOrderFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class AddOrderFetched extends ServiceBranchState {
  final AddOrderData? orderData;

  const AddOrderFetched(this.orderData);

  @override
  List<Object?> get props => [orderData];
}

class AddOrderError extends ServiceBranchState {
  final String message;

  const AddOrderError(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchPendingOrdersFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SearchPendingOrdersFetched extends ServiceBranchState {
  final PendingSearchData? data;

  const SearchPendingOrdersFetched(this.data);

  @override
  List<Object?> get props => [data];
}

class SearchPendingOrdersError extends ServiceBranchState {
  final String message;

  const SearchPendingOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchCompletedOrdersFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SearchCompletedOrdersFetched extends ServiceBranchState {
  final CompletedOrderSearchData? data;

  const SearchCompletedOrdersFetched(this.data);

  @override
  List<Object?> get props => [data];
}

class SearchCompletedOrdersError extends ServiceBranchState {
  final String message;

  const SearchCompletedOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

class ServiceCategoryFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class ServiceCategoryFetched extends ServiceBranchState {
  final List<ServiceCategoryData>? categoryData;

  const ServiceCategoryFetched(this.categoryData);

  @override
  List<Object?> get props => [categoryData];
}

class ServiceCategoryError extends ServiceBranchState {
  final String message;

  const ServiceCategoryError(this.message);

  @override
  List<Object?> get props => [message];
}

class ServiceSubCategoryFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class ServiceSubCategoryFetched extends ServiceBranchState {
  final List<SubCategoryData>? subCategoryData;

  const ServiceSubCategoryFetched(this.subCategoryData);

  @override
  List<Object?> get props => [subCategoryData];
}

class ServiceSubCategoryError extends ServiceBranchState {
  final String message;

  const ServiceSubCategoryError(this.message);

  @override
  List<Object?> get props => [message];
}

class AcceptOrdersFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class AcceptOrdersFetched extends ServiceBranchState {
  final AcceptOrdersData? acceptOrdersData;

  const AcceptOrdersFetched(this.acceptOrdersData);

  @override
  List<Object?> get props => [acceptOrdersData];
}

class AcceptOrdersError extends ServiceBranchState {
  final String message;

  const AcceptOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

class AcceptStatusFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class AcceptStatusFetched extends ServiceBranchState {
  final AcceptOrdersData? acceptOrdersData;

  const AcceptStatusFetched(this.acceptOrdersData);

  @override
  List<Object?> get props => [acceptOrdersData];
}

class AcceptStatusError extends ServiceBranchState {
  final String message;

  const AcceptStatusError(this.message);

  @override
  List<Object?> get props => [message];
}

class ServiceItemsListFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class ServiceItemsListFetched extends ServiceBranchState {
  final List<ServiceItemsListData>? serviceItemsListData;

  const ServiceItemsListFetched(this.serviceItemsListData);

  @override
  List<Object?> get props => [serviceItemsListData];
}

class ServiceItemsListError extends ServiceBranchState {
  final String message;

  const ServiceItemsListError(this.message);

  @override
  List<Object?> get props => [message];
}

class ItemsIncDecFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class ItemsIncDecFetched extends ServiceBranchState {
  final SerItemsIncDecData? serItemsIncDecData;

  const ItemsIncDecFetched(this.serItemsIncDecData);

  @override
  List<Object?> get props => [serItemsIncDecData];
}

class ItemsIncDecError extends ServiceBranchState {
  final String? message;

  const ItemsIncDecError(this.message);

  @override
  List<Object?> get props => [message];
}

class ItemsAddCartFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class ItemsAddCartFetched extends ServiceBranchState {
  final SerItemsAddCartData? serItemsAddCartData;

  const ItemsAddCartFetched(this.serItemsAddCartData);

  @override
  List<Object?> get props => [serItemsAddCartData];
}

class ItemsAddCartError extends ServiceBranchState {
  final String? message;

  const ItemsAddCartError(this.message);

  @override
  List<Object?> get props => [message];
}

class ServiceCartListFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class ServiceCartListFetched extends ServiceBranchState {
  final SerCartListData? cartListData;
  Map<String, dynamic?>? deliveryAddress;

  ServiceCartListFetched(this.cartListData, this.deliveryAddress);

  @override
  List<Object?> get props => [cartListData, deliveryAddress];
}

class ServiceCartListError extends ServiceBranchState {
  final String? message;

  const ServiceCartListError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerCartCountFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerCartCountFetched extends ServiceBranchState {
  final SerCartCountData? serCartCount;

  const SerCartCountFetched(this.serCartCount);

  @override
  List<Object?> get props => [serCartCount];
}

class SerCartCountError extends ServiceBranchState {
  final String? message;

  const SerCartCountError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartIncDecFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class CartIncDecFetched extends ServiceBranchState {
  final SerCartIncDecData? serCartIncDecData;

  const CartIncDecFetched(this.serCartIncDecData);

  @override
  List<Object?> get props => [serCartIncDecData];
}

class CartIncDecError extends ServiceBranchState {
  final String? message;

  const CartIncDecError(this.message);

  @override
  List<Object?> get props => [message];
}

class DeliveryAddressFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class DeliveryAddressFetched extends ServiceBranchState {
  List<Map<String, String?>>? deliveryAddressData;

  DeliveryAddressFetched(this.deliveryAddressData);

  @override
  List<Object?> get props => [deliveryAddressData];
}

class DeliveryAddressError extends ServiceBranchState {
  final String? message;

  DeliveryAddressError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerPaymentListFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerPaymentListFetched extends ServiceBranchState {
  List<SerPaymentMtdData>? paymentList = [];

  SerPaymentListFetched(this.paymentList);

  @override
  List<Object?> get props => [paymentList];
}

class SerPaymentListError extends ServiceBranchState {
  final String? message;

  SerPaymentListError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerCartDeleteFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerCartDeleteFetched extends ServiceBranchState {
  final String? message;

  const SerCartDeleteFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class SerCartDeleteError extends ServiceBranchState {
  final String? message;

  const SerCartDeleteError(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchAcceptOrdersFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SearchAcceptOrdersFetched extends ServiceBranchState {
  final AcceptSearchData? acceptSearchData;

  const SearchAcceptOrdersFetched(this.acceptSearchData);

  @override
  List<Object?> get props => [acceptSearchData];
}

class SearchAcceptOrdersError extends ServiceBranchState {
  final String message;

  const SearchAcceptOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

class NewOrderFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class NewOrderFetched extends ServiceBranchState {
  final NewOrderData? newOrderData;

  const NewOrderFetched(this.newOrderData);

  @override
  List<Object?> get props => [newOrderData];
}

class NewOrderError extends ServiceBranchState {
  final String message;

  const NewOrderError(this.message);

  @override
  List<Object?> get props => [message];
}

class NewOrderStatusFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class NewOrderStatusFetched extends ServiceBranchState {
  final NewOrderData? newOrderData;

  const NewOrderStatusFetched(this.newOrderData);

  @override
  List<Object?> get props => [newOrderData];
}

class NewOrderStatusError extends ServiceBranchState {
  final String message;

  const NewOrderStatusError(this.message);

  @override
  List<Object?> get props => [message];
}

class SearchNewOrdersFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SearchNewOrdersFetched extends ServiceBranchState {
  final NewOrderSearchData? newOrderSearchData;

  const SearchNewOrdersFetched(this.newOrderSearchData);

  @override
  List<Object?> get props => [newOrderSearchData];
}

class SearchNewOrdersError extends ServiceBranchState {
  final String message;

  const SearchNewOrdersError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerCartWalletBalFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerCartWalletBalFetched extends ServiceBranchState {
  final String? message;

  const SerCartWalletBalFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class SerCartWalletBalError extends ServiceBranchState {
  final String? message;

  const SerCartWalletBalError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerPlaceOrderFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerPlaceOrderFetched extends ServiceBranchState {
  List<SerPlaceOrderData>? placeOrderData = [];

  SerPlaceOrderFetched(this.placeOrderData);

  @override
  List<Object?> get props => [placeOrderData];
}

class SerPlaceOrderError extends ServiceBranchState {
  final String? message;

  const SerPlaceOrderError(this.message);

  @override
  List<Object?> get props => [message];
}

class SerThankYouFetching extends ServiceBranchState {
  @override
  List<Object?> get props => [];
}

class SerThankYouFetched extends ServiceBranchState {
  final SerThankYouData? serThankYouData;

  const SerThankYouFetched(this.serThankYouData);

  @override
  List<Object?> get props => [serThankYouData];
}

class SerThankYouError extends ServiceBranchState {
  final String? message;

  const SerThankYouError(this.message);

  @override
  List<Object?> get props => [message];
}