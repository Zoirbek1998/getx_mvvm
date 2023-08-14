import 'package:flutter/material.dart';
import 'package:getx_mvvm/view_model/services/splash_services.dart';
import '../res/components/round_button.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  SplashServices splashServices = SplashServices();

  @override
  void initState() {
   splashServices.isLogin();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Center(
          child: Text(
        "Welcome Back",
        textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white),
      )),
    );
  }
}
