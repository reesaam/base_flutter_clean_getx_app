import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_page_details.dart';

class SplashScreenController extends CoreController {

  @override
  void pageInit() {
    pageDetail = AppPageDetails.splashScreen;
  }
}
