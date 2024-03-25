import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/add_order_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/completed_orders_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/engage_orders_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/engage_search_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/gen_invoice_search_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/generate_invoice_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/new_order_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/order_search_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/pending_orders_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/ready_delivery_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/ready_delivery_search_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/ser_cart_count_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/ser_cart_delete_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/ser_cart_inc_dec_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/ser_cart_list_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/ser_items_inc_dec_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/ser_payment_mtd_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/service_category_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/service_dashboard_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/service_delivery_date_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/service_delivery_mode_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/service_delivery_time_model.dart';
import 'package:golden_falcon/Models/ServiceBranchModel/service_order_status_model.dart';

import '../../Models/ServiceBranchModel/accept_orders_model.dart';
import '../../Models/ServiceBranchModel/accept_search_model.dart';
import '../../Models/ServiceBranchModel/completed_order_search_model.dart';
import '../../Models/ServiceBranchModel/new_order_dash_search_model.dart';
import '../../Models/ServiceBranchModel/pending_search_model.dart';
import '../../Models/ServiceBranchModel/ser_cart_wallet_bal_model.dart';
import '../../Models/ServiceBranchModel/ser_delivery_address_model.dart';
import '../../Models/ServiceBranchModel/ser_items_add_cart_model.dart';
import '../../Models/ServiceBranchModel/ser_place_order_model.dart';
import '../../Models/ServiceBranchModel/ser_thank_you_model.dart';
import '../../Models/ServiceBranchModel/service_items_list_model.dart';
import '../../Models/ServiceBranchModel/service_subcategory_model.dart';
import '../../Utils/common.dart';

class ServiceBranchRepository {
  Dio dio = Dio();

