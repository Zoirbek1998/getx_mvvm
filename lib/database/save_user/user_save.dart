
import 'package:getx_mvvm/models/login/Login_response_model.dart';

abstract class UserSave{
  LoginResponseModel? get getUser;
  Future<void> saveUserToken(LoginResponseModel token);
  void clear();
}