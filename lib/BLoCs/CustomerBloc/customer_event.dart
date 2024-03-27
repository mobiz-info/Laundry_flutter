part of 'customer_bloc.dart';

abstract class CustomerEvent extends Equatable {
  const CustomerEvent();
}

class GetBalanceEvent extends CustomerEvent {
  final String token;
  final String id;

  GetBalanceEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}


class GetCategoryEvent extends CustomerEvent {
  final String token;
  final String id;

  GetCategoryEvent(this.token, this.id);

  @override
  List<Object> get props => [token, id]  ;
}

class GetSubCategoryEvent extends CustomerEvent {
  final String token;
  final String cat_id;

  GetSubCategoryEvent(this.token, this.cat_id);

  @override
  List<Object> get props => [token, cat_id]  ;
}

class GetItemEvent extends CustomerEvent {
  final String token;
  final Map<String, String> body;

  GetItemEvent(this.token, this.body);

  @override
  List<Object?> get props => [token, body];
}

class GetForgotPasswordEvent extends CustomerEvent {
  final String mobileNum;

  GetForgotPasswordEvent(this.mobileNum);

  @override
  List<Object?> get props => [mobileNum];
}

class GetOtpEvent extends CustomerEvent {
  final String mobileNum;
  final String otp;

  GetOtpEvent(this.mobileNum, this.otp);

  @override
  List<Object?> get props => [mobileNum, otp];
}

class GetResetPasswordEvent extends CustomerEvent {
  final String mobileNum;
  final String newPassword;
  final String confirmPassword;

  GetResetPasswordEvent(this.mobileNum, this.newPassword, this.confirmPassword);

  @override
  List<Object?> get props => [mobileNum, newPassword, confirmPassword];
}

class GetEmiratesEvent extends CustomerEvent {

  GetEmiratesEvent();

  @override
  List<Object?> get props => [];
}

class GetAreaEvent extends CustomerEvent {
  final String emirateID;

  GetAreaEvent(this.emirateID);

  @override
  List<Object?> get props => [emirateID];
}

class GetLocationEvent extends CustomerEvent {
  final String areaID;

  GetLocationEvent(this.areaID);

  @override
  List<Object?> get props => [areaID];
}

class GetPersonalSaveEvent extends CustomerEvent {
  final String userName;
  final String name;
  final String emailID;
  final String password;
  final String customerType;
  final int buildingNo;
  final String roomNo;
  final int mobile;
  final int altMobile;
  final int whatsApp;
  final int creditLimit;
  final int creditDays;
  final int creditInvoices;
  final int gpse;
  final int gpsn;
  final String location;
  final String trn;
  final String billingAddress;
  final String designation;
  final String buildingName;
  final String floorNumber;
  final String flatNumber;

  GetPersonalSaveEvent(
      this.userName,
      this.name,
      this.emailID,
      this.password,
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
      this.location,
      this.trn,
      this.billingAddress,
      this.designation,
      this.buildingName,
      this.floorNumber,
      this.flatNumber,
      );

  @override
  List<Object?> get props => [userName, name, emailID, password, customerType,
    buildingNo, roomNo, mobile, altMobile, whatsApp, creditLimit, creditDays,
    creditInvoices, gpse, gpsn, location, trn, billingAddress, designation,
    buildingName, floorNumber, flatNumber];
}

class GetCorporateSaveEvent extends CustomerEvent {
  final String userName;
  final String name;
  final String emailID;
  final String password;
  final String customerType;
  final String buildingNo;
  final String roomNo;
  final String regEmail;
  final int mobile;
  final int altMobile;
  final int whatsApp;
  final int creditLimit;
  final int creditDays;
  final int creditInvoices;
  final int gpse;
  final int gpsn;
  final String location;
  final String companyName;
  final String trn;
  final String billingAddress;
  final String designation;
  final String buildingAddress;
  final String floorNumber;
  final String flatNumber;
  final List<AddressList>? addressList;

  GetCorporateSaveEvent(
  this.userName,
  this.name,
  this.emailID,
  this.password,
  this.customerType,
  this.buildingNo,
  this.roomNo,
  this.regEmail,
  this.mobile,
  this.altMobile,
  this.whatsApp,
  this.creditLimit,
  this.creditDays,
  this.creditInvoices,
  this.gpse,
  this.gpsn,
  this.location,
  this.companyName,
  this.trn,
  this.billingAddress,
  this.designation,
  this.buildingAddress,
  this.floorNumber,
  this.flatNumber,
  this.addressList
  );

