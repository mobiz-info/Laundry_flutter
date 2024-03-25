import 'dart:convert';

import 'package:http/http.dart' as http;
// String baseUrl = "http://68.183.94.11:90/";
// String baseUrl = "http://bijoy.pythonanywhere.com/";
String baseUrl = "http://68.183.94.11:772/";

class AuthData {
  static final AuthData _instance = AuthData._internal();

  factory AuthData() {
    return _instance;
  }

  AuthData._internal();

  String? user_token;
  String? user_type;
  String? response;
  String? username;
  int? user_id;
  int callCount = 0;

  String pck_cat_id = "";
  String pck_sub_cat_id = "";
  String pck_ord_id = "";
  String pck_ord_cstmr_id = "";

  void setData(String token, String userType, int userId, user_name) {
    user_token = token;
    user_type = userType;
    user_id = userId;
    username = user_name;
  }

  void setCatId(cat_id) {
    pck_cat_id = cat_id ?? "";
  }

  void setOrdCstmrId(ord_id, cstm_id) {
    pck_ord_id = ord_id ?? "";
    pck_ord_cstmr_id = cstm_id ?? "";
  }

  void setSubCatId(sub_cat_id) {
    pck_sub_cat_id = sub_cat_id ?? "";
  }

  void clearData() {
    user_token = null;
    user_type = null;
    user_id = null;
    username = null;
  }

  void setResponse(value) {
    response = value;
  }

  void clearResponse() {
    response = null;
  }

  void logout() async {
    var resp = await http.get(Uri.parse(baseUrl+'accounts/logout_api'));
    response = jsonDecode(resp.body)['message'];
  }

  void resetCount() {
    if (callCount != 0) {
      callCount = 0;
    }
  }


}

