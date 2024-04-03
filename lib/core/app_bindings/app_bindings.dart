import 'package:get/get.dart';

import '../../features/about/presentation/manager/about_controller.dart';
import '../../features/homepage/presentation/manager/homepage_controller.dart';
import '../../features/not_found/presentation/manager/not_found_controller.dart';
import '../../features/settings/presentation/manager/settings_controller.dart';
import '../../features/splash_screen/presentation/manager/splash_screen_controller.dart';
import '../../features/update/presentation/manager/update_controller.dart';


class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(), fenix: true);
    Get.lazyPut<HomePageController>(() => HomePageController(), fenix: true);
    Get.lazyPut<SettingsController>(() => SettingsController(), fenix: true);
    Get.lazyPut<UpdateController>(() => UpdateController(), fenix: true);
    Get.lazyPut<AboutController>(() => AboutController(), fenix: true);
    Get.lazyPut<NotFoundController>(() => NotFoundController(), fenix: true);
  }
}