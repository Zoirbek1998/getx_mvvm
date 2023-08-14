import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/round_button.dart';
import 'package:getx_mvvm/utils/utils.dart';
import 'package:getx_mvvm/view_model/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = Get.put(LoginController());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              onFieldSubmitted: (value) {
                // Utils.fieldFocusChange(context, current, nextFocus)
              },
              decoration:const InputDecoration(
                  hintText: "Email", border: OutlineInputBorder()),
            ),
           const SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              onFieldSubmitted: (value) {
                // Utils.fieldFocusChange(context, current, nextFocus)
              },
              decoration:const InputDecoration(
                  hintText: "Password", border: OutlineInputBorder()),
            ),
            const SizedBox(height: 40),
            Obx(() => RoundButton(
              title: "Login",
              onPassed: () {
                loginController.loginApi(emailController.text, passwordController.text);
              },
              width: 200,
              loading: loginController.loading.value,
            ))
          ],
        ),
      ),
    );
  }
}
