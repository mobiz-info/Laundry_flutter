import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:golden_falcon/Models/CustomerModel/area_list_model.dart';
import 'package:golden_falcon/Models/CustomerModel/category_model.dart';
import 'package:golden_falcon/Models/CustomerModel/sub_category_model.dart';
import 'package:golden_falcon/Models/CustomerModel/wallet_outstanding_model.dart';

import '../../Models/CustomerModel/add_address_model.dart';
import '../../Models/CustomerModel/add_complaint_model.dart';
import '../../Models/CustomerModel/call_support_model.dart';
import '../../Models/CustomerModel/cart_count_model.dart';
import '../../Models/CustomerModel/cart_items_inc_dec_model.dart';
import '../../Models/CustomerModel/cart_list_model.dart' as CartList;
import '../../Models/CustomerModel/cart_list_model.dart';
import '../../Models/CustomerModel/cart_payment_list_model.dart';
import '../../Models/CustomerModel/complaint_details_model.dart';
import '../../Models/CustomerModel/complaint_list_model.dart';
import '../../Models/CustomerModel/corporate_save_model.dart';

import '../../Models/CustomerModel/delivery_date_model.dart';
import '../../Models/CustomerModel/delivery_mode_model.dart';
import '../../Models/CustomerModel/device_token_model.dart';
import '../../Models/CustomerModel/edit_profile_get_model.dart';
import '../../Models/CustomerModel/edit_profile_model.dart';
import '../../Models/CustomerModel/email_support_model.dart';
import '../../Models/CustomerModel/emirates_list_model.dart';
import '../../Models/CustomerModel/forgot_password_model.dart';
import '../../Models/CustomerModel/item_add_to_cart_model.dart';
import '../../Models/CustomerModel/item_model.dart';
import '../../Models/CustomerModel/items_incre_decre_model.dart';
import '../../Models/CustomerModel/location_list_model.dart';
import '../../Models/CustomerModel/my_addresses_list_model.dart';
import '../../Models/CustomerModel/new_order_contactless_model.dart';
import '../../Models/CustomerModel/notification_model.dart';
import '../../Models/CustomerModel/order_details_model.dart';
import '../../Models/CustomerModel/order_items_model.dart';
import '../../Models/CustomerModel/order_status_feedback_model.dart';
import '../../Models/CustomerModel/order_status_model.dart';
import '../../Models/CustomerModel/our_branches_model.dart';
import '../../Models/CustomerModel/outstanding_model.dart';
import '../../Models/CustomerModel/outstanding_pay_model.dart';
import '../../Models/CustomerModel/pay_now_outstanding_get_model.dart';
import '../../Models/CustomerModel/pay_outstanding_model.dart';
import '../../Models/CustomerModel/personal_save_model.dart';
import '../../Models/CustomerModel/place_order_model.dart';
import '../../Models/CustomerModel/pricing_model.dart';
import '../../Models/CustomerModel/register_complaint_button_model.dart';
import '../../Models/CustomerModel/register_complaint_list_model.dart';
import '../../Models/CustomerModel/service_price_list_model.dart';
import '../../Models/CustomerModel/services_model.dart';
import '../../Models/CustomerModel/side_bar_feedback_model.dart';
import '../../Models/CustomerModel/sub_services_model.dart';
import '../../Models/CustomerModel/thank_you_model.dart';
import '../../Models/CustomerModel/transaction_history_model.dart';
import '../../Models/CustomerModel/wallet_transaction_model.dart';
import '../../Repositories/CustomerRepo/customer_repository.dart';

part 'customer_event.dart';
part 'customer_state.dart';

