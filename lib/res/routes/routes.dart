import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/home/home_page.dart';
import 'package:getx_mvvm/view/login/login_page.dart';
import 'package:getx_mvvm/view/splash_page.dart';

class AppRoutes {
  static appRoute() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => const SplashPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(microseconds: 250),
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => const LoginPage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(microseconds: 250),
        ),
        GetPage(
          name: RouteName.homeScreen,
          page: () =>  HomePage(),
          transition: Transition.leftToRightWithFade,
          transitionDuration: const Duration(microseconds: 250),
        ),
      ];
}
