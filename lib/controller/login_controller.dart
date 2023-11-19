import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  RxBool loading = false.obs ;

  loginApi() async {
    try {
      loading.value = true  ;
      final response = await post(Uri.parse('https://reqres.in/api/login'),
          body: {'email': emailController.value.text ,
             'password': passwordController.value.text });

      var data = jsonDecode(response.body);
      loading.value = false ;

      print(data);
      print(response.statusCode.toString());

      if (response.statusCode == 200) {
        Get.snackbar('Login successful', 'Login successful') ;
      }
      else {
        Get.snackbar('Login fail', 'Login error') ;

      }
    } catch (e) {
      Get.snackbar('Login error', e.toString()) ;

    }
  }
}