class CustomerBloc extends Bloc<CustomerEvent, CustomerState> {
  final CustomerRepository customerRepository;
  var emirateResponse;
  var areaResponse;
  CustomerBloc(this.customerRepository) : super(CustomerInitial()) {
    on<GetBalanceEvent>((event, emit) async {
      emit(CustomerBalanceFetching());
      try {
        await customerRepository.getBalanceData(
            token: event.token, id: event.id).then((value) {
          if (value.stats == true &&
              value.message == "Customer Wallet Details!") {
            emit(CustomerBalanceFetched(value.data));
          } else {
            emit(CustomerBalanceError(value.message));
          }
        });
      } catch (e) {
        emit(CustomerBalanceError(e.toString()));
      }
    });
    on<GetCategoryEvent>((event, emit) async {
      emit(CategoryGettingState());
      try {
        await customerRepository.getCategories(id: event.id, token: event.token)
            .then((value) {
          if (value.status == true &&
              value.message == "Branch Categories List!") {
            emit(CategoryGotState(value.data));
          } else {
            emit(CategoryErrorState(value.message));
          }
        });
      } catch (e) {
        emit(CategoryErrorState(e.toString()));
      }
    });
    on<GetSubCategoryEvent>((event, emit) async {
      emit(SubCategoryGettingState());
      try {
        await customerRepository.getSubCat(
            cat_id: event.cat_id, token: event.token).then((value) {
          if (value.status == true &&
              value.message == "Branch Sub Categories List!") {
            emit(SubCategoryGotState(value.data));
          } else {
            emit(SubCategoryErrorState(value.message));
          }
        });
      } catch (e) {
        emit(SubCategoryErrorState(e.toString()));
      }
    });
    on<GetItemEvent>((event, emit) async {
      emit(ItemGettingState());
      try {
        await customerRepository.getItems(token: event.token, body: event.body)
            .then((value) {
          if (value.status == true &&
              value.message == "Branch Sub Categories List!") {
            emit(ItemGotState(value.data));
          } else {
            emit(ItemErrorState(value.message));
          }
        });
      } catch (e) {
        emit(ItemErrorState(e.toString()));
      }
    });
    on<GetForgotPasswordEvent>((event, emit) async {
      emit(CustomerForgotPwdFetching());
      try {
        //print("event ${event.mobileNum} // emit $emit");
        await customerRepository.getForgotPasswordData(
            mobileNumber: event.mobileNum).then((value) {
          //print("Password $value");
          if (value.message == "OTP sent successfully") {
            emit(CustomerForgotPwdFetched(value));
          } else {
            emit(CustomerForgotPwdError(value.message));
          }
        });
      } catch (e) {
        emit(CustomerForgotPwdError(e.toString()));
      }
    });
    on<GetOtpEvent>((event, emit) async {
      emit(CustomerOtpFetching());
      try {
        await customerRepository.getOtpData(
            mobileNumber: event.mobileNum, otp: event.otp).then((value) {
          print("Otp ${value}");
          if (value.message == "OTP validation successful") {
            emit(CustomerOtpFetched(value.message));
          } else {
            emit(CustomerOtpError(value.message));
          }
        });
      } catch (e) {
        emit(CustomerOtpError(e.toString()));
      }
    });
    on<GetResetPasswordEvent>((event, emit) async {
      emit(CustomerResetPwdFetching());
      try {
        await customerRepository.getResetPwdData(mobileNumber: event.mobileNum,
            newPassword: event.newPassword,
            confirmPassword: event.confirmPassword).then((value) {
          print("Reset ${value}");
          if (value.message == "Password updated successfully") {
            emit(CustomerResetPwdFetched(value.message));
          } else {
            emit(CustomerResetPwdError(value.message));
          }
        });
      } catch (e) {
        emit(CustomerResetPwdError(e.toString()));
      }
    });
    on<GetEmiratesEvent>((event, emit) async {
      emit(EmiratesFetching());
      try {
        await customerRepository.getEmiratesData().then((value) {
          //print("Emirates $value");
          if (value.status == true &&
              value.message == "Successfully Passed Data!") {
            emirateResponse = value.data;
            emit(EmiratesFetched(value.data));
          } else {
            emit(EmiratesError(value.message));
          }
        });
      } catch (e) {
        emit(EmiratesError(e.toString()));
      }
    });
    on<GetAreaEvent>((event, emit) async {
      //emit(AreaFetching());
      try {
        await customerRepository.getAreaData(emirateID: event.emirateID).then((
            value) {
          //print("Area $value");
          if (value.status == true &&
              value.message == "Successfully Passed Data!") {
            emit(AreaFetched(value.data));
          } else {
            emit(AreaError(value.message));
          }
        });
      } catch (e) {
        emit(AreaError(e.toString()));
      }
    });
    on<GetLocationEvent>((event, emit) async {
      // emit(LocationFetching());
      try {
        await customerRepository.getLocationData(areaID: event.areaID).then((
            value) {
          //print("Location $value");
          if (value.status == true &&
              value.message == "Successfully Passed Data!") {
            emit(LocationFetched(value.data));
          } else {
            emit(LocationError(value.message));
          }
        });
      } catch (e) {
        emit(LocationError(e.toString()));
      }
    });
    on<GetPersonalSaveEvent>((event, emit) async {
      //emit(PersonalSaveFetching());
      try {
        await customerRepository.getPersonalData(
            userName: event.userName,
            name: event.name,
            emailID: event.emailID,
            password: event.password,
            customerType: event.customerType,
            buildingNo: event.buildingNo,
            roomNo: event.roomNo,
            mobile: event.mobile,
            altMobile: event.altMobile,
            whatsApp: event.whatsApp,
            creditLimit: event.creditLimit,
            creditDays: event.creditDays,
            creditInvoices: event.creditInvoices,
            gpse: event.gpse,
            gpsn: event.gpsn,
            location: event.location,
            trn: event.trn,
            billingAddress: event.billingAddress,
            designation: event.designation,
            buildingName: event.buildingName,
            floorNumber: event.floorNumber,
            flatNumber: event.flatNumber).then((value) {
          print("Personal $value");
          if (value.status == true &&
              value.message == "New Customer Added Successfully!") {
            emit(PersonalSaveFetched(value.data));
          } else {
            emit(PersonalSaveError(value.message));
          }
        });
      } catch (e) {
        emit(PersonalSaveError(e.toString()));
      }
    });
    on<GetCorporateSaveEvent>((event, emit) async {
      try {
        await customerRepository.getCorporateData(
            userName: event.userName,
            name: event.name,
            emailID: event.emailID,
            password: event.password,
            customerType: event.customerType,
            buildingNo: event.buildingNo,
            roomNo: event.roomNo,
            regEmail: event.regEmail,
            mobile: event.mobile,
            altMobile: event.altMobile,
            whatsApp: event.whatsApp,
            creditLimit: event.creditLimit,
            creditDays: event.creditDays,
            creditInvoices: event.creditInvoices,
            gpse: event.gpse,
            gpsn: event.gpsn,
            location: event.location,
            companyName: event.companyName,
            trn: event.trn,
            billingAddress: event.billingAddress,
            designation: event.designation,
            buildingAddress: event.buildingAddress,
            floorNumber: event.floorNumber,
            flatNumber: event.flatNumber,
            addressList: event.addressList).then((value) {
          print("Corporate $value");
          if (value.status == true &&
              value.message == "New Customer Added Successfully!") {
            emit(CorporateSaveFetched(value.data));
          } else {
            emit(CorporateSaveError(value.message));
          }
        });
      } catch (e) {
        emit(CorporateSaveError(e.toString()));
      }
    });
    on<GetDeliveryModeEvent>((event, emit) async {
      emit(DeliveryModeFetching());
      try {
        await customerRepository.getDeliveryMode(token: event.token).then((
            value) {
          if (value.status == true &&
              value.message == "data passed successfully") {
            emit(DeliveryModeFetched(value.data));
          } else {
            emit(DeliveryModeError(value.message));
          }
        });
      } catch (e) {
        emit(DeliveryModeError(e.toString()));
      }
    });
    on<GetDeliveryDateEvent>((event, emit) async {
      emit(DeliveryDateFetching());
      try {
        await customerRepository.getDeliveryDate(
            token: event.token, deliveryMode: event.deliveryMode).then((value) {
          if (value.status == true &&
              value.message == "Delivery Dates passed successfully") {
            emit(DeliveryDateFetched(value.data));
          } else {
            emit(DeliveryDateError(value.message));
          }
        });
      } catch (e) {
        emit(DeliveryDateError(e.toString()));
      }
    });
    on<GetDeliveryTimeEvent>((event, emit) async {
      emit(DeliveryTimeFetching());
      try {
        await customerRepository.getDeliveryTime(
            token: event.token, deliveryDate: event.deliveryDate).then((value) {
          if (value.status == true && value.message == "Time intervals") {
            print('1111');
            emit(DeliveryTimeFetched(value.data));
          } else {
            print('2222 ${value.message}');
            emit(DeliveryTimeError(value.message));
          }
        });
      } catch (e) {
        print('3333');
        emit(DeliveryTimeError(e.toString()));
      }
    });
    on<GetContactlessOrderEvent>((event, emit) async {
      emit(ContactlessOrderFetching());
      try {
        await customerRepository.getContactlessOrder(
            token: event.token,
            id: event.id,
            pickupDate: event.pickupDate,
            pickupTime: event.pickupTime,
            orderType: event.orderType,
            pickupMode: event.pickupMode).then((value) {
          if (value.status == true &&
              value.message == "Order Successfully Saved!") {
            // print('1111');
            emit(ContactlessOrderFetched(value.data));
          } else {
            // print('2222 ${value.message}');
            emit(ContactlessOrderError(value.message));
          }
        });
      } catch (e) {
        // print('3333');
        emit(ContactlessOrderError(e.toString()));
      }
    });
    on<GetServicesEvent>((event, emit) async {
      emit(ServicesFetching());
      try {
        await customerRepository.getServices(token: event.token, id: event.id,)
            .then((value) {
          if (value.status == true &&
              value.message == "Branch Categories List!") {
            // print('1111');
            emit(ServicesFetched(value.data));
          } else {
            // print('2222 ${value.message}');
            emit(ServicesError(value.message));
          }
        });
      } catch (e) {
        // print('3333');
        emit(ServicesError(e.toString()));
      }
    });
    on<GetSubServicesEvent>((event, emit) async {
      emit(SubServicesFetching());
      try {
        await customerRepository.getSubServices(
            token: event.token, categoriesID: event.categoriesId).then((value) {
          if (value.status == true &&
              value.message == "Branch Sub Categories List!") {
            // print('1111');
            emit(SubServicesFetched(value.data));
          } else {
            // print('2222 ${value.message}');
            emit(SubServicesError(value.message));
          }
        });
      } catch (e) {
        // print('3333');
        emit(SubServicesError(e.toString()));
      }
    });
    on<GetOrderItemsEvent>((event, emit) async {
      emit(OrderItemsFetching());
      try {
        await customerRepository.getOrderItems(
            token: event.token,
            id: event.id,
            catergoryId: event.categoriesId,
            subCategoryId: event.subCategoriesId,
            orderId: event.orderId).then((value) {
          if (value.status == true &&
              value.message == "Branch Sub Categories List!") {
            //print('1111');
            emit(OrderItemsFetched(value.data));
          } else {
            //print('2222 ${value.message}');
            emit(OrderItemsError(value.message));
          }
        });
      } catch (e) {
        //print('3333');
        emit(OrderItemsError(e.toString()));
      }
    });
    on<GetItemsIncreDecreEvent>((event, emit) async {
      emit(ItemsIncreDecreFetching());
      try {
        await customerRepository.getItemsIncreDecre(
            token: event.token,
            orderId: event.orderId,
            priceListId: event.priceListId,
            itemServiceId: event.itemServiceId,
            quantity: event.quantity).then((value) {
          if (value.status == true &&
              value.message == "Total amount changed Successfully!") {
            print('1111');
            emit(ItemsIncreDecreFetched(value.data));
          } else {
            print('2222 ${value.message}');
            emit(ItemsIncreDecreError(value.message));
          }
        });
      } catch (e) {
        print('3333');
        emit(ItemsIncreDecreError(e.toString()));
      }
    });
    on<GetItemAddtoCartEvent>((event, emit) async {
      emit(ItemAddCartFetching());
      try {
        await customerRepository.getItemAddCart(
            token: event.token,
            orderId: event.orderId,
            priceListId: event.priceListId,
            itemServiceId: event.itemServiceId,
            quantity: event.quantity,
            amount: event.amount).then((value) {
          if (value.status == true &&
              value.message == "Already Added this item to the cart!") {
            print('1111');
            emit(ItemAddCartFetched(value.data));
          } else {
            print('2222 ${value.message}');
            emit(ItemAddCartError(value.message));
          }
        });
      } catch (e) {
        print('3333');
        emit(ItemAddCartError(e.toString()));
      }
    });
    on<GetCartCountEvent>((event, emit) async {
      emit(CartCountFetching());
      try {
        await customerRepository.getCartCount(
          token: event.token,
          orderId: event.orderId,
        ).then((value) {
          if (value.status == true && value.message == "Cart Count!") {
            print('1111');
            emit(CartCountFetched(value.data));
          } else {
            print('2222 ${value.message}');
            emit(CartCountError(value.message));
          }
        });
      } catch (e) {
        print('3333');
        emit(CartCountError(e.toString()));
      }
    });
    on<GetCartListEvent>((event, emit) async {
      emit(CartListFetching());
      try {
        await customerRepository.getCartList(
          token: event.token,
          orderId: event.orderId,
        ).then((value) {
          if (value.status == true && value.message == "Customer Cart List!") {
            print('1111');
            emit(CartListFetched(
                value.data, value.data?.cart?.first.order?.customer?.toJson()));
          } else {
            print('2222 ${value.message}');
            emit(CartListError(value.message));
          }
        });
      } catch (e) {
        print('3333');
        emit(CartListError(e.toString()));
      }
    });
    on<GetCartItemsIncreDecreEvent>((event, emit) async {
      emit(CartItemsIncreDecreFetching());
      try {
        await customerRepository.getCartItemsIncreDecre(
            token: event.token,
            orderId: event.orderId,
            cartId: event.cartId,
            priceListId: event.priceListId,
            itemServiceId: event.itemServiceId,
            quantity: event.quantity).then((value) {
          if (value.status == true &&
              value.message == "Amount successfully updated") {
            print('1111');
            emit(CartItemsIncreDecreFetched(value.data));
          } else {
            print('2222 ${value.message}');
            emit(CartItemsIncreDecreError(value.message));
          }
        });
      } catch (e) {
        print('3333');
        emit(CartItemsIncreDecreError(e.toString()));
      }
    });
    on<GetCartDeletionEvent>((event, emit) async {
      emit(CartDeletionFetching());
      try {
        await customerRepository.getDeletionData(
            token: event.token, cartId: event.cartId).then((value) {
          if (value.message == "Cart Deleted Successfully!") {
            emit(CartDeletionFetched(value.message));
          } else {
            emit(CartDeletionError(value.message));
          }
        });
      } catch (e) {
        emit(CartDeletionError(e.toString()));
      }
    });
    on<GetThankYouEvent>((event, emit) async {
      emit(ThankYouFetching());
      try {
        await customerRepository.getThankYouData(token: event.token,
            orderId: event.orderId,
            customerId: event.customerId).then((value) {
          if (value.message == "Data passed successfully!") {
            emit(ThankYouFetched(value.data));
          } else {
            emit(ThankYouError(value.message));
          }
        });
      } catch (e) {
        emit(ThankYouError(e.toString()));
      }
    });
    on<GetDeliveryAddrEvent>((event, emit) async {
      print('checkkkkk');
      CartList.Customer customerData = CartList.Customer(
          name: event.address["name"],
          buildingName: event.address["building_name_no"],
          buildingNo: '',
          floorNumber: event.address["floor_no"],
          flatNumber: event.address["flat_no_house_no"],
          mobile: event.address["person_incharge_mob"]
      );
      emit(CartListFetched(event.data, customerData.toJson()));
    });
    on<GetPlaceOrderEvent>((event, emit) async {
      emit(PlaceOrderFetching());
      try {
        await customerRepository.getPlaceOrderData(
            token: event.token,
            id: event.id,
            orderId: event.orderId,
            discount: event.discount,
            netTaxable: event.netTaxable,
            vat: event.vat,
            grandTotal: event.grandTotal,
            collectMode: event.collectMode,
            payedAmount: event.payedAmount,
            customerAddress: event.customerAddress
        ).then((value) {
          if (value.message == "Payment Added Successfully!") {
            emit(PlaceOrderFetched(value.data));
          } else {
            emit(PlaceOrderError(value.message));
          }
        });
      } catch (e) {
        emit(PlaceOrderError(e.toString()));
      }
    });
    on<GetCartPaymentListEvent>((event, emit) async {
      emit(CartPaymentListFetching());
      try {
        await customerRepository.getCartPaymentListData(token: event.token)
            .then((value) {
          if (value.message == "data passed successfully") {
            emit(CartPaymentListFetched(value.data));
          } else {
            emit(CartPaymentListError(value.message));
          }
        });
      } catch (e) {
        emit(CartPaymentListError(e.toString()));
      }
    });
    on<GetCartWalletEvent>((event, emit) async {
      emit(CartWalletFetching());
      try {
        await customerRepository.getCartWalletData(token: event.token,
            orderId: event.orderId,
            customerId: event.customerId).then((value) {
          if (value.message == "No outstanding dues") {
            emit(CartWalletFetched(value.message));
          } else {
            emit(CartWalletError(value.message));
          }
        });
      } catch (e) {
        emit(CartWalletError(e.toString()));
      }
    });
    on<GetOrderStatusEvent>((event, emit) async {
      emit(OrderStatusFetching());
      try {
        await customerRepository.getOrderStatusData(token: event.token,
            id: event.id,
            fromDate: event.from_Date,
            toDate: event.to_Date).then((value) {
          if (value.message == "Data passed successfully") {
            emit(OrderStatusFetched(value.data));
          } else {
            emit(OrderStatusError(value.message));
          }
        });
      } catch (e) {
        emit(OrderStatusError(e.toString()));
      }
    });
    on<GetOrderStatusFeedbackEvent>((event, emit) async {
      emit(OrderStatusFBFetching());
      try {
        await customerRepository.getOrderStatusFBData(token: event.token,
          orderId: event.orderId,
          review: event.review,
          feedback: event.feedback).then((value) {
          if (value.message == "Data passed successfully") {
            emit(OrderStatusFBFetched(value.data));
          } else {
            emit(OrderStatusFBError(value.message));
          }
        });
      } catch (e) {
        emit(OrderStatusFBError(e.toString()));
      }
    });
    on<GetOrderDetailsEvent>((event, emit) async {
      emit(OrderDetailsFetching());
      try {
        var value = await customerRepository.getOrderDetailsData(token: event.token, orderId: event.orderId);
          if (value.message == "Customer Cart List!") {
            print('detail 1111');
            emit(OrderDetailsFetched(value?.data));
          } else {
            print('detail 2222');
            emit(OrderDetailsError(value.message));
          }
      } catch (e) {
        print('detail 3333');
        emit(OrderDetailsError(e.toString()));
      }
    });
    on<GetWalletTransactionEvent>((event, emit) async {
      emit(WalletTransactionFetching());
      try {
        await customerRepository.getWalletTransactionData(token: event.token,
            id: event.id).then((value) {
          if (value.message == "Data passed successfully") {
            emit(WalletTransactionFetched(value.data));
          } else {
            emit(WalletTransactionError(value.message));
          }
        });
      } catch (e) {
        emit(WalletTransactionError(e.toString()));
      }
    });
    on<GetWalletRechargeEvent>((event, emit) async {
      emit(WalletRechargeFetching());
      try {
        await customerRepository.getWalletRechargeData(token: event.token,
            id: event.id, amount: event.amount, paymentMode: event.paymentMode).then((value) {
          if (value.data?.message == "Your request for top up has been Succesfully placed !!!") {
            emit(WalletRechargeFetched(value.data?.message));
          } else {
            emit(WalletRechargeError(value.data?.message));
          }
        });
      } catch (e) {
        emit(WalletRechargeError(e.toString()));
      }
    });
    on<GetTransHistoryEvent>((event, emit) async {
      emit(TransactionHistoryFetching());
      try {
        await customerRepository.getTransactionData(token: event.token,
            fromDate: event.from_Date, toDate: event.to_Date).then((value) {
          if (value.message == "Data passed successfully") {
            emit(TransactionHistoryFetched(value.data));
          } else {
            emit(TransactionHistoryError(value.message));
          }
        });
      } catch (e) {
        emit(TransactionHistoryError(e.toString()));
      }
    });
    on<GetOutstandingEvent>((event, emit) async {
      emit(OutstandingFetching());
      try {
        await customerRepository.getOutstandingData(token: event.token).then((value) {
          if (value.message == "Outstanding Dues List!") {
            emit(OutstandingFetched(value.data));
          } else {
            emit(OutstandingError(value.message));
          }
        });
      } catch (e) {
        emit(OutstandingError(e.toString()));
      }
    });
    // on<GetOutstandingPayEvent>((event, emit) async {
    //   emit(OutstandingPayFetching());
    //   try {
    //     await customerRepository.getOutstandingPayData(
    //         token: event.token,
    //         outstandingId: event.outstandingId,
    //         amountPaid: event.amountPaid).then((value) {
    //       if (value.data?.message == "Paid Successfully") {
    //         emit(OutstandingPayFetched(value.data));
    //       } else {
    //         emit(OutstandingPayError(value.data?.message));
    //       }
    //     });
    //   } catch (e) {
    //     emit(OutstandingPayError(e.toString()));
    //   }
    // });
    on<GetComplaintListEvent>((event, emit) async {
      emit(ComplaintListFetching());
      try {
        await customerRepository.getComplaintListData(
            token: event.token).then((value) {
          if (value.message == "Customer Complaints List!") {
            emit(ComplaintListFetched(value));
          } else {
            emit(ComplaintListError(value.message));
          }
        });
      } catch (e) {
        emit(ComplaintListError(e.toString()));
      }
    });
    on<GetAddComplaintEvent>((event, emit) async {
      emit(AddComplaintFetching());
      try {
        await customerRepository.getAddComplaintData(
            token: event.token).then((value) {
          if (value.message == "Customer recent order list!") {
            emit(AddComplaintFetched(value.data));
          } else {
            emit(AddComplaintError(value.message));
          }
        });
      } catch (e) {
        emit(AddComplaintError(e.toString()));
      }
    });
    on<GetRegisterComplaintListEvent>((event, emit) async {
      emit(RegisterComplaintListFetching());
      try {
        await customerRepository.getRegisterComplaintData(
            token: event.token, orderId: event.orderId).then((value) {
          if (value.message == "Customer Cart List!") {
            emit(RegisterComplaintListFetched(value.data));
          } else {
            emit(RegisterComplaintListError(value.message));
          }
        });
      } catch (e) {
        emit(RegisterComplaintListError(e.toString()));
      }
    });
    on<GetRegisterComplaintButtonEvent>((event, emit) async {
      emit(RegisterComplaintButtonFetching());
      try {
        await customerRepository.getRegisterButtonData(
            token: event.token,
            order: event.order,
            complaintType: event.complaintType,
            service: event.service,
            customer: event.customer,
            remarks: event.remarks,
            photo: event.photo,
            uploadPhoto: event.uploadPhoto).then((value) {
          if (value.message == "Your Complaint Has Been  Successfully Registerd! Our Team Will Reply Soon") {
            emit(RegisterComplaintButtonFetched(value.data));
          } else {
            emit(RegisterComplaintButtonError(value.message));
          }
        });
      } catch (e) {
        emit(RegisterComplaintButtonError(e.toString()));
      }
    });
    on<GetComplaintDetailsEvent>((event, emit) async {
      emit(ComplaintDetailsFetching());
      try {
        await customerRepository.getComplaintDetailsData(
            token: event.token, complaintId: event.complaintId).then((value) {
          if (value.message == "Customer Complaints!") {
            emit(ComplaintDetailsFetched(value.data));
          } else {
            emit(ComplaintDetailsError(value.message));
          }
        });
      } catch (e) {
        emit(ComplaintDetailsError(e.toString()));
      }
    });

    on<GetMyAddressesListEvent>((event, emit) async {
      emit(MyAddressesListFetching());
      try {
        await customerRepository.getMyAddressesData(token: event.token).then((value) {
          if (value.message == "Data passed successfully!") {
            emit(MyAddressesListFetched(value.data));
          } else {
            emit(MyAddressesListError(value.message));
          }
        });
      } catch (e) {
        emit(MyAddressesListError(e.toString()));
      }
    });

    on<GetAddAddressesEvent>((event, emit) async {
      emit(AddAddressFetching());
      try {
        await customerRepository.getAddAddressData(
          token: event.token,
          emirate: event.emirate,
          area: event.area,
          location: event.location,
          buildingNameNo: event.buildingNameNo,
          floorNo: event.floorNo,
          flatNoHouseNo: event.flatNoHouseNo,
          personInchargeMob: event.personInchargeMob,
          name: event.name,
          gpse: event.gpse,
          gpsn: event.gpsn,
          whatsAppNum: event.whatsAppNum
        ).then((value) {
          if (value.message == "Data passed successfully!") {
            emit(AddAddressFetched(value.data));
          } else {
            emit(AddAddressError(value.message));
          }
        });
      } catch (e) {
        emit(AddAddressError(e.toString()));
      }
    });

    on<GetEditProfileEvent>((event, emit) async {
      emit(EditProfileGetFetching());
      try {
        await customerRepository.getEditProfileData(token: event.token).then((value) {
          if (value.message == "Customer Details!") {
            emit(EditProfileGetFetched(value.data));
          } else {
            emit(EditProfileGetError(value.message));
          }
        });
      } catch (e) {
        emit(EditProfileGetError(e.toString()));
      }
    });

    on<GetEditingProfileEvent>((event, emit) async {
      emit(EditProfileFetching());
      try {
        await customerRepository.getEditedProfileData(
          token: event.token,
          gpse: event.gpse,
          gpsn: event.gpsn,
          location: event.location,
          name: event.name,
          mobile: event.mobile,
          whatsApp: event.whatsApp,
          buildingNo: event.buildingNo,
          buildingName: event.buildingName,
          floorNumber: event.floorNumber,
          flatNumber: event.flatNumber
        ).then((value) {
          if (value.message == "Profile Updated Successfully!") {
            emit(EditProfileFetched(value.data));
          } else {
            emit(EditProfileError(value.message));
          }
        });
      } catch (e) {
        emit(EditProfileError(e.toString()));
      }
    });

    on<GetPayNowOutstandingEvent>((event, emit) async {
      emit(PayOutstandingGetFetching());
      try {
        await customerRepository.getPayNowOutstandingData(token: event.token).then((value) {
          if (value.message == " data succesfully passed") {
            emit(PayOutstandingGetFetched(value.data));
          } else {
            emit(PayOutstandingGetError(value.message));
          }
        });
      } catch (e) {
        emit(PayOutstandingGetError(e.toString()));
      }
    });

    on<GetPayOutstandingEvent>((event, emit) async {
      emit(PayOutstandingFetching());
      try {
        await customerRepository.getPayOutstandingData(token: event.token,
        paymentMtd: event.paymentMtd, amtPayable: event.amtPayable).then((value) {
          if (value.message == " succesfully paid") {
            emit(PayOutstandingFetched(value.data));
          } else {
            emit(PayOutstandingError(value.message));
          }
        });
      } catch (e) {
        emit(PayOutstandingError(e.toString()));
      }
    });

    on<GetOutstandingProceedIndivEvent>((event, emit) async {
      emit(OutstandingProceedIndivFetching());
      try {
        await customerRepository.getOutstandingProceedIndivData(token: event.token, orderNum: event.orderNum,
            amountPayable: event.amountPayable, paymentMtd: event.paymentMtd).then((value) {
          if (value.message == "payment done successfully") {
            emit(OutstandingProceedIndivFetched(value.message));
          } else {
            emit(OutstandingProceedIndivError(value.message));
          }
        });
      } catch (e) {
        emit(OutstandingProceedIndivError(e.toString()));
      }
    });

    on<GetOutstandingProceedComEvent>((event, emit) async {
      emit(OutstandingProceedComFetching());
      try {
        await customerRepository.getOutstandingProceedComData(token: event.token, netPayable: event.netPayable,
            amountPayable: event.amountPayable, paymentMtd: event.paymentMtd).then((value) {
          if (value.message == "payment done successfully") {
            emit(OutstandingProceedComFetched(value.message));
          } else {
            emit(OutstandingProceedComError(value.message));
          }
        });
      } catch (e) {
        emit(OutstandingProceedComError(e.toString()));
      }
    });

    on<GetCallSupportEvent>((event, emit) async {
      emit(CallSupportFetching());
      try {
        await customerRepository.getCallSupportData(token: event.token).then((value) {
          if (value.message == "Successfully Passed Data!") {
            emit(CallSupportFetched(value.data));
          } else {
            emit(CallSupportError(value.message));
          }
        });
      } catch (e) {
        emit(CallSupportError(e.toString()));
      }
    });

    on<GetBranchesEvent>((event, emit) async {
      emit(OurBranchesFetching());
      try {
        await customerRepository.getBranchesData(token: event.token).then((value) {
          if (value.message == "Successfully Passed Data!") {
            emit(OurBranchesFetched(value.data));
          } else {
            emit(OurBranchesError(value.message));
          }
        });
      } catch (e) {
        emit(OurBranchesError(e.toString()));
      }
    });

    on<GetPricingEvent>((event, emit) async {
      emit(PricingFetching());
      try {
        await customerRepository.getPricingData(token: event.token).then((value) {
          if (value.message == "Price list listed succesfully") {
            emit(PricingFetched(value.data));
          } else {
            emit(PricingError(value.message));
          }
        });
      } catch (e) {
        emit(PricingError(e.toString()));
      }
    });

    on<GetEmailSupportEvent>((event, emit) async {
      emit(EmailSupportFetching());
      try {
        await customerRepository.getEmailSupportData(token: event.token, name: event.name,
          email: event.email, phone: event.phone, message: event.message).then((value) {
          if (value.message == "Data passed successfully!") {
            emit(EmailSupportFetched(value.data));
          } else {
            emit(EmailSupportError(value.message));
          }
        });
      } catch (e) {
        emit(EmailSupportError(e.toString()));
      }
    });

    on<GetSideBarFBEvent>((event, emit) async {
      emit(SideBarFBFetching());
      try {
        await customerRepository.getSideBarFBData(token: event.token,
        review: event.review, feedback: event.feedback).then((value) {
          if (value.message == "Data passed successfully") {
            emit(SideBarFBFetched(value.data));
          } else {
            emit(SideBarFBError(value.message));
          }
        });
      } catch (e) {
        emit(SideBarFBError(e.toString()));
      }
    });

    on<GetNotificationEvent>((event, emit) async {
      emit(NotificationFetching());
      try {
        await customerRepository.getNotificationData(token: event.token).then((value) {
          if (value.message == "Successfully Passed Data!") {
            emit(NotificationFetched(value.data));
          } else {
            emit(NotificationError(value.message));
          }
        });
      } catch (e) {
        emit(NotificationError(e.toString()));
      }
    });

    on<GetNotiDeleteEvent>((event, emit) async {
      emit(NotiDeleteFetching());
      try {
        await customerRepository.getNotiDeleteData(token: event.token, notificationId: event.notificationId).then((value) {
          if (value.message == "Successfully Deleted!") {
            emit(NotiDeleteFetched(value.message));
          } else {
            emit(NotiDeleteError(value.message));
          }
        });
      } catch (e) {
        emit(NotiDeleteError(e.toString()));
      }
    });

    on<ServicePriceEvent>((event, emit) async {
      emit(ServicePriceFetching());
      try {
        await customerRepository.getServicePriceData(token: event.token, categoryId: event.categoryId).then((value) {
          if (value.message == "Price list listed succesfully") {
            emit(ServicePriceFetched(value.data));
          } else {
            emit(ServicePriceError(value.message));
          }
        });
      } catch (e) {
        emit(ServicePriceError(e.toString()));
      }
    });

  }
}
