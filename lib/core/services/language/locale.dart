import 'package:get/get.dart';

class MyLocale implements Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "HomePage": "الصفحة الرئيسية",
        },
        "en": {
          "HomePage": "HomePage",
        }
      };
}
