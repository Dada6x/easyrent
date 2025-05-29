import 'package:easyrent/main.dart';
import 'package:flutter/src/widgets/navigator.dart';
import 'package:get/get.dart';

class MiddlewareAuth extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (userPref!.getString("id") != null) {
      return const RouteSettings(name: "/mainPage");
    }
    return super.redirect(route);
  }
}
