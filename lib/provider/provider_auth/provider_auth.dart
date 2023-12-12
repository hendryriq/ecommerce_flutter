import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pesantren_ecommerce/repository/repo_auth.dart';
import 'package:pesantren_ecommerce/response/res_login.dart';
import 'package:pesantren_ecommerce/ui/home_screen.dart';
import 'package:http/http.dart' as http;
import 'package:pesantren_ecommerce/utils/nav_utils.dart';


class ProviderAuth extends ChangeNotifier{

  ProviderAuth();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isHiden = true;

  void klickHiden(){
    isHiden = !isHiden;
    notifyListeners();
  }

  bool isLogin = false;
  RepoAuth repo = RepoAuth();

  Future<void> login(BuildContext context) async{
    try{
      isLogin = true;
      notifyListeners();

      ResLogin? res = await repo.loginUser(email.text, password.text);

      if (res?.status == 200){
        isLogin = false;
        NavUtils.goAll(context, const HomeScreen());
        notifyListeners();
      }else{
        isLogin = false;
        if(kDebugMode){
          print("${res?.message}");
        }
        notifyListeners();
      }
    }catch(e){
      isLogin = false;
      if(kDebugMode){
        print("Error e ${e.toString()}");
      }
      notifyListeners();
    }

  }

  // Future<Map<String, dynamic>> login(String email, String password) async {
  //
  //   var result;
  //
  //   final Map<String, dynamic> loginData = {
  //     'UserName': 'kaliakoirdeo379',
  //     'Password': 'kaliakoirdeo379@2020'
  //   };
  //
  //   _loggedInStatus = Status.Authenticating;
  //   notifyListeners();
  //
  //   Response response = await post(
  //     AppUrl.login,
  //     body: json.encode(loginData),
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Basic ZGlzYXBpdXNlcjpkaXMjMTIz',
  //       'X-ApiKey' : 'ZGlzIzEyMw=='
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //
  //     final Map<String, dynamic> responseData = json.decode(response.body);
  //
  //     print(responseData);
  //
  //     var userData = responseData['Content'];
  //
  //     User authUser = User.fromJson(userData);
  //
  //     UserPreferences().saveUser(authUser);
  //
  //     _loggedInStatus = Status.LoggedIn;
  //     notifyListeners();
  //
  //     result = {'status': true, 'message': 'Successful', 'user': authUser};
  //
  //   } else {
  //     _loggedInStatus = Status.NotLoggedIn;
  //     notifyListeners();
  //     result = {
  //       'status': false,
  //       'message': json.decode(response.body)['error']
  //     };
  //   }
  //
  //   return result;
  //
  // }


  static onError(error){
    print('the error is ${error.detail}');
    return {
      'status':false,
      'message':'Unsuccessful Request',
      'data':error
    };
  }

  // Future<void> login(BuildContext context) async {
  //   if (email.text.isEmpty || password.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Email atau password tidak boleh kosong")));
  //     return;
  //   }
  //   keyForm = true;
  //   notifyListeners();
  //
  //   http.Response res = await http.post(
  //     Uri.parse("https://commerce-new.udadeveloper.com/index.php/Api/"),
  //     body: {“email”: email.text, “password”: password.text},
  //   );
  //
  //   keyForm = false;
  //   notifyListeners();
  //
  //   if(res.statusCode == 200){
  //     log(res.body);
  //     Map data = jsonDecode(res.body);
  //     if(data[‘isSuccess’] != false){
  //       log(“success”);
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
  //         return HomeScreen();
  //       }));
  //     }else if(data[‘isSuccess’] == false){
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text(“Email atau password salah”),)
  //       );
  //       print(‘failed’);
  //     }
  //   }
  // }?failed

}