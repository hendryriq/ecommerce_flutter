import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:pesantren_ecommerce/response/res_login.dart';
import 'package:pesantren_ecommerce/network/api.dart';

class RepoAuth {
  Future<ResLogin?> loginUser(String email, String password) async {
    // Map<String, dynamic> data = {};
    // data["email"] = email;
    // data["password"] = password;
    try {
      print({"email": email, "password": password});
      var hearders = {'Content-Type': 'application/x-www-form-urlencoded'};
      Response res = await Api().dio.post("${Api.baseUrl}loginCustomer",
          data: {"email": email, "password": password},
          options: Options(
            headers: hearders,
          ));
      if (kDebugMode) {
        print("try ${res.data}");
      }
      return resLoginFromJson(res.data);
    } catch (e, st) {
      if (kDebugMode) {
        print("Error e ${e.toString()}");
        print("Error st ${st.toString()}");
      }
    }
  }
}
