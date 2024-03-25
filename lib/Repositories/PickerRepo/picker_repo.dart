import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:golden_falcon/Models/PickerModel/collection_list_model.dart';
import 'package:golden_falcon/Models/PickerModel/punch_in_out_model.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Utils/common.dart';
import 'package:dio/dio.dart';

import '../../Models/PickerModel/add_customer_model.dart';
import '../../Models/PickerModel/add_to_cart_model.dart';
import '../../Models/PickerModel/customer_list_model.dart';
import '../../Models/PickerModel/dashboard_count_model.dart';
import '../../Models/PickerModel/deposit_history_model.dart';
import '../../Models/PickerModel/deposit_model.dart';
import '../../Models/PickerModel/expense_add_model.dart';
import '../../Models/PickerModel/expense_drop_down_model.dart';
import '../../Models/PickerModel/expense_list_model.dart';
import '../../Models/PickerModel/location_price_model.dart';
import '../../Models/PickerModel/new_order_save.dart';
import '../../Models/PickerModel/order_details_model.dart';
import '../../Models/PickerModel/order_history_model.dart';
import '../../Models/PickerModel/outstanding_model.dart';
import '../../Models/PickerModel/picker_category_model.dart';
import '../../Models/PickerModel/picker_item_price_model.dart';
import '../../Models/PickerModel/picker_order_confirm.dart';
import '../../Models/PickerModel/picker_sub_category_model.dart';
import '../../Models/PickerModel/pickup_list_midel.dart';

