import '../../../../core/app_localization.dart';
import '../../../../core/elements/core_controller.dart';
import '../../../../data/info/app_developer_info.dart';
import '../../../../data/info/app_info.dart';
import '../../../../data/info/app_page_details.dart';

class AboutController extends CoreController {

  List<String> listTitles = List.empty(growable: true);
  List<String> listItems = List.empty(growable: true);

  @override
  void dataInit() {
    // clearAppData();
    _fillData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails.about;
  }

  _fillData() {
    listTitles = List<String>.of([
      Texts.to.aboutTitlesAppName,
      Texts.to.aboutTitlesDeveloperName,
      Texts.to.aboutTitlesDeveloperWebsite,
      Texts.to.aboutTitlesDeveloperLinkedIn,
    ]);

    listItems = List<String>.of([
      AppInfo.appName,
      AppDeveloperInfo.fullName,
      AppDeveloperInfo.website,
      AppDeveloperInfo.linkedin,
    ]);
  }
}