  // DashBoard
  Future<ServiceDashboardModel> getServiceDash ({required String token}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/app/dashboard', options: options);
      debugPrint('## DashBoard ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ServiceDashboardModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Order Status
  Future<ServiceOrderStatusModel> getSerOrderStatusData ({
    required String token,
    required String mobileNum,
    required String orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "mobile_number": mobileNum,
        "order_number": orderNum
      };
      var response = await dio.post('${baseUrl}service/app/order_status', data: body, options: options);
      debugPrint('## Order Status ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ServiceOrderStatusModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Engage Orders
  Future<EngageOrdersModel> getEngageData ({required String token}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/engage', options: options);
      debugPrint('## Engage ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = EngageOrdersModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Generate Invoice
  Future<GenerateInvoiceModel> getInvoiceData ({required String token}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {};
      var response = await dio.post('${baseUrl}service/generate_invoice_page', data: body, options: options);
      debugPrint('## Invoice ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = GenerateInvoiceModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Search Invoice
  Future<GenInvoiceSearchModel> getSearchInvoiceData ({required String token, required String orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "order_number": orderNum
      };
      var response = await dio.post('${baseUrl}service/generate_invoice_page_search', data: body, options: options);
      debugPrint('## Search Invoice ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = GenInvoiceSearchModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Search Ready Delivery
  Future<ReadyDeliverySearchModel> getSearchReadyDeliData ({required String token, required String orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "order_number": orderNum
      };
      debugPrint('## Search Ready body ## : $body');
      var response = await dio.post('${baseUrl}service/ready_for_delivery_search', data: body, options: options);
      debugPrint('## Search Ready Delivery ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ReadyDeliverySearchModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Search Engage
  Future<EngageSearchModel> getSearchEngageData ({required String token, required String orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "order_number": orderNum
      };
      var response = await dio.post('${baseUrl}service/engage_search', data: body, options: options);
      debugPrint('## Search Engage ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = EngageSearchModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Engage Status
  getEngageStatus ({required String token, String? orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/engage', options: options,
          queryParameters: {"order_num": orderNum});
      debugPrint('## Engage Status ## : ${response.data}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pending Orders
  Future<PendingOrdersModel> getPendingOrdersData ({required String token}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/pending_api', options: options);
      debugPrint('## Pending Orders ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = PendingOrdersModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Completed Orders
  Future<CompletedOrdersModel> getCompletedOrdersData ({required String token}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/completed_api', options: options);
      debugPrint('## Completed Orders ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = CompletedOrdersModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pending Status
  getPendingStatus ({required String token, String? orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/pending_api', options: options,
          queryParameters: {"order_num": orderNum});
      debugPrint('## Pending Status ## : ${response.data}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Completed Status
  getCompletedStatus ({required String token, String? orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/completed_api', options: options,
          queryParameters: {"order_num": orderNum});
      debugPrint('## Completed Status ## : ${response.data}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Ready for Delivery
  Future<ReadyDeliveryModel> getReadyDeliveryData ({required String token}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/ready_for_delivery', options: options);
      debugPrint('## Ready Delivery ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ReadyDeliveryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // New Order Search
  Future<NewOrderSearchModel> getOrderSearchData ({required String token, required String mobileNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "mobile_number": mobileNum
      };
      var response = await dio.post('${baseUrl}service/customer_search_api', data: body, options: options);
      debugPrint('## New Order Search ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = NewOrderSearchModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Delivery Mode
  Future<ServiceDeliveryModeModel> getSerDeliveryModeData ({required String token}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/service_delivery_mode_api', options: options);
      debugPrint('## Delivery Mode ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ServiceDeliveryModeModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Delivery Date
  Future<ServiceDeliveryDateModel> getDeliveryDateData ({required String token, required String deliveryMode}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "delivery_mode": deliveryMode
      };
      var response = await dio.post('${baseUrl}service/service_delivery_date_api', data: body, options: options);
      debugPrint('## Delivery Date ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ServiceDeliveryDateModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Delivery Time
  Future<ServiceDeliveryTimeModel> getDeliveryTimeData ({required String token, required String date}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "date": date
      };
      var response = await dio.post('${baseUrl}service/service_delivery_time_api', data: body, options: options);
      debugPrint('## Delivery Time ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ServiceDeliveryTimeModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Add Order
  Future<AddOrderModel> getAddOrderData ({required String token, required String customerId,
  required String orderType, required String deliveryDate, required String deliveryTime}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "customer_id": customerId,
        "order_type": orderType,
        "Delivery_date": deliveryDate,
        "Delivery_time": deliveryTime
      };
      var response = await dio.post('${baseUrl}service/service_add_new_order_api', data: body, options: options);
      debugPrint('## Add Order ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = AddOrderModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Search Pending Orders
  Future<PendingSearchModel> getSearchPendingData ({required String token, required String orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "order_number": orderNum
      };
      var response = await dio.post('${baseUrl}service/pending_search_api', data: body, options: options);
      debugPrint('## Search Pending Orders ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = PendingSearchModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Search Completed Orders
  Future<CompletedOrderSearchModel> getSearchCompletedData ({required String token, required String orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "order_number": orderNum
      };
      var response = await dio.post('${baseUrl}service/completed_search_api', data: body, options: options);
      debugPrint('## Search Completed Orders ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = CompletedOrderSearchModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Category
  Future<ServiceCategoryModel> getCategoryData ({required String token}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/service_new_order_branch_categoires', options: options);
      debugPrint('## Category ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ServiceCategoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Sub Category
  Future<ServiceSubCategoryModel> getSubCategoryData ({required String token, required String categoryId}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "category_id": categoryId
      };
      var response = await dio.post('${baseUrl}service/service_new_order_subcategoires', data: body, options: options);
      debugPrint('## Sub Category ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ServiceSubCategoryModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Accept Orders
  Future<AcceptOrdersModel> getAcceptOrdersData ({required String token}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/accept_orders_api', options: options);
      debugPrint('## Accept Orders ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = AcceptOrdersModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Accept Status
  getAcceptStatus ({required String token, String? orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/accept_orders_api', options: options,
          queryParameters: {"order_num": orderNum});
      debugPrint('## Accept Status ## : ${response.data}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Items List
  Future<ServiceItemsListModel> getItemsData ({required String token, required String categoryId,
  required String subCategoryId, required String customerId, required String orderId}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "category_id": categoryId,
        "sub_cat_id": subCategoryId,
        "customer_id": customerId,
        "order_id": orderId
      };
      var response = await dio.post('${baseUrl}service/service_new_order_itemdetails', data: body, options: options);
      debugPrint('## Items ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = ServiceItemsListModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Service Items Increment Decrement
  Future<SerItemsIncDecModel> getItemsIncDec({required String token, required String? orderId,
    required String priceListId, required String itemServiceId, required String quantity}) async {
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
      var response = await dio.post('${baseUrl}service/service_addmore_quantity', data: body, options: options);
      debugPrint('## Items Inc Dec ## : ${response.data}');
      if (response.statusCode == 200 ) {
        var result = SerItemsIncDecModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Items Add to Cart
  Future<SerItemsAddCartModel> getItemsAddCart({required String token, required String? orderId,
    required String priceListId, required String itemServiceId, required String quantity,
    required String amount}) async {
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
      var response = await dio.post('${baseUrl}service/service_add_cart', data: body, options: options);
      debugPrint('## Items Add Cart ## : ${response.data}');
      if (response.statusCode == 200 ) {
        print('111');
        var result = SerItemsAddCartModel.fromJson(response.data);
        return result;
      } else {
        print('222');
        return jsonDecode(response.data);
      }
    } catch (e) {
      print('333');
      throw Exception(e.toString());
    }
  }

  // Cart List
  Future<SerCartListModel> getCartListData({required String token, required String? orderId}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId,
      };
      var response = await dio.post('${baseUrl}service/service_cart_list_api', data: body, options: options);
      debugPrint('## Cart List ## : ${response.data}');
      if (response.statusCode == 200 ) {
        var result = SerCartListModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Cart Count
  Future<SerCartCountModel> getSerCartCount({required String token, required String? orderId}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "order_id": orderId,
      };
      var response = await dio.post('${baseUrl}service/service_cart_count_api', data: body, options: options);
      if (response.statusCode == 200 ) {
        var result = SerCartCountModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Service Cart Increment Decrement
  Future<SerCartIncDecModel> getCartIncDec({required String token, required String cartId, required String? orderId,
    required String priceListId, required String itemServiceId, required String quantity}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "cart_id": cartId,
        "order_id": orderId,
        "price_list_id" : priceListId,
        "item_ser_id": itemServiceId,
        "quantity": quantity,
      };
      debugPrint('bodyyyyyyy $body');
      var response = await dio.post('${baseUrl}service/service_cartin_addmore_api', data: body, options: options);
      debugPrint('## Cart Inc Dec ## : ${response.data}');
      if (response.statusCode == 200 ) {
        var result = SerCartIncDecModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Cart Delivery address
  Future<SerDeliveryAddressModel> getDeliveryAddressData({required String token, required String customerId}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/ser_get_address_api/${customerId}', options: options);
      debugPrint('## Delivery Address ## : ${response.data}');
      print('1111 $customerId');
      if (response.statusCode == 200 ) {
        print('11111');
        var result = SerDeliveryAddressModel.fromJson(response.data);
        return result;
      } else {
        print('222222');
        return jsonDecode(response.data);
      }
    } catch (e) {
      print('33333');
      throw Exception(e.toString());
    }
  }

  // Payment List
  Future<SerPaymentMtdModel> getPaymentListData({required String token}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/payment_method', options: options);
      debugPrint('## Payment List ## : ${response.data}');
      if (response.statusCode == 200 ) {
        var result = SerPaymentMtdModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Cart Delete
  Future<SerCartDeleteModel> getDeleteData({required String token, required String? cartId}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {"cart_id": cartId};
      var response = await dio.post('${baseUrl}service/service_delete_cart', data: body, options: options);
      debugPrint('## Cart Delete ## : ${response.data}');
      if (response.statusCode == 200 ) {
        var result = SerCartDeleteModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Search Accept Orders
  Future<AcceptSearchModel> getSearchAcceptData ({required String token, required String orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "order_number": orderNum
      };
      var response = await dio.post('${baseUrl}service/accept_orders_search_api', data: body, options: options);
      debugPrint('## Search Accept Orders ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = AcceptSearchModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // New Orders
  Future<NewOrderModel> getNewOrderData({required String token}) async {
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/new_order', options: options);
      debugPrint('## New Order ## : ${response.data}');
      if (response.statusCode == 200 ) {
        var result = NewOrderModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // New Order Status
  getNewOrderStatus ({required String token, String? orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    Future.delayed(const Duration(seconds: 1));
    try {
      var response = await dio.get('${baseUrl}service/new_order', options: options,
          queryParameters: {"order_num": orderNum});
      debugPrint('## New Order Status ## : ${response.data}');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Search New Orders
  Future<NewOrderDashSearchModel> getSearchNewOrderData ({required String token, required String orderNum}) async {
    Options options = Options(
        headers: {'Authorization': 'Basic $token'});
    try {
      var body = {
        "order_number": orderNum
      };
      var response = await dio.post('${baseUrl}service/new_order_search', data: body, options: options);
      debugPrint('## Search New Orders ## : ${response.data}');
      if (response.statusCode == 200) {
        var result = NewOrderDashSearchModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Cart Wallet Balance
  Future<SerCartWalletBalModel> getCartWalletBalData({required String token, required String? customerId,
    required String? orderId}) async {
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
      var response = await dio.post('${baseUrl}customer/get_wallet_balance', data: body, options: options);
      debugPrint('## Cart Wallet Balance ## : ${response.data}');
      if (response.statusCode == 200 ) {
        var result = SerCartWalletBalModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Place Order
  Future<SerPlaceOrderModel> getSerPlaceOrderData({required String token, required String customerId,
    required String orderId, required int discount, required int netTaxable, required int vat,
    required int grandTotal, required String collectMode, required int payedAmount,
    required String customerAddress}) async {
    Options options = Options(receiveTimeout: Duration(minutes: 1),sendTimeout: Duration(minutes: 1),
        headers: {
          'Authorization': 'Basic $token'
        });
    Future.delayed(Duration(seconds: 1));
    try {
      var body = {
        "customer_id": customerId,
        "order_id": orderId,
        "discount": discount,
        "net_taxable": netTaxable,
        "vat": vat,
        "grant_total": grandTotal,
        "collect_mode": collectMode,
        "payed_amount": payedAmount,
        "customer_address": customerAddress
      };
      var response = await dio.post('${baseUrl}service/ser_new_order_payment_api', data: body, options: options);
      print('body $body');
      debugPrint('## Cart Place Order ## : ${response.data}');
      if (response.statusCode == 200 ) {
        var result = SerPlaceOrderModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Thank you
  Future<SerThankYouModel> getThankYouData({required String token, required String? orderId, required String? customerId}) async {
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
      var response = await dio.post('${baseUrl}service/thankyouapi',
          data: body,
          options: options
      );
      print(response.data);
      if (response.statusCode == 200 ) {
        var result = SerThankYouModel.fromJson(response.data);
        return result;
      } else {
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


}