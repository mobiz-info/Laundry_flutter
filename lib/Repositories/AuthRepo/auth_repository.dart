import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:golden_falcon/Utils/common.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/AuthModel/auth_model.dart';
import '../../Models/CustomerModel/device_token_model.dart';

final authData = AuthData();
class AuthRepository {

  Future<AuthModel> loginUser({required String username, required String password, required String deviceToken}) async {
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(Uri.parse(baseUrl+'accounts/login_api'),
        body: {
            "username": username.trim(),
            "password": password.trim(),
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var result = AuthModel.fromJson(jsonDecode(response.body));
        authData.setData(result.data.tokEn, result.data.userType, result.data.id, result.data.username);
        await prefs.setString('userId', result.data.id.toString());
        await prefs.setString('userToken', result.data.tokEn.toString());
        await prefs.setString('userType', result.data.userType.toString());
        await getDeviceTokenData(deviceToken: deviceToken, userId: authData.user_id.toString());
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DeviceTokenModel> getDeviceTokenData({required String deviceToken, required String userId}) async {
    await Future.delayed(Duration(seconds: 1));
    try {
      var response = await http.post(Uri.parse(baseUrl+'accounts/send_device_token'),
          body: {
          "device_token": deviceToken,
          "user_id": userId,
          },
      );
      print('Device Token ${response.body}');
      if (response.statusCode == 200 ) {
        var jsonResponse = jsonDecode(response.body);
        var result = DeviceTokenModel.fromJson(jsonResponse);
        return result;
      } else {
        return jsonDecode(response.body);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

}