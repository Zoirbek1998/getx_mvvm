import 'package:getx_mvvm/database/save_user/user_save.dart';
import 'package:getx_mvvm/models/login/Login_response_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../hive_boxes.dart';

class UserSaveImpl extends UserSave {
  static final UserSaveImpl _singleton = UserSaveImpl._internal();

  factory UserSaveImpl() {
    return _singleton;
  }

  UserSaveImpl._internal();

  Box tokenBox = Hive.box(HiveBoxes.tokenBox);

  @override
  void clear() {
    tokenBox.clear();
  }

  @override
  Future<void> saveUserToken(LoginResponseModel token) async {
    return await tokenBox.put(HiveBoxes.tokenBox, token.toJson());
  }

  @override
  LoginResponseModel? get getUser {
    var tokenSave = tokenBox.get(HiveBoxes.tokenBox, defaultValue: null);
    if (tokenSave != null) {
      return LoginResponseModel.fromJson(tokenSave);
    }
    return null;
  }
}