class PickerRepository {
  // Dashboard counts
  Future<DashboardCountModel> getDashboardData({required String token, required String id}) async {
    print("Entr");
    Map<String, String> headers = {
      'Authorization': 'Basic $token',
    };
    print(headers);
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(
          Uri.parse(baseUrl+'picker/picker_dashboard_api'),
        headers: headers,
        body: {
            "id": id
        }
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = DashboardCountModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
  // Deposit Adding
  Future<DepositModel> addDeposit({required String token, required String userId, required String amount}) async {
    Dio dio = Dio();
    // Map<String, String> headers = {
    //   'Authorization': 'Basic $token',
    // };
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token',
      }
    );
    Map<String, String> data = {
      'id': userId,
      'total_amount': amount,
    };

    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/deposit_add_api',
        data: data,
        options: options
      );
      var result = jsonEncode(response.data);
      print(result);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var final_data = DepositModel.fromRawJson(result);
        return final_data;
      } else {
        print('repo else');
        return jsonDecode(response.data);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
  // Get Expense Head
  Future<ExpenseDropDownModel> getExpenseHead({required String token}) async {
    Map<String, String> headers = {
      'Authorization': 'Basic $token',
    };
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.get(Uri.parse(baseUrl+'picker/expense_add_api'), headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ExpenseDropDownModel.fromJson(jsonDecode(response.body));
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Add Expense
  Future<ExpenseAddModel> addExpense(Map<String, String> body, String token) async {
    Dio dio = Dio();
    Options options = Options(
        headers: {
          'Authorization': 'Basic $token',
        }
    );
    Map<String, String> data = body;
    print(data);
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/expense_add_api',
        options: options,
        data: data
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ExpenseAddModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }

  }

  // List Expense
  Future<ExpenseListModel> getExpenses({required String id, required String token}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Map<String, String> data = {
      'id': id
    };
    
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/expense_list_api',
        data: data,
        options: options
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ExpenseListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Outstanding Dues
  Future<PickerOutstandingDueModel> getOutstandings({required String id, required String token}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "id" : id
    };

    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/outstanding_dues_api',
        data: data,
        options: options
      );

      if ( response.statusCode == 200 || response.statusCode == 201 ) {
        var result = PickerOutstandingDueModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch(e) {
      throw Exception(e.toString());
    }
  }

  // Deposit History
  Future<PickerDepositHistoryModel> getHistory({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/deposit_history_api',
        data: body,
        options: options
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerDepositHistoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Order History
  Future<PickerOrderHistoryModel> getOrderList({required String token, required Map<String, String> data}) async {
    print(data);
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/order_history_list_api',
        options: options,
        data: data
      );
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerOrderHistoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Order Details
  Future<PickerOrderDetailsModel> getOrderDetails({required String orderNo, required String token}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Map<String, String> data = {
      "order_number": orderNo
    };
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/customer_order_details_api',
        data: data,
        options: options
      );
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerOrderDetailsModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Collection List
  Future<PickerCollectionListModel> getCollectionList({required token, required Map<String, String> data}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/collection_details_api',
        data: data,
        options: options
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCollectionListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Pickup List
  Future<PickerPickupListModel> getPickUps({required String token, required String id}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "id":id
    };
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
       baseUrl+'picker/pickup_list_api',
        data: data,
        options: options
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerPickupListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Order Confirm
  Future<PickerOrderConfirmModel> confirmOrder({required Map<String, String> body, required String token}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/picker_confirm_new_order_api',
        data: body,
        options: options
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerOrderConfirmModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Punch In / Out
  Future<PickerPunchInOutModel> punchIn({required String token, required String id, required String task}) async {
    Dio dio = Dio();
    String url = '';
    if (task == "punch_in") {
      url = 'picker/picker_punch_in_api';
    } else if (task == "punch_out"){
      url = 'picker/picker_punch_out_api';
    }
    print(url);
    Future.delayed(Duration(seconds: 1));
    Map<String, String> data = {
      "userid": id
    };

    Map<String, String> out_data = {
      "id": id
    };

    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    try {
      var response = await dio.post(
        baseUrl+url,
        data: task == "punch_in" ? data : out_data,
        options: options
      );
      print(response.data);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerPunchInOutModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Location Price Group GET
  Future<LocationPriceGroupModel> getLPGData({required String token}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.get(
        baseUrl+'picker/picker_add_customer_api',
        options: options
      );
      print(response);
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = LocationPriceGroupModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Add Customer
  Future<AddCustomerModel> addNewClient({required Map<String, String> body, required String token}) async {
    Dio dio = Dio();
    Map<String, String> data = body;
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/picker_add_customer_api',
        data: data,
        options: options
      );
      print("=============[CLIENT]===============");
      print(response.data);
      print("============================");
      if (response.statusCode ==200 || response.statusCode == 201) {
        var result = AddCustomerModel.fromJson(response.data);
        authData.setResponse(jsonDecode(response.data)['message']);
        return result;
      } else {
        authData.setResponse(jsonDecode(response.data)['message']);
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // List Customer
  Future<PickerCustomerListModel> listMyClients({required String token, required String id}) async {
    Dio dio = Dio();
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
        baseUrl+'picker/customer_list_api',
        data: data,
        options: options
      );
    print("**************************");
    print(response.data);
    print("**************************");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCustomerListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Save New Order
  Future<PickerNewOrderSaveModel> saveNewOrder({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/picker_add_new_order_api',
        data: body,
        options: options,
      );

      print("***************************");
      print(response.data);
      print("***************************");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerNewOrderSaveModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Get Categories
  Future<PickerCategoryModel> getPickerCategs({required String id, required String token}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "id" : id
    };
    Options options = Options(
      headers: {
        'Authorization' : 'Basic ${token}'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/new_order_branch_categories_api',
        data: data,
        options: options
      );

      print("*******************[RESP]*************************");
      print(response.data);
      print("*******************[RESP]*************************");

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerCategoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Get Sub Categ
  Future<PickerSubCategoryModel> getPickerSubCategs({required String categ_id, required String token}) async {
    Dio dio = Dio();
    Map<String, String> data = {
      "category_id" : categ_id
    };

    Options options = Options(
      headers: {
        'Authorization' : 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        baseUrl+'picker/new_order_branch_sub_categories_api',
        options: options,
        data: data
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerSubCategoryModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //Get Item
  Future<PickerItemsPriceModel> getItemsPrice({required Map<String, String> body, required String token }) async {
    Dio dio = Dio();
    print(body);
    Options options = Options(
      headers: {
        'Authorization' : 'Basic $token'
      }
    );

    Future.delayed(Duration(seconds: 1));

    try {
      var response = await dio.post(
        baseUrl+'picker/new_order_item_details_api',
        data: body,
        options: options
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerItemsPriceModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Add to Cart
  Future<PickerAddtoCartModel> addToCart({required String token, required Map<String, String> body}) async {
    Dio dio = Dio();
    Future.delayed(Duration(seconds: 1));
    Options options = Options(
      headers:  {
        'Authorization' : 'Basic $token'
      }
    );
    try {
      var response = await dio.post(
        baseUrl+'picker/picker_add_cart_api',
        data: body,
        options: options
      );

      print('ADD to CRT : $response.data');
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = PickerAddtoCartModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

