import 'package:get/get.dart';

import '../../../../core/app_extensions/extension_app_routes.dart';
import '../../data/resources/app_enums.dart';
import '../../features/about/presentation/pages/about_view.dart';
import '../../features/homepage/presentation/pages/homepage_view.dart';
import '../../features/not_found/presentation/pages/not_found_view.dart';
import '../../features/settings/presentation/pages/settings_view.dart';
import '../../features/splash_screen/presentation/pages/splash_screen_view.dart';
import '../../features/update/presentation/pages/update_view.dart';

class AppPages {
  static get pages => [
    ///Admin Pages
    // GetPage(name: AppRoutes.adminStartPage.route, page: AdminStartPage.new),
    // GetPage(name: AppRoutes.adminPagesTestPage.route, page: AdminPagesTestPage.new),
    // GetPage(name: AppRoutes.adminUITestPage.route, page: AdminUITestPage.new),

    ///Main App Pages
    GetPage(name: AppRoutes.splashScreen.route, page: SplashScreenPage.new),
    GetPage(name: AppRoutes.homepage.route, page: HomePage.new),
    GetPage(name: AppRoutes.settings.route, page: SettingsPage.new),
    GetPage(name: AppRoutes.update.route, page: UpdatePage.new),
    GetPage(name: AppRoutes.about.route, page: AboutPage.new),
    GetPage(name: AppRoutes.notFound.route, page: NotFoundPage.new),
  ];
}