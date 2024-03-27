part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();
}

class CustomerInitial extends CustomerState {
  @override
  List<Object> get props => [];
}

class CustomerBalanceFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerBalanceFetched extends CustomerState {
  final Data? data;

  const CustomerBalanceFetched(this.data);

  @override
  List<Object?> get props => [data];
}

class CustomerBalanceError extends CustomerState {
  final String message;

  const CustomerBalanceError(this.message);

  @override
  List<Object?> get props => [message];
}

class CategoryGettingState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CategoryGotState extends CustomerState {
  List<CategoryList> cList =[];

  CategoryGotState(this.cList);
  @override
  List<Object?> get props => [cList];
}

class CategoryErrorState extends CustomerState {
  final String message;

  CategoryErrorState(this.message);
  
  @override
  List<Object?> get props => [message];
}

class SubCategoryGettingState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class SubCategoryGotState extends CustomerState {
  List<SubCatList> scList =[];

  SubCategoryGotState(this.scList);
  @override
  List<Object?> get props => [scList];
}

class SubCategoryErrorState extends CustomerState {
  final String message;

  SubCategoryErrorState(this.message);
  
  @override
  List<Object?> get props => [message];
}

class ItemGettingState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class ItemGotState extends CustomerState {
  List<List<ItemList>> itemData = [];
  ItemGotState(this.itemData);
  @override
  List<Object?> get props => [itemData];
}

class ItemErrorState extends CustomerState {
  final String message;

  ItemErrorState(this.message);

  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class CustomerForgotPwdFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerForgotPwdFetched extends CustomerState {
  final ForgotPasswordModel forgot_pwd_data;

  CustomerForgotPwdFetched(this.forgot_pwd_data);

  @override
  List<Object?> get props => [forgot_pwd_data];
}

class CustomerForgotPwdError extends CustomerState {
  final String? message;

  CustomerForgotPwdError(this.message);

  @override
  List<Object?> get props => [message];
}

class CustomerOtpFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerOtpFetched extends CustomerState {
  final String? message;

  CustomerOtpFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class CustomerOtpError extends CustomerState {
  final String? message;

  CustomerOtpError(this.message);

  @override
  List<Object?> get props => [message];
}

class CustomerResetPwdFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerResetPwdFetched extends CustomerState {
  final String? message;

  CustomerResetPwdFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class CustomerResetPwdError extends CustomerState {
  final String? message;

  CustomerResetPwdError(this.message);

  @override
  List<Object?> get props => [message];
}

class EmiratesFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class EmiratesFetched extends CustomerState {
  final EmiratesData? emiratesData;

  EmiratesFetched(this.emiratesData);

  @override
  List<Object?> get props => [emiratesData];
}

class EmiratesError extends CustomerState {
  final String? message;

  EmiratesError(this.message);

  @override
  List<Object?> get props => [message];
}

class AreaFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class AreaFetched extends CustomerState {
  final AreaData? areaData;

  AreaFetched(this.areaData);

  @override
  List<Object?> get props => [areaData];
}

class AreaError extends CustomerState {
  final String? message;

  AreaError(this.message);

  @override
  List<Object?> get props => [message];
}

class LocationFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class LocationFetched extends CustomerState {
  final LocationData? locationData;

  LocationFetched(this.locationData);

  @override
  List<Object?> get props => [locationData];
}

class LocationError extends CustomerState {
  final String? message;

  LocationError(this.message);

  @override
  List<Object?> get props => [message];
}

class PersonalSaveFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class PersonalSaveFetched extends CustomerState {
  final PersonalSaveData? personalSaveData;

  PersonalSaveFetched(this.personalSaveData);

  @override
  List<Object?> get props => [personalSaveData];
}

class PersonalSaveError extends CustomerState {
  final String? message;

  PersonalSaveError(this.message);

  @override
  List<Object?> get props => [message];
}

class CorporateSaveFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CorporateSaveFetched extends CustomerState {
  final CorporateSaveData? corporateSaveData;

  CorporateSaveFetched(this.corporateSaveData);

  @override
  List<Object?> get props => [corporateSaveData];
}

class CorporateSaveError extends CustomerState {
  final String? message;

  CorporateSaveError(this.message);

  @override
  List<Object?> get props => [message];
}

class DeliveryModeFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class DeliveryModeFetched extends CustomerState {
  List<DeliveryModeList>? delivery_mode_list =[];

