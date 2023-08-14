import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';

import '../../database/save_user/user_save.dart';
import '../../database/save_user/user_save_impl.dart';

class SplashServices {
  UserSave userSave = UserSaveImpl();
  void isLogin() {
    Future.delayed(const Duration(seconds: 3), () {
      if(userSave.getUser?.token != null){
        Get.offAndToNamed(RouteName.homeScreen);
      }else{
        Get.offAndToNamed(RouteName.loginScreen);
      }

    });



  }
}
