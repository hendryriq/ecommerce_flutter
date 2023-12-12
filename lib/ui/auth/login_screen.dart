import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pesantren_ecommerce/network/api.dart';
import 'package:pesantren_ecommerce/provider/provider_auth/provider_auth.dart';
import 'package:pesantren_ecommerce/response/res_login.dart';
import 'package:pesantren_ecommerce/ui/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isLogin = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return ProviderAuth();
      },
      child: Consumer<ProviderAuth>(
        builder: (BuildContext context, ProviderAuth value, Widget? child) =>
            Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 50,
                  ),
                  radius: 45,
                ),
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: value.email,
                  validator: (val) {
                    return val!.isEmpty ? "required" : null;
                  },
                  decoration: InputDecoration(
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    icon: Icon(Icons.email, color: Colors.black),
                    filled: true,
                    fillColor: Colors.deepPurple.withOpacity(0.2),
                  ),
                ),
                SizedBox(height: 8),
                TextFormField(
                  obscureText: value.isHiden,
                  controller: value.password,
                  validator: (val) {
                    return val!.isEmpty ? "required" : null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    icon: Icon(Icons.lock, color: Colors.black),
                    suffixIcon: IconButton(
                      onPressed: () {
                        value.klickHiden();
                      },
                      icon: value.isHiden
                      ? const Icon(Icons.visibility_off)
                          : Icon(Icons.visibility)
                    ),
                    filled: true,
                    fillColor: Colors.deepPurple.withOpacity(0.2),
                  ),
                ),
                SizedBox(height: 25),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {},
                  color: Colors.deepPurple,
                  height: 45,
                  minWidth: 200,
                  textColor: Colors.white,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
