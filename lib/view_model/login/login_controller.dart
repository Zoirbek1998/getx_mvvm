import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/database/save_user/user_save.dart';
import 'package:getx_mvvm/database/save_user/user_save_impl.dart';
import 'package:getx_mvvm/models/login/Login_response_model.dart';
import 'package:getx_mvvm/repository/login_repository/login_repository.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/utils.dart';

class LoginController extends GetxController {
  final _api = LoginRepository();
  UserSave userSave = UserSaveImpl();
  RxBool loading = false.obs;

  void loginApi(String email,String password) {
    loading.value = true;
    Map data = {
      "email":email,
      "password":password,
    };
    _api.loginApi(data).then((value) {
      loading.value = false;
      if(value["error"] =="user not found"){
        Utils.snackBar("Login", value["error"]);
      }else{
        userSave.saveUserToken(LoginResponseModel.fromJson(value)).then((value){
          Get.offAndToNamed(RouteName.homeScreen);
        }).onError((error, stackTrace){

        });
        Utils.snackBar("Login", "Login successfully");
      }

    }).onError((error, stackTrace) {
      loading.value = false;
      Utils.snackBar("Error", error.toString());
    });
  }

}