  @override
  List<Object?> get props => [userName, name, emailID, password, customerType,
    buildingNo, roomNo, mobile, altMobile, whatsApp, creditLimit, creditDays,
    creditInvoices, gpse, gpsn, location, trn, billingAddress, designation,
    buildingAddress, floorNumber, flatNumber, addressList];
}

class GetDeliveryModeEvent extends CustomerEvent {
  final String token;

  GetDeliveryModeEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetDeliveryDateEvent extends CustomerEvent {
  final String token;
  final String deliveryMode;

  GetDeliveryDateEvent(this.token, this.deliveryMode);

  @override
  List<Object?> get props => [token, deliveryMode];
}

class GetDeliveryTimeEvent extends CustomerEvent {
  final String token;
  final String deliveryDate;

  GetDeliveryTimeEvent(this.token, this.deliveryDate);

  @override
  List<Object?> get props => [token, deliveryDate];
}

class GetContactlessOrderEvent extends CustomerEvent {
  final String token;
  final int id;
  final String pickupDate;
  final String pickupTime;
  final String orderType;
  final String deliveryDate;
  final String deliveryTime;
  final String pickupMode;

  GetContactlessOrderEvent(this.token, this.id, this.pickupDate, this.pickupTime, this.orderType, this.deliveryDate, this.deliveryTime, this.pickupMode);

  @override
  List<Object?> get props => [token, id, pickupDate, pickupTime, orderType, deliveryDate, deliveryTime, pickupMode];
}

class GetServicesEvent extends CustomerEvent {
  final String token;
  final int? id;

  GetServicesEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

class GetSubServicesEvent extends CustomerEvent {
  final String token;
  final String categoriesId;

  GetSubServicesEvent(this.token, this.categoriesId);

  @override
  List<Object?> get props => [token, categoriesId];
}

class GetOrderItemsEvent extends CustomerEvent {
  final String token;
  final int? id;
  final String categoriesId;
  final String subCategoriesId;
  final String orderId;

  GetOrderItemsEvent(this.token, this.id, this.categoriesId, this.subCategoriesId, this.orderId);

  @override
  List<Object?> get props => [token, id, categoriesId, subCategoriesId, orderId];
}

class GetItemsIncreDecreEvent extends CustomerEvent {
  final String token;
  final String orderId;
  final String priceListId;
  final String itemServiceId;
  final String quantity;

  GetItemsIncreDecreEvent(this.token, this.orderId, this.priceListId, this.itemServiceId, this.quantity);

  @override
  List<Object?> get props => [token, orderId, priceListId, itemServiceId, quantity];
}

class GetItemAddtoCartEvent extends CustomerEvent {
  final String token;
  final String orderId;
  final String priceListId;
  final String itemServiceId;
  final String quantity;
  final String amount;

  GetItemAddtoCartEvent(this.token, this.orderId, this.priceListId, this.itemServiceId, this.quantity, this.amount);

  @override
  List<Object?> get props => [token, orderId, priceListId, itemServiceId, quantity, amount];
}

class GetCartCountEvent extends CustomerEvent {
  final String token;
  final String orderId;

  GetCartCountEvent(this.token, this.orderId);

  @override
  List<Object?> get props => [token, orderId];
}

class GetCartListEvent extends CustomerEvent {
  final String token;
  final String orderId;

  GetCartListEvent(this.token, this.orderId);

  @override
  List<Object?> get props => [token, orderId];
}

class GetCartItemsIncreDecreEvent extends CustomerEvent {
  final String token;
  final String orderId;
  final String cartId;
  final String priceListId;
  final String itemServiceId;
  final String quantity;

  GetCartItemsIncreDecreEvent(this.token, this.orderId, this.cartId, this.priceListId, this.itemServiceId, this.quantity);

  @override
  List<Object?> get props => [token, orderId, cartId, priceListId, itemServiceId, quantity];
}

class GetCartDeletionEvent extends CustomerEvent {
  final String token;
  final String cartId;

  GetCartDeletionEvent(this.token, this.cartId);

  @override
  List<Object?> get props => [token, cartId];
}

class GetThankYouEvent extends CustomerEvent {
  final String token;
  final String orderId;
  final String customerId;

  GetThankYouEvent(this.token, this.orderId, this.customerId);

