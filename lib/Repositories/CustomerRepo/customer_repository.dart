import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:golden_falcon/Customers/recharge_wallet.dart';
import 'package:golden_falcon/Models/CustomerModel/add_address_model.dart';
import 'package:golden_falcon/Models/CustomerModel/add_complaint_model.dart';
import 'package:golden_falcon/Models/CustomerModel/area_list_model.dart';
import 'package:golden_falcon/Models/CustomerModel/call_support_model.dart';
import 'package:golden_falcon/Models/CustomerModel/cart_count_model.dart';
import 'package:golden_falcon/Models/CustomerModel/cart_deletion_model.dart';
import 'package:golden_falcon/Models/CustomerModel/cart_items_inc_dec_model.dart';
import 'package:golden_falcon/Models/CustomerModel/cart_payment_list_model.dart';
import 'package:golden_falcon/Models/CustomerModel/cart_wallet_model.dart';
import 'package:golden_falcon/Models/CustomerModel/complaint_details_model.dart';
import 'package:golden_falcon/Models/CustomerModel/complaint_list_model.dart';
import 'package:golden_falcon/Models/CustomerModel/device_token_model.dart';
import 'package:golden_falcon/Models/CustomerModel/email_support_model.dart';
import 'package:golden_falcon/Models/CustomerModel/get_delivery_address_model.dart';
import 'package:golden_falcon/Models/CustomerModel/delivery_date_model.dart';
import 'package:golden_falcon/Models/CustomerModel/delivery_mode_model.dart';
import 'package:golden_falcon/Models/CustomerModel/emirates_list_model.dart';
import 'package:golden_falcon/Models/CustomerModel/items_incre_decre_model.dart';
import 'package:golden_falcon/Models/CustomerModel/location_list_model.dart';
import 'package:golden_falcon/Models/CustomerModel/my_addresses_list_model.dart';
import 'package:golden_falcon/Models/CustomerModel/new_order_contactless_model.dart';
import 'package:golden_falcon/Models/CustomerModel/noti_delete_model.dart';
import 'package:golden_falcon/Models/CustomerModel/notification_model.dart';
import 'package:golden_falcon/Models/CustomerModel/order_items_model.dart';
import 'package:golden_falcon/Models/CustomerModel/order_status_feedback_model.dart';
import 'package:golden_falcon/Models/CustomerModel/order_status_model.dart';
import 'package:golden_falcon/Models/CustomerModel/otp_model.dart';
import 'package:golden_falcon/Models/CustomerModel/outstanding_model.dart';
import 'package:golden_falcon/Models/CustomerModel/outstanding_pay_model.dart';
import 'package:golden_falcon/Models/CustomerModel/outstanding_proceed_individual.dart';
import 'package:golden_falcon/Models/CustomerModel/pay_outstanding_model.dart';
import 'package:golden_falcon/Models/CustomerModel/place_order_model.dart';
import 'package:golden_falcon/Models/CustomerModel/pricing_model.dart';
import 'package:golden_falcon/Models/CustomerModel/recharge_wallet_model.dart';
import 'package:golden_falcon/Models/CustomerModel/register_complaint_button_model.dart';
import 'package:golden_falcon/Models/CustomerModel/register_complaint_list_model.dart';
import 'package:golden_falcon/Models/CustomerModel/reset_password_model.dart';
import 'package:golden_falcon/Models/CustomerModel/side_bar_feedback_model.dart';
import 'package:golden_falcon/Models/CustomerModel/sub_services_model.dart';
import 'package:golden_falcon/Models/CustomerModel/thank_you_model.dart';
import 'package:golden_falcon/Models/CustomerModel/wallet_transaction_model.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:golden_falcon/Models/CustomerModel/forgot_password_model.dart';
import 'package:golden_falcon/Utils/common.dart';