  DeliveryModeFetched(this.delivery_mode_list);

  @override
  List<Object?> get props => [delivery_mode_list];
}

class DeliveryModeError extends CustomerState {
  final String? message;

  DeliveryModeError(this.message);

  @override
  List<Object?> get props => [message];
}

class DeliveryDateFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class DeliveryDateFetched extends CustomerState {
  List<DeliveryDateList>? deliveryDateList;

  DeliveryDateFetched(this.deliveryDateList);

  @override
  List<Object?> get props => [deliveryDateList];
}

class DeliveryDateError extends CustomerState {
  final String? message;

  DeliveryDateError(this.message);

  @override
  List<Object?> get props => [message];
}

class DeliveryTimeFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class DeliveryTimeFetched extends CustomerState {
  List<String>? timeData;

  DeliveryTimeFetched(this.timeData);

  @override
  List<Object?> get props => [timeData];
}

class DeliveryTimeError extends CustomerState {
  final String? message;

  DeliveryTimeError(this.message);

  @override
  List<Object?> get props => [message];
}

class ContactlessOrderFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class ContactlessOrderFetched extends CustomerState {
  List<ContactlessOrderData>? contactlessData;

  ContactlessOrderFetched(this.contactlessData);

  @override
  List<Object?> get props => [contactlessData];
}

class ContactlessOrderError extends CustomerState {
  final String? message;

  ContactlessOrderError(this.message);

  @override
  List<Object?> get props => [message];
}

class ServicesFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class ServicesFetched extends CustomerState {
  List<ServiceList>? serviceList = [];

  ServicesFetched(this.serviceList);

  @override
  List<Object?> get props => [serviceList];
}

class ServicesError extends CustomerState {
  final String? message;

  ServicesError(this.message);

  @override
  List<Object?> get props => [message];
}

class SubServicesFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class SubServicesFetched extends CustomerState {
  List<SubServiceList>? subServiceList = [];

  SubServicesFetched(this.subServiceList);

  @override
  List<Object?> get props => [subServiceList];
}

class SubServicesError extends CustomerState {
  final String? message;