  @override
  List<Object?> get props => [token, orderId, customerId];
}

class GetDeliveryAddrEvent extends CustomerEvent {
  // final String token;
  // final String customerId;
  CartListData data;
  Map<String, String?> address;

  GetDeliveryAddrEvent(this.data, this.address);

  @override
  List<Object?> get props => [data, address];
}

class GetPlaceOrderEvent extends CustomerEvent {
  final String token;
  final int id;
  final String orderId;
  final int discount;
  final int netTaxable;
  final int vat;
  final int grandTotal;
  final String collectMode;
  final int payedAmount;
  final String customerAddress;

  GetPlaceOrderEvent(this.token, this.id, this.orderId, this.discount, this.netTaxable, this.vat, this.grandTotal, this.collectMode, this.payedAmount, this.customerAddress);

  @override
  List<Object?> get props => [token, id, orderId, discount, netTaxable, vat, grandTotal, collectMode, payedAmount, customerAddress];
}

class GetCartPaymentListEvent extends CustomerEvent {
  final String token;

  GetCartPaymentListEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetCartWalletEvent extends CustomerEvent {
  final String token;
  final String customerId;
  final String orderId;

  GetCartWalletEvent(this.token, this.customerId, this.orderId);

  @override
  List<Object?> get props => [token, customerId, orderId];
}

class GetOrderStatusEvent extends CustomerEvent {
  final String token;
  final String id;
  final String from_Date;
  final String to_Date;

  GetOrderStatusEvent(this.token, this.id, this.from_Date, this.to_Date);

  @override
  List<Object?> get props => [token, id, from_Date, to_Date];
}

class GetOrderStatusFeedbackEvent extends CustomerEvent {
  final String token;
  final String orderId;
  final String review;
  final String feedback;

  GetOrderStatusFeedbackEvent(this.token, this.orderId, this.review, this.feedback);

  @override
  List<Object?> get props => [token, orderId, review, feedback];
}

class GetOrderDetailsEvent extends CustomerEvent {
  final String token;
  final String orderId;

  GetOrderDetailsEvent(this.token, this.orderId);

  @override
  List<Object?> get props => [token, orderId];
}

class GetWalletTransactionEvent extends CustomerEvent {
  final String token;
  final int id;

  GetWalletTransactionEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}

class GetWalletRechargeEvent extends CustomerEvent {
  final String token;
  final String id;
  final String amount;
  final String paymentMode;

  GetWalletRechargeEvent(this.token, this.id, this.amount, this.paymentMode);

  @override
  List<Object?> get props => [token, id];
}

class GetTransHistoryEvent extends CustomerEvent {
  final String token;
  final String from_Date;
  final String to_Date;

  GetTransHistoryEvent(this.token, this.from_Date, this.to_Date);

  @override
  List<Object?> get props => [token, from_Date, to_Date];
}

class GetOutstandingEvent extends CustomerEvent {
  final String token;

  GetOutstandingEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetOutstandingPayEvent extends CustomerEvent {
  final String token;
  final String outstandingId;
  final String amountPaid;

  GetOutstandingPayEvent(this.token, this.outstandingId, this.amountPaid);

  @override
  List<Object?> get props => [token, outstandingId, amountPaid];
}

class GetComplaintListEvent extends CustomerEvent {
  final String token;

  GetComplaintListEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetAddComplaintEvent extends CustomerEvent {
  final String token;

  GetAddComplaintEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetRegisterComplaintListEvent extends CustomerEvent {
  final String token;
  final String orderId;

  GetRegisterComplaintListEvent(this.token, this.orderId);

  @override
  List<Object?> get props => [token, orderId];
}

class GetRegisterComplaintButtonEvent extends CustomerEvent {
  final String token;
  final String order;
  final String complaintType;
  final String service;
  final String customer;
  final String remarks;
  final File photo;
  final File uploadPhoto;

  const GetRegisterComplaintButtonEvent(this.token, this.order, this.complaintType, this.service,
      this.customer, this.remarks, this.photo, this.uploadPhoto);

  @override
  List<Object?> get props => [token, order, complaintType, service, customer, remarks, photo, uploadPhoto];
}

class GetComplaintDetailsEvent extends CustomerEvent {
  final String token;
  final String complaintId;

  const GetComplaintDetailsEvent(this.token, this.complaintId);

  @override
  List<Object?> get props => [token, complaintId];
}

class GetMyAddressesListEvent extends CustomerEvent {
  final String token;

  const GetMyAddressesListEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetAddAddressesEvent extends CustomerEvent {
  final String token;
  final String emirate;
  final String area;
  final String location;
  final String buildingNameNo;
  final String floorNo;
  final String flatNoHouseNo;
  final String personInchargeMob;
  final String name;
  final String gpse;
  final String gpsn;
  final String whatsAppNum;

  const GetAddAddressesEvent(this.token, this.emirate, this.area, this.location,
      this.buildingNameNo, this.floorNo, this.flatNoHouseNo, this.personInchargeMob,
      this.name, this.gpse, this.gpsn, this.whatsAppNum);

  @override
  List<Object?> get props => [token, emirate, area, location, buildingNameNo,
    floorNo, flatNoHouseNo, personInchargeMob, name, gpse, gpsn, whatsAppNum];
}

class GetEditProfileEvent extends CustomerEvent {
  final String token;

  const GetEditProfileEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetEditingProfileEvent extends CustomerEvent {
  final String token;
  final String gpse;
  final String gpsn;
  final String location;
  final String name;
  final String mobile;
  final String whatsApp;
  final String buildingNo;
  final String buildingName;
  final String floorNumber;
  final String flatNumber;

  const GetEditingProfileEvent(this.token, this.gpse, this.gpsn, this.location,
      this.name, this.mobile, this.whatsApp, this.buildingNo, this.buildingName,
      this.floorNumber, this.flatNumber);

  @override
  List<Object?> get props => [token, gpse, gpsn, location, name, mobile, whatsApp,
    buildingNo, buildingName, floorNumber, flatNumber];
}

class GetPayNowOutstandingEvent extends CustomerEvent {
  final String token;

  const GetPayNowOutstandingEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetPayOutstandingEvent extends CustomerEvent {
  final String token;
  final String paymentMtd;
  final String amtPayable;

  const GetPayOutstandingEvent(this.token, this.paymentMtd, this.amtPayable);

  @override
  List<Object?> get props => [token, paymentMtd, amtPayable];
}

class GetOutstandingProceedIndivEvent extends CustomerEvent {
  final String token;
  final String orderNum;
  final String amountPayable;
  final String paymentMtd;

  const GetOutstandingProceedIndivEvent(this.token, this.orderNum, this.amountPayable, this.paymentMtd);

  @override
  List<Object?> get props => [token, orderNum, amountPayable, paymentMtd];
}

class GetOutstandingProceedComEvent extends CustomerEvent {
  final String token;
  final String netPayable;
  final String amountPayable;
  final String paymentMtd;

  const GetOutstandingProceedComEvent(this.token, this.netPayable, this.amountPayable, this.paymentMtd);

  @override
  List<Object?> get props => [token, netPayable, amountPayable, paymentMtd];
}

class GetCallSupportEvent extends CustomerEvent {
  final String token;

  const GetCallSupportEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetBranchesEvent extends CustomerEvent {
  final String token;

  const GetBranchesEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetPricingEvent extends CustomerEvent {
  final String token;

  const GetPricingEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetEmailSupportEvent extends CustomerEvent {
  final String token;
  final String name;
  final String email;
  final String phone;
  final String message;

  const GetEmailSupportEvent(this.token, this.name, this.email, this.phone, this.message);

  @override
  List<Object?> get props => [token, name, email, phone, message];
}

class GetSideBarFBEvent extends CustomerEvent {
  final String token;
  final String review;
  final String feedback;

  const GetSideBarFBEvent(this.token, this.review, this.feedback);

  @override
  List<Object?> get props => [token, review, feedback];
}

class GetNotificationEvent extends CustomerEvent {
  final String token;

  const GetNotificationEvent(this.token);

  @override
  List<Object?> get props => [token];
}

class GetNotiDeleteEvent extends CustomerEvent {
  final String token;
  final String notificationId;

  const GetNotiDeleteEvent(this.token, this.notificationId);

  @override
  List<Object?> get props => [token, notificationId];
}

class ServicePriceEvent extends CustomerEvent {
  final String token;
  final String categoryId;

  const ServicePriceEvent(this.token, this.categoryId);

  @override
  List<Object?> get props => [token, categoryId];
}

class NotAvailableEvent extends CustomerEvent {
  final String token;
  final List<String> orderNumbers;

  const NotAvailableEvent(this.token, this.orderNumbers);

  @override
  List<Object?> get props => [token, orderNumbers];
}



