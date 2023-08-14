import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/data/response/status.dart';
import 'package:getx_mvvm/database/save_user/user_save.dart';
import 'package:getx_mvvm/database/save_user/user_save_impl.dart';
import 'package:getx_mvvm/res/components/general_exceptions_widget.dart';
import 'package:getx_mvvm/res/components/internet_exceptions_widget.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/utils/Constants.dart';
import 'package:getx_mvvm/view_model/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserSave userSave = UserSaveImpl();
  final homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController.userListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                userSave.clear();
                Get.offAndToNamed(RouteName.loginScreen);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.ERROR:
            if (homeController.error.value == Constants.noInternet) {
              return InternetNetExceptionWidget(onTap: () {
                homeController.refreshApi();
              });
            } else {
              return GeneralExceptionWidget(onTap: () {
                homeController.refreshApi();
              });
            }
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeController.userList.value.data?.length,
                itemBuilder: (context, index) {
                  var item = homeController.userList.value.data?[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(item?.avatar ?? ""),
                      ),
                      title: Text("${item?.firstName} ${item?.lastName}"),
                      subtitle: Text("${item?.email} "),
                    ),
                  );
                });
        }
      }),
    );
  }
}