  SubServicesError(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderItemsFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class OrderItemsFetched extends CustomerState {
  List<ItemsList>? itemsList = [];

  OrderItemsFetched(this.itemsList);

  @override
  List<Object?> get props => [itemsList];
}

class OrderItemsError extends CustomerState {
  final String? message;

  OrderItemsError(this.message);

  @override
  List<Object?> get props => [message];
}

class ItemsIncreDecreFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class ItemsIncreDecreFetched extends CustomerState {
  final ItemsIncDecData? itemsIncDec;

  ItemsIncreDecreFetched(this.itemsIncDec);

  @override
  List<Object?> get props => [itemsIncDec];
}

class ItemsIncreDecreError extends CustomerState {
  final String? message;

  ItemsIncreDecreError(this.message);

  @override
  List<Object?> get props => [message];
}

class ItemAddCartFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class ItemAddCartFetched extends CustomerState {
  final AddCartData? addCartData;

  ItemAddCartFetched(this.addCartData);

  @override
  List<Object?> get props => [addCartData];
}

class ItemAddCartError extends CustomerState {
  final String? message;

  ItemAddCartError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartCountFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CartCountFetched extends CustomerState {
  final CartCountData? cartCountdata;

  CartCountFetched(this.cartCountdata);

  @override
  List<Object?> get props => [cartCountdata];
}

class CartCountError extends CustomerState {
  final String? message;

  CartCountError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartListFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CartListFetched extends CustomerState {
  final CartListData? cartListData;
  Map<String, dynamic?>? deliveryAddress;

  CartListFetched(this.cartListData, this.deliveryAddress);

  @override
  List<Object?> get props => [cartListData, deliveryAddress];
}

class CartListError extends CustomerState {
  final String? message;

  CartListError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartItemsIncreDecreFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CartItemsIncreDecreFetched extends CustomerState {
  final CartItemsIncDecData? cartItemsIncDec;

  CartItemsIncreDecreFetched(this.cartItemsIncDec);

  @override
  List<Object?> get props => [cartItemsIncDec];
}

class CartItemsIncreDecreError extends CustomerState {
  final String? message;

  CartItemsIncreDecreError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartDeletionFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CartDeletionFetched extends CustomerState {
  final String? message;

  CartDeletionFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class CartDeletionError extends CustomerState {
  final String? message;

  CartDeletionError(this.message);

  @override
  List<Object?> get props => [message];
}

class ThankYouFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class ThankYouFetched extends CustomerState {
  final ThankYouData? thankYouData;

  ThankYouFetched(this.thankYouData);

  @override
  List<Object?> get props => [thankYouData];
}

class ThankYouError extends CustomerState {
  final String? message;

  ThankYouError(this.message);

  @override
  List<Object?> get props => [message];
}

class DeliveryAddrFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class DeliveryAddrFetched extends CustomerState {
  List<Map<String, String?>>? deliveryAddrData;

  DeliveryAddrFetched(this.deliveryAddrData);

  @override
  List<Object?> get props => [deliveryAddrData];
}

class DeliveryAddrError extends CustomerState {
  final String? message;

  DeliveryAddrError(this.message);

  @override
  List<Object?> get props => [message];
}

class PlaceOrderFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class PlaceOrderFetched extends CustomerState {
  List<PlaceOrderData>? orderData;

  PlaceOrderFetched(this.orderData);

  @override
  List<Object?> get props => [orderData];
}

class PlaceOrderError extends CustomerState {
  final String? message;

  PlaceOrderError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartPaymentListFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CartPaymentListFetched extends CustomerState {
  List<CartPaymentListData>? cartPaymentList = [];

  CartPaymentListFetched(this.cartPaymentList);

  @override
  List<Object?> get props => [cartPaymentList];
}

class CartPaymentListError extends CustomerState {
  final String? message;

  CartPaymentListError(this.message);

  @override
  List<Object?> get props => [message];
}

class CartWalletFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CartWalletFetched extends CustomerState {
  final String? message;

  CartWalletFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class CartWalletError extends CustomerState {
  final String? message;

  CartWalletError(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderStatusFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class OrderStatusFetched extends CustomerState {
  List<OrderStatusData>? orderStatusData = [];

  OrderStatusFetched(this.orderStatusData);

  @override
  List<Object?> get props => [orderStatusData];
}

class OrderStatusError extends CustomerState {
  final String? message;

  OrderStatusError(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderStatusFBFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class OrderStatusFBFetched extends CustomerState {
  final ReviewData? reviewData;

  OrderStatusFBFetched(this.reviewData);

  @override
  List<Object?> get props => [reviewData];
}

class OrderStatusFBError extends CustomerState {
  final String? message;

  OrderStatusFBError(this.message);

  @override
  List<Object?> get props => [message];
}

class OrderDetailsFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class OrderDetailsFetched extends CustomerState {
  final OrderDetailsData? orderDetailsData;

  const OrderDetailsFetched(this.orderDetailsData);

  @override
  List<Object?> get props => [orderDetailsData];
}

class OrderDetailsError extends CustomerState {
  final String? message;

  OrderDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}

class WalletTransactionFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class WalletTransactionFetched extends CustomerState {
  final WalletTransactionList? walletTransactionList;

  WalletTransactionFetched(this.walletTransactionList);

  @override
  List<Object?> get props => [walletTransactionList];
}

class WalletTransactionError extends CustomerState {
  final String? message;

  WalletTransactionError(this.message);

  @override
  List<Object?> get props => [message];
}

class WalletRechargeFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class WalletRechargeFetched extends CustomerState {
  final String? message;

  WalletRechargeFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class WalletRechargeError extends CustomerState {
  final String? message;

  WalletRechargeError(this.message);

  @override
  List<Object?> get props => [message];
}

class TransactionHistoryFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class TransactionHistoryFetched extends CustomerState {
  final TransactionHistoryData? transactionHistoryData;

  TransactionHistoryFetched(this.transactionHistoryData);

  @override
  List<Object?> get props => [transactionHistoryData];
}

class TransactionHistoryError extends CustomerState {
  final String? message;

  TransactionHistoryError(this.message);

  @override
  List<Object?> get props => [message];
}

class OutstandingFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class OutstandingFetched extends CustomerState {
  final OutstandingData? outstandingData;

  OutstandingFetched(this.outstandingData);

  @override
  List<Object?> get props => [outstandingData];
}

class OutstandingError extends CustomerState {
  final String? message;

  OutstandingError(this.message);

  @override
  List<Object?> get props => [message];
}

class OutstandingPayFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class OutstandingPayFetched extends CustomerState {
  final OutstandingPayData? outstandingPayData;

  OutstandingPayFetched(this.outstandingPayData);

  @override
  List<Object?> get props => [outstandingPayData];
}

class OutstandingPayError extends CustomerState {
  final String? message;

  OutstandingPayError(this.message);

  @override
  List<Object?> get props => [message];
}

class ComplaintListFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class ComplaintListFetched extends CustomerState {
  final ComplaintListModel? complaintListModel;

  ComplaintListFetched(this.complaintListModel);

  @override
  List<Object?> get props => [complaintListModel];
}

class ComplaintListError extends CustomerState {
  final String? message;

  ComplaintListError(this.message);

  @override
  List<Object?> get props => [message];
}

class AddComplaintFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class AddComplaintFetched extends CustomerState {
  final List<AddComplaintData>? addComplaintData;

  AddComplaintFetched(this.addComplaintData);

  @override
  List<Object?> get props => [addComplaintData];
}

class AddComplaintError extends CustomerState {
  final String? message;

  AddComplaintError(this.message);

  @override
  List<Object?> get props => [message];
}

class RegisterComplaintListFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class RegisterComplaintListFetched extends CustomerState {
  final RegisterComplaintListData? registerComplaintListData;

  RegisterComplaintListFetched(this.registerComplaintListData);

  @override
  List<Object?> get props => [registerComplaintListData];
}

class RegisterComplaintListError extends CustomerState {
  final String? message;

  RegisterComplaintListError(this.message);

  @override
  List<Object?> get props => [message];
}

class RegisterComplaintButtonFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class RegisterComplaintButtonFetched extends CustomerState {
  final RegisterButtonData? registerButtonData;

  RegisterComplaintButtonFetched(this.registerButtonData);

  @override
  List<Object?> get props => [registerButtonData];
}

class RegisterComplaintButtonError extends CustomerState {
  final String? message;

  RegisterComplaintButtonError(this.message);

  @override
  List<Object?> get props => [message];
}

class ComplaintDetailsFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class ComplaintDetailsFetched extends CustomerState {
  final List<ComplaintDetailsData>? complaintDetailsData;

  ComplaintDetailsFetched(this.complaintDetailsData);

  @override
  List<Object?> get props => [complaintDetailsData];
}

class ComplaintDetailsError extends CustomerState {
  final String? message;

  const ComplaintDetailsError(this.message);

  @override
  List<Object?> get props => [message];
}

class MyAddressesListFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class MyAddressesListFetched extends CustomerState {
  final MyAddressesData? myAddressesData;

  const MyAddressesListFetched(this.myAddressesData);

  @override
  List<Object?> get props => [myAddressesData];
}

class MyAddressesListError extends CustomerState {
  final String? message;

  const MyAddressesListError(this.message);

  @override
  List<Object?> get props => [message];
}

class AddAddressFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class AddAddressFetched extends CustomerState {
  final AddAddressData? addAddressData;

  const AddAddressFetched(this.addAddressData);

  @override
  List<Object?> get props => [addAddressData];
}

class AddAddressError extends CustomerState {
  final String? message;

  const AddAddressError(this.message);

  @override
  List<Object?> get props => [message];
}

class EditProfileGetFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class EditProfileGetFetched extends CustomerState {
  final EditProfileGetData? editProfileGetData;

  const EditProfileGetFetched(this.editProfileGetData);

  @override
  List<Object?> get props => [editProfileGetData];
}

class EditProfileGetError extends CustomerState {
  final String? message;

  const EditProfileGetError(this.message);

  @override
  List<Object?> get props => [message];
}

class EditProfileFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class EditProfileFetched extends CustomerState {
  final List<EditProfileData>? editProfileData;

  const EditProfileFetched(this.editProfileData);

  @override
  List<Object?> get props => [editProfileData];
}

class EditProfileError extends CustomerState {
  final String? message;

  const EditProfileError(this.message);

  @override
  List<Object?> get props => [message];
}

class PayOutstandingGetFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class PayOutstandingGetFetched extends CustomerState {
  final PayNowOutstandingGetData? payNowData;

  const PayOutstandingGetFetched(this.payNowData);

  @override
  List<Object?> get props => [payNowData];
}

class PayOutstandingGetError extends CustomerState {
  final String? message;

  const PayOutstandingGetError(this.message);

  @override
  List<Object?> get props => [message];
}

class PayOutstandingFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class PayOutstandingFetched extends CustomerState {
  final PayOutstandingData? payOutstandingData;

  const PayOutstandingFetched(this.payOutstandingData);

  @override
  List<Object?> get props => [payOutstandingData];
}

class PayOutstandingError extends CustomerState {
  final String? message;

  const PayOutstandingError(this.message);

  @override
  List<Object?> get props => [message];
}

class OutstandingProceedIndivFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class OutstandingProceedIndivFetched extends CustomerState {
  final String? message;

  const OutstandingProceedIndivFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class OutstandingProceedIndivError extends CustomerState {
  final String? message;

  const OutstandingProceedIndivError(this.message);

  @override
  List<Object?> get props => [message];
}

class OutstandingProceedComFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class OutstandingProceedComFetched extends CustomerState {
  final String? message;

  const OutstandingProceedComFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class OutstandingProceedComError extends CustomerState {
  final String? message;

  const OutstandingProceedComError(this.message);

  @override
  List<Object?> get props => [message];
}

class CallSupportFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CallSupportFetched extends CustomerState {
  final List<CallSupportData>? callSupportData;

  const CallSupportFetched(this.callSupportData);

  @override
  List<Object?> get props => [callSupportData];
}

class CallSupportError extends CustomerState {
  final String? message;

  const CallSupportError(this.message);

  @override
  List<Object?> get props => [message];
}

class OurBranchesFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class OurBranchesFetched extends CustomerState {
  final OurBranchesData? branchesData;

  const OurBranchesFetched(this.branchesData);

  @override
  List<Object?> get props => [branchesData];
}

class OurBranchesError extends CustomerState {
  final String? message;

  const OurBranchesError(this.message);

  @override
  List<Object?> get props => [message];
}

class PricingFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class PricingFetched extends CustomerState {
  final List<PricingData>? pricingData;

  const PricingFetched(this.pricingData);

  @override
  List<Object?> get props => [pricingData];
}

class PricingError extends CustomerState {
  final String? message;

  const PricingError(this.message);

  @override
  List<Object?> get props => [message];
}

class EmailSupportFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class EmailSupportFetched extends CustomerState {
  final EmailSupportData? emailSupportData;

  const EmailSupportFetched(this.emailSupportData);

  @override
  List<Object?> get props => [emailSupportData];
}

class EmailSupportError extends CustomerState {
  final String? message;

  const EmailSupportError(this.message);

  @override
  List<Object?> get props => [message];
}

class SideBarFBFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class SideBarFBFetched extends CustomerState {
  final SideBarFeedbackData? sideBarFeedbackData;

  const SideBarFBFetched(this.sideBarFeedbackData);

  @override
  List<Object?> get props => [sideBarFeedbackData];
}

class SideBarFBError extends CustomerState {
  final String? message;

  const SideBarFBError(this.message);

  @override
  List<Object?> get props => [message];
}

class NotificationFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class NotificationFetched extends CustomerState {
  final List<NotificationData>? notificationData;

  const NotificationFetched(this.notificationData);

  @override
  List<Object?> get props => [notificationData];
}

class NotificationError extends CustomerState {
  final String? message;

  const NotificationError(this.message);

  @override
  List<Object?> get props => [message];
}

class NotiDeleteFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class NotiDeleteFetched extends CustomerState {
  final String? message;

  const NotiDeleteFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class NotiDeleteError extends CustomerState {
  final String? message;

  const NotiDeleteError(this.message);

  @override
  List<Object?> get props => [message];
}

class ServicePriceFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class ServicePriceFetched extends CustomerState {
  final List<ServicePriceListData>? servicePriceData;

  const ServicePriceFetched(this.servicePriceData);

  @override
  List<Object?> get props => [servicePriceData];
}

class ServicePriceError extends CustomerState {
  final String? message;

  const ServicePriceError(this.message);

  @override
  List<Object?> get props => [message];
}

class NotAvailableFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class NotAvailableFetched extends CustomerState {
  final String? message;

  const NotAvailableFetched(this.message);

  @override
  List<Object?> get props => [message];
}

class NotAvailableError extends CustomerState {
  final String? message;

  const NotAvailableError(this.message);

  @override
  List<Object?> get props => [message];
}
