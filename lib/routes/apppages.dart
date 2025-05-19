import 'package:easyrent/presentation/views/property_homepage/views/homePage.dart';
import 'package:easyrent/presentation/views/search/views/search_page.dart';
import 'package:easyrent/routes/routes.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.home,
      page: () => const Homepage(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.search,
      page: () =>  Search(),
      transition: Transition.rightToLeft,
    ),
    // GetPage(
    //   name: Routes.propertyList,
    //   // page: () => const PropertyListPage(),
    //   transition: Transition.cupertino,
    // ),
    // GetPage(
    //   name: Routes.propertyDetail,
    //   // page: () => const PropertyDetailPage(),
    //   transition: Transition.downToUp,
    // ),
  ];

/*
! use example
Get.toNamed(Routes.propertyDetail);         // Navigate
Get.offAllNamed(Routes.login);              // Clear backstack and go to login
*/
}