import '../../Models/CustomerModel/cart_list_model.dart';
import '../../Models/CustomerModel/category_model.dart';
import '../../Models/CustomerModel/corporate_save_model.dart';
import '../../Models/CustomerModel/delivery_time_model.dart';
import '../../Models/CustomerModel/edit_profile_get_model.dart';
import '../../Models/CustomerModel/edit_profile_model.dart';
import '../../Models/CustomerModel/item_add_to_cart_model.dart';
import '../../Models/CustomerModel/item_model.dart';
import '../../Models/CustomerModel/order_details_model.dart';
import '../../Models/CustomerModel/our_branches_model.dart';
import '../../Models/CustomerModel/outstanding_proceed_com_model.dart';
import '../../Models/CustomerModel/pay_now_outstanding_get_model.dart';
import '../../Models/CustomerModel/personal_save_model.dart';
import '../../Models/CustomerModel/service_price_list_model.dart';
import '../../Models/CustomerModel/services_model.dart';
import '../../Models/CustomerModel/sub_category_model.dart';
import '../../Models/CustomerModel/transaction_history_model.dart';
import '../../Models/CustomerModel/wallet_outstanding_model.dart';

class CustomerRepository {
  Dio dio = Dio();
//   Wallet Balance and OutStanding;
  Future<CustomerBalanceModel> getBalanceData({required String token, required String id}) async {
    print('token ${token}');
    print('id ${id}');
    Map<String, String> data = {
      'id': id
    };
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'customer/wallet_balance_api',
        data: data,
        options: options
      );

      print(response.data);

      if (response.statusCode == 200 ) {
        var result = CustomerBalanceModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get Category
  Future<CustomerCategoryModel> getCategories({required String id, required String token}) async {
    Map<String, String> data = {
      'id': id
    };

    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));

