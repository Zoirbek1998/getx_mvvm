import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/models/users/User_list.dart';
import 'package:getx_mvvm/repository/home_repository/home_repository.dart';

class HomeController extends GetxController {
  final _api = HomeRepository();
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = "".obs;

  final userList = UserList().obs;

  void setxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setUserList(UserList value) => userList.value = value;

  void setError(String value) => error.value = value;

  void userListApi() {
    _api.userListApi().then((value) {
      setxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setxRequestStatus(Status.LOADING);

    _api.userListApi().then((value) {
      setxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setxRequestStatus(Status.ERROR);
    });
  }
}
