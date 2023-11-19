

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_flutter/controller/login_controller.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {

    LoginController loginController = LoginController() ;


    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In '),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Obx(() => Center(
                child: loginController.loading.value ? CircularProgressIndicator() : null ,
              )),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: loginController.emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: loginController.passwordController,
                  decoration: InputDecoration(
                    labelText: 'password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)
                    )
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              InkWell(
                onTap: () => loginController.loginApi(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 45,
                    color: Colors.grey,
                    child: const Center(
                      child: Text('Log in'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
