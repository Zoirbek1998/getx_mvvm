import 'package:getx_mvvm/models/users/User_list.dart';

import '../../data/network/network_api_services.dart';
import '../../res/app_url/app_url.dart';

class HomeRepository {
  final _apiService = NetworkApiService();

  Future<UserList> userListApi() async {
    final response = await _apiService.getApi(AppUrl.userListApi);
    return UserList.fromJson(response);
  }
}
