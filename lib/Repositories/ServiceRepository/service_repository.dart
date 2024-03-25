import 'package:dio/dio.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceDashboard/serviceDashboardCountModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceDispatchedOrder/serviceDispatchedOrderDetail.dart';
import 'package:golden_falcon/Models/ServiceModel/ServiceInProcessOrder/serviceInProcessOrderListModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServicePendingOrder/servicePendingOrderDetailsModel.dart';
import 'package:golden_falcon/Models/ServiceModel/ServicePendingOrder/servicePendingOrderListModel.dart';
import 'package:golden_falcon/Models/ServiceModel/complaint_list_model.dart';
import 'package:golden_falcon/Repositories/AuthRepo/auth_repository.dart';
import 'package:golden_falcon/Utils/common.dart';

import '../../Models/ServiceModel/ServiceDispatchedOrder/serviceDispatchedOrderListModel.dart';
import '../../Models/ServiceModel/ServiceInProcessOrder/serviceInProcessOrderDetailsModel.dart';

class ServiceRepository {
  Dio dio = Dio();


  // Service Dashboard Count
  Future<ServiceDashboardCountModel> getServiceDashboardCounts({required String token, required String userId}) async {
    try {
      var response = await dio.post(
        '${baseUrl}service/service_dashboard_api',
        data: {
          "id" : userId,
        },//idWithBody,
        options: Options(
          headers: {
            'Authorization': 'Basic $token'
          }
        )
      );
      print("RESPONSE : ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ServiceDashboardCountModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Service Pending List
  Future<ServicePendingOrderListModel> getServicePendingOrderList({required String token, required String userId}) async {
    try {
      var response = await dio.post(
        options: Options(
          headers: {
            'Authorization' : 'Basic $token'
          }
        ),
        data: {
          'id': userId
        },
        '${baseUrl}service/pending_order_list_api',
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ServicePendingOrderListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Service Pending Order Details
  Future<ServicePendingOrderDetailsModel> getPendingOrderDetail({required String orderId, required String userId, required String token}) async {
    Map<String, String> body = {
      "id" : userId,
      "order_id" : orderId
    };

    try {
      var response = await dio.post(
        data: body,
        options: Options(
          headers: {
            'Authorization' : 'Basic $token'
          }
        ),
        '${baseUrl}service/order_details_api'
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ServicePendingOrderDetailsModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Service DispatchedOrderList
  Future<ServiceDispatchedOrderListModel> getDispatchedOrderList({required String token, required String userId}) async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        '${baseUrl}service/dispatched_order_list_api',
        data: {
          'id': userId
        },
        options: Options(
          headers: {
            'Authorization': 'Basic $token'
          }
        )
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ServiceDispatchedOrderListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Service DispatchedOrderDetails
  Future<ServiceDispatchedOrderDetailsModel> getDispatchedOrderDetails({required String token, required String userId, required String orderId}) async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        '${baseUrl}service/order_details_api',
        data:  {
          'id':userId,
          'order_id': orderId
        },

        options: Options(
          headers: {
            'Authorization': 'Basic $token'
          }
        )
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ServiceDispatchedOrderDetailsModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Service In Process Order List
  Future<ServiceInProcessOrderListModel> getInProcessOrderList({required String token, required String userId}) async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        '${baseUrl}service/inprogress_order_list_api',
        data: {
          'id':userId
        },
        options: Options(
          headers: {
            'Authorization': 'Basic $token'
          }
        )
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ServiceInProcessOrderListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Service In Process Order Data
  Future<ServiceInProcessOrderDetailsModel> getInProcessOrderDetails({required String token, required Map<String, String> body}) async {
    Future.delayed(Duration(seconds: 1));
    try {
      var response = await dio.post(
        '${baseUrl}service/order_details_api',
        data: body,
        options: Options(
          headers: {
            'Authorization': 'Basic $token'
          }
        )
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ServiceInProcessOrderDetailsModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  // Complaint List
  Future<ServiceComplaintListModel> getComplaintList({required String id, required String token}) async {
    Future.delayed(Duration(seconds: 1));
    Map<String, String> data = {
      "id": id
    };
    Options options = Options(
      headers: {
        'Authorization': 'Basic $token'
      }
    );
    try {
      var response = await dio.post(
        baseUrl+'service/complaint_list_api',
        data: data,
        options: options
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        var result = ServiceComplaintListModel.fromJson(response.data);
        return result;
      } else {
        return response.data;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}