    try {
      var response = await dio.post(
        baseUrl+'customer/new_order_branch_categories_api',
        data: data,
        options: options
      );
      print(response.data);
      if (response.statusCode == 200) {
        var result = CustomerCategoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get sub category
  Future<CustomersubCategoryModel> getSubCat({required String cat_id, required String token}) async {
    Map<String, String> data = {
      "category_id": cat_id
    };

    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    try {
      var response = await dio.post(
        baseUrl+'customer/new_order_branch_sub_categories_api',
        data: data,
        options: options
      );
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = CustomersubCategoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }

  // get items
  Future<CustomerItemModel> getItems ({required String token, required Map<String, String> body}) async {
    print(body);
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'customer/new_order_item_details_api',
        data: body,
        options: options,
      );

      print('REP : ${response.data}');

      if (response.statusCode == 200) {
        var result = CustomerItemModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get forgot password
  Future<ForgotPasswordModel> getForgotPasswordData({required String mobileNumber}) async {
    print('mobile $mobileNumber');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(Uri.parse
          (baseUrl+'accounts/forgot_pswd'),
          //headers: headers,
          body: {
            "mobile": mobileNumber
          }
      );
      print(response.body);
      if (response.statusCode == 200 ) {
        var result = ForgotPasswordModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get otp password
  Future<OtpModel> getOtpData({required String mobileNumber, required String otp}) async {
    print('mobile $mobileNumber');
    print('otp $otp');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(Uri.parse
        (baseUrl+'accounts/verify_otp'),
          //headers: headers,
          body: {
            "mobile": mobileNumber,
            "code": otp
          }
      );
      print(response.body);
      if (response.statusCode == 200 ) {
        var result = OtpModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get reset password
  Future<ResetPasswordModel> getResetPwdData({required String mobileNumber, required String newPassword, required String confirmPassword}) async {
    print('New Password $newPassword');
    print('Confirm Password $confirmPassword');
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(Uri.parse
        (baseUrl+'accounts/reset_password'),
          //headers: headers,
          body: {
            "mobile": mobileNumber,
            "new_password": newPassword,
            "confirm_password": confirmPassword
          }
      );
      print(response.body);
      if (response.statusCode == 200 ) {
        var result = ResetPasswordModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get emirates
  Future<EmiratesListModel> getEmiratesData() async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.get(Uri.parse
        (baseUrl+'accounts/add_personal_emirates'),
      );
      print(response.body);
      if (response.statusCode == 200 ) {
        var result = EmiratesListModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get area
  Future<AreaListModel> getAreaData({required String emirateID}) async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(Uri.parse
        (baseUrl+'accounts/add_personal_area'),
          //headers: headers,
          body: {
            "emirate_id": emirateID
          }
      );
      print(response.body);
      if (response.statusCode == 200 ) {
        var result = AreaListModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get location
  Future<LocationListModel> getLocationData({required String areaID}) async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(Uri.parse
        (baseUrl+'accounts/add_personal_location'),
          //headers: headers,
          body: {
            "area_id": areaID
          }
      );
      print(response.body);
      if (response.statusCode == 200 ) {
        var result = LocationListModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get personal save
  Future<PersonalSaveModel> getPersonalData({
    required String userName,
    required String name,
    required String emailID,
    required String password,
    required String customerType,
    required int buildingNo,
    required String roomNo,
    required int mobile,
    required int altMobile,
    required int whatsApp,
    required int creditLimit,
    required int creditDays,
    required int creditInvoices,
    required int gpse,
    required int gpsn,
    required String location,
    required String trn,
    required String billingAddress,
    required String designation,
    required String buildingName,
    required String floorNumber,
    required String flatNumber
    }) async {
    Future.delayed(Duration(seconds: 1));
     try {
      var body= {
        "username": userName,
        "name": name,
        "email": emailID,
        "password": password,
        "customer_type": customerType,
        "building_no": buildingNo.toString(),
        "room_no": roomNo,
        "mobile": mobile.toString(),
        "alt_mobile": altMobile.toString(),
        "whats_app": whatsApp.toString(),
        "credit_limit": creditLimit.toString(),
        "credit_days": creditDays.toString(),
        "credit_invoices": creditInvoices.toString(),
        "GPSE": gpse.toString(),
        "GPSN": gpsn.toString(),
        "Location": location,
        "TRN": trn,
        "billing_addrs": billingAddress,
        "designation": designation,
        "building_name": buildingName,
        "floor_number": floorNumber,
        "flat_number": flatNumber
      };
      // var aa=json.encode(body);
      // print("BBBOOODDDYYYBBBOOODDDYYY ${aa}")  ;
      debugPrint('Personal Body $body');
      var response =  await dio.post('${baseUrl}accounts/personal_datasave',data: body);
      print('///////lllllll  ${response.data}');
      print('///////lllllll  ${response.statusCode}');
      if (response.statusCode == 200 ) {
        var result = PersonalSaveModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      print("EEERROORR ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  //get corporate save
  Future<CorporateSaveModel> getCorporateData({
    required String userName,
    required String name,
    required String emailID,
    required String password,
    required String customerType,
    required String buildingNo,
    required String roomNo,
    required String regEmail,
    required int mobile,
    required int altMobile,
    required int whatsApp,
    required int creditLimit,
    required int creditDays,
    required int creditInvoices,
    required int gpse,
    required int gpsn,
    required String location,
    required String companyName,
    required String trn,
    required String billingAddress,
    required String designation,
    required String buildingAddress,
    required String floorNumber,
    required String flatNumber,
    required List<AddressList>? addressList
    }) async {
    Future.delayed(Duration(seconds: 1));
    try {
      print('boddyyy ${addressList?.length}');
      var body = {
        "username": userName,
        "name": name,
        "email": emailID,
        "password": password,
        "customer_type": customerType,
        "building_no": buildingNo,
        "room_no": roomNo,
        "reg_email": regEmail,
        "mobile": mobile,
        "alt_mobile": altMobile,
        "whats_app": whatsApp,
        "credit_limit": creditLimit,
        "credit_days": creditDays,
        "credit_invoices": creditInvoices,
        "GPSE": gpse,
        "GPSN": gpsn,
        "Location": location,
        "company_name": companyName,
        "TRN": trn,
        "billing_addrs": billingAddress,
        "designation": designation,
        "building_name": buildingAddress,
        "floor_number": floorNumber,
        "flat_number": flatNumber,
        "address_list": addressList
      };
      print('boddyyy ${jsonEncode(body)}');
      var response =  await dio.post('${baseUrl}accounts/corporate_datasave',data: body);
      print('///////ccccccccc  ${response.data}');
      print('///////cccccccccc  ${response.statusCode}');
      if (response.statusCode == 200 ) {
        print('vbvbvbvbvb ${response.data}');
        var result = CorporateSaveModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      print("EEERROORR ${e.toString()}");
      throw Exception(e.toString());
    }
  }

  // get delivery mode
  Future<DeliveryModeModel> getDeliveryMode ({required String token}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get(
        baseUrl+'customer/customer_delivery_mode',
        options: options,
      );
      print('REP : ${response.data}');
      if (response.statusCode == 200) {
        var result = DeliveryModeModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get delivery date
  Future<DeliveryDateModel> getDeliveryDate ({required String token, required String deliveryMode}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "delivery_mode": deliveryMode
      };
      var response = await dio.post(baseUrl+'customer/customer_delivery_date',
          data: body,
          options: options
      );
      print('Date $body');
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = DeliveryDateModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      print('ERRRRR ${e.toString()}');
      throw Exception(e.toString());
    }
  }

  // get delivery time
  Future<DeliveryTimeModel> getDeliveryTime({required String token, required String deliveryDate}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "date": deliveryDate
      };
      var response = await dio.post(baseUrl+'customer/customer_delivery_time_api',
          data: body,
          options: options
      );
      print('Time $body');
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = DeliveryTimeModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      print('errrrrrrr');
      throw Exception(e.toString());
    }
  }

  // get contactless order
  Future<NewOrderContactlessModel> getContactlessOrder({
    required String token,
    required int id,
    required String pickupDate,
    required String pickupTime,
    required String orderType,
    required String pickupMode,
    }) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "id": id,
        "pickup_date" : pickupDate,
        "pickup_time" : pickupTime,
        "order_type" : orderType,
        "Pickup_mode": pickupMode == "0" ? "Direct" : "Staff Pick"
      };
      print('New Order Button ${body}');
      var response = await dio.post('${baseUrl}customer/customer_add_new_order_api',
          data: body,
          options: options
      );
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = NewOrderContactlessModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get services
  Future<ServicesModel> getServices({required String token, required int? id}) async {
    Options options = Options( receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "id": id
      };
      var response = await dio.post(baseUrl+'customer/new_order_branch_categories_api',
          data: body,
          options: options
      );
      print('Category $body');
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = ServicesModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      print('errrrrrrr');
      throw Exception(e.toString());
    }
  }

  // get sub services
  Future<SubServicesModel> getSubServices({required String token, required String? categoriesID}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "category_id": categoriesID
      };
      var response = await dio.post(baseUrl+'customer/new_order_branch_sub_categories_api',
          data: body,
          options: options
      );
      print('SubCategory $body');
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = SubServicesModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      print('errrrrrrr');
      throw Exception(e.toString());
    }
  }

  // get order items
  Future<OrderItemsModel> getOrderItems({
    required String token,
    required int? id,
    required String catergoryId,
    required String subCategoryId,
    required String orderId,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "id": id,
        "category_id" : catergoryId,
        "sub_cat_id": subCategoryId,
        "order_id": orderId,
      };
      var response = await dio.post('${baseUrl}customer/new_order_item_details_api',
          data: body,
          options: options
      );
      print('Items $body');
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = OrderItemsModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get items incre decre
  Future<ItemsIncreDecreModel> getItemsIncreDecre({
    required String token,
    required String? orderId,
    required String priceListId,
    required String itemServiceId,
    required String quantity,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId,
        "price_list_id" : priceListId,
        "item_ser_id": itemServiceId,
        "quantity": quantity,
      };
      var response = await dio.post('${baseUrl}customer/customer_cart_number',
          data: body,
          options: options
      );
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = ItemsIncreDecreModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get item add to cart
  Future<ItemAddtoCartModel> getItemAddCart({
    required String token,
    required String? orderId,
    required String priceListId,
    required String itemServiceId,
    required String quantity,
    required String amount
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId,
        "price_list_id" : priceListId,
        "item_ser_id": itemServiceId,
        "quantity": quantity,
        "amount": amount
      };
      var response = await dio.post('${baseUrl}customer/customer_add_cart_api',
          data: body,
          options: options
      );
      print('eeeeeeeeeeee ${response.data}');
      if (response.statusCode == 200 ) {
        var result = ItemAddtoCartModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get cart count
  Future<CartCountModel> getCartCount({
    required String token,
    required String? orderId,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId,
      };
      var response = await dio.post('${baseUrl}customer/cart_count_api',
          data: body,
          options: options
      );
      print('ccccccccccccc ${response.data}');
      if (response.statusCode == 200 ) {
        var result = CartCountModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get cart list
  Future<CartListModel> getCartList({
    required String token,
    required String? orderId,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId,
      };
      var response = await dio.post('${baseUrl}customer/cart_list_api', data: body, options: options);
      print('Cart List ${response.data}');
      if (response.statusCode == 200 ) {
        var result = CartListModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get cart items incre decre
  Future<CartItemsIncDecModel> getCartItemsIncreDecre({
    required String token,
    required String? orderId,
    required String? cartId,
    required String priceListId,
    required String itemServiceId,
    required String quantity,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId,
        "cart_id": cartId,
        "price_list_id" : priceListId,
        "item_ser_id": itemServiceId,
        "quantity": quantity,
      };
      var response = await dio.post('${baseUrl}customer/customer_cartin_number',
          data: body,
          options: options
      );
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = CartItemsIncDecModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get cart deletion
  Future<CartDeletionModel> getDeletionData({
    required String token,
    required String? cartId,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "cart_id": cartId,
      };
      var response = await dio.post('${baseUrl}customer/cart_deletion_api',
          data: body,
          options: options
      );
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = CartDeletionModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get thank you
  Future<ThankYouModel> getThankYouData({
    required String token,
    required String? orderId,
    required String? customerId,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId,
        "customer_id": customerId
      };
      print('bb $body');
      var response = await dio.post('${baseUrl}customer/customer_thankyou_api',
          data: body,
          options: options
      );
      print('Thank You ${response.data}');
      if (response.statusCode == 200 ) {
        var result = ThankYouModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get delivery address
  Future<GetDeliveryAddressModel> getDelvieryAddrData({required String token, required String customerId}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get(
          '${baseUrl}customer/get_customer_addrs_api/${customerId}',
          options: options
      );
      print('link ${baseUrl} ${customerId}');
      print('ressss ${response.data}');
      if (response.statusCode == 200 ) {
        var result = GetDeliveryAddressModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get place order
  Future<PlaceOrderModel> getPlaceOrderData({
    required String token,
    required int id,
    required String orderId,
    required int discount,
    required int netTaxable,
    required int vat,
    required int grandTotal,
    required String collectMode,
    required int payedAmount,
    required String customerAddress,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    print(',,,,,,,,,,,,,,,');
    try {
      var body = {
        "id": id,
        "order_id": orderId,
        "discount": discount,
        "net_taxable": netTaxable,
        "vat": vat,
        "grant_total": grandTotal,
        "collect_mode": collectMode,
        "payed_amount": payedAmount,
        "customer_address": customerAddress
      };
      var response = await dio.post('${baseUrl}customer/new_order_payment_api',
          data: body,
          options: options
      );
      print('body $body');
      print('place orderrrrrr ${response.data}');
      if (response.statusCode == 200 ) {
        var result = PlaceOrderModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get cart payment list
  Future<CartPaymentListModel> getCartPaymentListData({required String token}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get(
          '${baseUrl}customer/list_of_payment_api',
          options: options
      );
      print('ressss ${response.data}');
      if (response.statusCode == 200 ) {
        var result = CartPaymentListModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get cart wallet
  Future<CartWalletModel> getCartWalletData({
    required String token,
    required String? customerId,
    required String? orderId
    }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "customer_id": customerId,
        "order_id": orderId
      };
      print('vsdv $body');
      var response = await dio.post('${baseUrl}customer/get_wallet_balance',
          data: body,
          options: options
      );
      print('wallllll ${response.data}');
      if (response.statusCode == 200 ) {
        var result = CartWalletModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get order status list
  Future<OrderStatusModel> getOrderStatusData({
    required String token,
    required String? id,
    required String? fromDate,
    required String? toDate
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "id": id,
        "from_date": fromDate,
        "to_date": toDate
      };
      var response = await dio.post('${baseUrl}customer/order_history_status_customer_api',
          data: body,
          options: options
      );
      print('order status list ${response.data}');
      if (response.statusCode == 200 ) {
        var result = OrderStatusModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get order status feedback
  Future<OrderStatusFeedBackModel> getOrderStatusFBData({
    required String token,
    required String? orderId,
    required String? review,
    required String? feedback
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId,
        "review": review,
        "feedback": feedback
      };
      var response = await dio.post('${baseUrl}customer/order_feedback_api',
          data: body,
          options: options
      );
      print('order status feedback ${response.data}');
      if (response.statusCode == 200 ) {
        var result = OrderStatusFeedBackModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get order details
  Future<OrderDetailsModel> getOrderDetailsData({required String token, required String? orderId}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    try {
      var body = {"order_id": orderId};
      print('details $body');
      var response = await dio.post('${baseUrl}customer/order_detail_api', data: body, options: options);
      print('order details ${response.data}');
      if (response.statusCode == 200 ) {
        print('orderrrr 1111');
        var result = OrderDetailsModel.fromJson(response.data);
        return result;
      } else {
        print('orderrrr 2222');
        return jsonDecode(response.data);
      }
    } catch (e) {
      print('orderrrr 3333');
      throw Exception(e.toString());
    }
  }

  // get wallet transaction
  Future<WalletTransactionModel> getWalletTransactionData({
    required String token,
    required int id,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "id": id
      };
      print('details $body');
      var response = await dio.post('${baseUrl}customer/transaction_list_api',
          data: body,
          options: options
      );
      print('Wallet Transaction ${response.data}');
      if (response.statusCode == 200 ) {
        var result = WalletTransactionModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get recharge wallet
  Future<RechargeWalletModel> getWalletRechargeData({
    required String token,
    required String id,
    required String amount,
    required String paymentMode
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "id": id,
        "amount": amount,
        "mode_of_payment": "Cash"
      };
      print('details $body');
      var response = await dio.post('${baseUrl}customer/wallet_recharge_customer',
          data: body,
          options: options
      );
      print('Wallet Recharge ${response.data}');
      if (response.statusCode == 200 ) {
        var result = RechargeWalletModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get transaction history
  Future<TransactionHistoryModel> getTransactionData({
    required String token,
    required String? fromDate,
    required String? toDate
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "from_date": fromDate,
        "to_date": toDate
      };
      print('details $body');
      var response = await dio.post('${baseUrl}customer/transaction_history',
          data: body,
          options: options
      );
      print('Transaction History ${response.data}');
      if (response.statusCode == 200 ) {
        var result = TransactionHistoryModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get outstanding
  Future<OutstandingModel> getOutstandingData({required String token}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    try {
      var response = await dio.get('${baseUrl}customer/outstanding_list', options: options);
      debugPrint('## Outstanding List ## $response');
      if (response.statusCode == 200 ) {
        var result = OutstandingModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get outstanding pay
  // Future<OutstandingPayModel> getOutstandingPayData({
  //   required String token,
  //   required String? outstandingId,
  //   required String? amountPaid
  // }) async {
  //   Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
  //       headers: {
  //         'Authorization': 'Basic $token'
  //       });
  //   Future.delayed(Duration(seconds: 1));
  //   try {
  //     var body = {
  //       "outstanding_id": outstandingId,
  //       "amount_paid": amountPaid
  //     };
  //     print('details $body');
  //     var response = await dio.post('${baseUrl}customer/pay_outstanding',
  //         data: body,
  //         options: options
  //     );
  //     print('Outstanding Pay ${response.data}');
  //     if (response.statusCode == 200 ) {
  //       var result = OutstandingPayModel.fromJson(response.data);
  //       print(result);
  //       return result;
  //     } else {
  //       return jsonDecode(response.data);
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

  // get complaint list
  Future<ComplaintListModel> getComplaintListData({
    required String token,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {};
      var response = await dio.post('${baseUrl}customer/my_complaint_list_api',
          data: body,
          options: options
      );
      print('Complaint List ${response.data}');
      if (response.statusCode == 200 ) {
        var result = ComplaintListModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get add complaint
  Future<AddComplaintModel> getAddComplaintData({
    required String token,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {};
      var response = await dio.post('${baseUrl}customer/add_your_complaint',
          data: body,
          options: options
      );
      print('Add Complaint ${response.data}');
      if (response.statusCode == 200 ) {
        var result = AddComplaintModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get register complaint
  Future<RegisterComplaintListModel> getRegisterComplaintData({
    required String token,
    required String orderId,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId
      };
      var response = await dio.post('${baseUrl}customer/register_your_complaint_api',
          data: body,
          options: options
      );
      print('bodyyy $body');
      print('Register Complaint List ${response.data}');
      if (response.statusCode == 200 ) {
        var result = RegisterComplaintListModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get register complaint button
  Future<RegisterComplaintButtonModel> getRegisterButtonData({
    required String token,
    required String order,
    required String complaintType,
    required String service,
    required String customer,
    required String remarks,
    required File photo,
    required File uploadPhoto
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = FormData.fromMap({
        "order": order,
        "complaint_type": complaintType,
        "service": service,
        "customer": customer,
        "remarks": remarks,
        "photo": await MultipartFile.fromFile(photo.path),
        "upload_photo": await MultipartFile.fromFile(uploadPhoto.path),
      });
      var response = await dio.post('${baseUrl}customer/register_now_api',
          data: body,
          options: options
      );
      print('Register Complaint Button ${response.data}');
      if (response.statusCode == 200 ) {
        var result = RegisterComplaintButtonModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // get complaint details
  Future<ComplaintDetailsModel> getComplaintDetailsData({
    required String token,
    required String complaintId,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "complaint_id": complaintId
      };
      var response = await dio.post('${baseUrl}customer/complaint_details_api',
          data: body,
          options: options
      );
      print('Complaint Details ${response.data}');
      if (response.statusCode == 200 ) {
        var result = ComplaintDetailsModel.fromJson(response.data);
        print(result);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // My Addresses
  Future<MyAddressesListModel> getMyAddressesData({required String token}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}customer/customer_address_api', options: options);
      if (response.statusCode == 200 ) {
        var result = MyAddressesListModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Add Address
  Future<AddAddressModel> getAddAddressData({
    required String token,
    required String emirate,
    required String area,
    required String location,
    required String buildingNameNo,
    required String floorNo,
    required String flatNoHouseNo,
    required String personInchargeMob,
    required String name,
    required String gpse,
    required String gpsn,
    required String whatsAppNum}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "emirate": emirate,
        "area": area,
        "location": location,
        "building_name_no": buildingNameNo,
        "floor_no": floorNo,
        "flat_no_house_no": flatNoHouseNo,
        "person_incharge_mob": personInchargeMob,
        "name": name,
        "GPSE": gpse,
        "GPSN": gpsn,
        "whatsapp_num": whatsAppNum
      };
      var response = await dio.post('${baseUrl}customer/customer_address_api', data: body, options: options);
      print('Address body $body');
      print('Add Address ${response.data}');
      if (response.statusCode == 200 ) {
        var result = AddAddressModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Edit Profile Data
  Future<EditProfileGetModel> getEditProfileData({required String token}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}customer/edit_profile_get_api', options: options);
      if (response.statusCode == 200) {
        var result = EditProfileGetModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Editing Profile Save
  Future<EditProfileModel> getEditedProfileData({
    required String token,
    required String gpse,
    required String gpsn,
    required String location,
    required String name,
    required String mobile,
    required String whatsApp,
    required String buildingNo,
    required String buildingName,
    required String floorNumber,
    required String flatNumber,
  }) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "GPSE": gpse,
        "GPSN": gpsn,
        "Location": location,
        "name": name,
        "mobile": mobile,
        "whats_app": whatsApp,
        "building_no": buildingNo,
        "building_name": buildingName,
        "floor_number": floorNumber,
        "flat_number": flatNumber,
      };
      var response = await dio.post('${baseUrl}customer/edit_profile_api', data: body, options: options
      );
      print('Edit Profile ${response.data}');
      if (response.statusCode == 200 ) {
        var result = EditProfileModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pay Now Outstanding Get
  Future<PayNowOutstandingGetModel> getPayNowOutstandingData({required String token}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    try {
      var response = await dio.get('${baseUrl}customer/outstanding_pay', options: options);
      if (response.statusCode == 200) {
        var result = PayNowOutstandingGetModel.fromJson(response.data);
        print('Pay Now ${response.data}');
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pay Outstanding
  Future<PayOutstandingModel> getPayOutstandingData({
    required String token,
    required String paymentMtd,
    required String amtPayable}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    try {
      var body = {
        "payment_method": paymentMtd,
        "amount_payable": amtPayable
      };
      var response = await dio.post('${baseUrl}customer/outstanding_pay', data: body, options: options);
      print('Boddyyyyyy ${body}');
      print('Pay Outstanding ${response.data}');
      if (response.statusCode == 200 ) {
        var result = PayOutstandingModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Outstanding Proceed
  Future<OutstandingProceedIndividual> getOutstandingProceedIndivData({required String token,
    required String orderNum, required String amountPayable, required String paymentMtd}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    try {
      var body = {
        "order_num": orderNum,
        "amount_payable": amountPayable,
        "payment_method": paymentMtd
      };
      print('Boddyyyyyy ${body}');
      var response = await dio.post('${baseUrl}customer/individual_proceed_api', data: body, options: options);
      print('Outstanding Proceed Indiv ${response.data}');
      if (response.statusCode == 200 ) {
        var result = OutstandingProceedIndividual.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Outstanding Proceed
  Future<OutstandingProceedComModel> getOutstandingProceedComData({required String token,
    required String netPayable, required String amountPayable, required String paymentMtd}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    try {
      var body = {
        "net_payble": netPayable,
        "amount_payable": amountPayable,
        "payment_method": paymentMtd
      };
      var response = await dio.post('${baseUrl}customer/proceed_api', data: body, options: options);
      print('Boddyyyyyy ${body}');
      print('Outstanding Proceed Com ${response.data}');
      if (response.statusCode == 200 ) {
        var result = OutstandingProceedComModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Call Support
  Future<CallSupportModel> getCallSupportData({required String token}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}customer/contact_us', options: options);
      if (response.statusCode == 200) {
        var result = CallSupportModel.fromJson(response.data);
        print('Call Support ${response.data}');
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Our Branches
  Future<OurBranchesModel> getBranchesData({required String token}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}customer/our_branches', options: options);
      if (response.statusCode == 200) {
        var result = OurBranchesModel.fromJson(response.data);
        print('Our Branches ${response.data}');
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pricing
  Future<PricingModel> getPricingData({required String token}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}customer/price/list', options: options);
      if (response.statusCode == 200) {
        var result = PricingModel.fromJson(response.data);
        print('Pricing ${response.data}');
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Email Support
  Future<EmailSupportModel> getEmailSupportData({required String token, required String name,
    required String email, required String phone, required String message}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "name": name,
        "email": email,
        "phone": phone,
        "message": message
      };
      print ('bbbb ${body}');
      var response = await dio.post('${baseUrl}customer/contact_us', data: body, options: options);
      print('Email Support ${response.data}');
      if (response.statusCode == 200 ) {
        var result = EmailSupportModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Sidebar Feedback
  Future<SideBarFeedbackModel> getSideBarFBData({required String token,
    required String review, required String feedback}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "review": review,
        "feedback": feedback,
      };
      var response = await dio.post('${baseUrl}customer/order_feedback_cust', data: body, options: options);
      print('Boddyyyyyy ${body}');
      print('SideBar FeedBack ${response.data}');
      if (response.statusCode == 200 ) {
        var result = SideBarFeedbackModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Notification List
  Future<NotificationModel> getNotificationData({required String token}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    try {
      var response = await dio.get('${baseUrl}customer/get_notification', options: options);
      if (response.statusCode == 200) {
        var result = NotificationModel.fromJson(response.data);
        print('Notification List ${response.data}');
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Notification Delete
  Future<NotiDeleteModel> getNotiDeleteData({required String token, required String notificationId}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    try {
      var body = {
        "noticication_id": notificationId,
      };
      var response = await dio.post('${baseUrl}customer/get_notification', data: body, options: options);
      print('Boddyyyyyy ${body}');
      print('Notification Delete ${response.data}');
      if (response.statusCode == 200 ) {
        var result = NotiDeleteModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Notification Delete
  Future<ServicePriceListModel> getServicePriceData({required String token, required String categoryId}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    try {
      var body = {
        "category_id": categoryId,
      };
      var response = await dio.post('${baseUrl}customer/service_price_list', data: body, options: options);
      debugPrint('Service Price ${response.data}');
      if (response.statusCode == 200 ) {
        var result = ServicePriceListModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}
