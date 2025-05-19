import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:easyrent/core/services/app/controller/app_controller.dart';
import 'package:easyrent/core/services/app/language/locale.dart';
import 'package:easyrent/core/services/app/theme/themes.dart';
import 'package:easyrent/presentation/navigation/introduction_screen.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:easyrent/presentation/views/payment/views/payment.dart';
import 'package:easyrent/presentation/views/property_homepage/views/parallaxEffeect.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:motion/motion.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skeletonizer/skeletonizer.dart';

//! FOR DEBUGGING must erase it after the end of the application
var debug = Logger(
    printer: PrettyPrinter(
  colors: true,
  methodCount: 0,
  errorMethodCount: 3,
  printEmojis: true,
));

// bool isOffline = !Get.find<AppController>().isOffline.value;
bool isOffline = false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
// the payment Card gyroscope 3D shi
  await Motion.instance.initialize();
  Motion.instance.setUpdateInterval(120.fps);

  runApp(ScreenUtilInit(
    designSize: const Size(430, 932), // design ratio in Figma
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      Get.put(AppController());
      debug.i("$isOffline");
      debug.d("application Started !!");
      return ThemeProvider(
        initTheme: Themes().lightMode,
        builder: (_, theme) {
          return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              theme: theme,
              translations: MyLocale(),
              home: const HomeScreenNavigator());
        },
      );
    },
  ));
}

//! some mocky json
// https://run.mocky.io/v3/0df94981-cbd5-431e-935f-fab6a2ef8675   single property
//https://run.mocky.io/v3/2f457c10-6138-48c6-874b-02ae84e9c19f    two

/*
design architecture

lib/
├── //! core/
│   ├── constants/           # App-wide colors, images paths.
│   ├── utils/               # textStyles.
│   └── services/            
│       ├── api/             # api consumer , api interceptor , dio consumer , end points
│       ├── app/             # controller for theme , language , internet connection 
│       └── errors/          # error model , exceptions 
│
├── //@ data/
│   ├── models/              # Shared models (e.g., User, Location)
│   └── repositories/        # API calls and implementations
│
├── //? presentation/
│   ├── //$home/ 
│   │   ├── views/
│   │   │   └── home_page.dart
│   │   └── //~bloc/
│   │
│   ├── //$auth/
│   │   ├── views/
│   │   │   └── login_page.dart
│   │   ├── bloc/
│   │   │   ├── auth_bloc.dart
│   │   │   ├── auth_event.dart
│   │   │   └── auth_state.dart
│   │   └── widgets/         # LoginForm, AuthButton, etc.
│   │
│   ├── //$property/
│   │   ├── views/
│   │   │   ├── property_list_page.dart
│   │   │   └── property_detail_page.dart
│   │   ├── //~bloc/
│   │   │   ├── property_bloc.dart
│   │   │   ├── property_event.dart
│   │   │   └── property_state.dart
│   │   ├── widgets/         # PropertyCard, PriceTag, etc.
│   │   └── models/  \        # Optional feature-specific models
│   │
│   ├── //$profile/
│   │   ├── views/
│   │   │   ├── property_list_page.dart
│   │   │   └── property_detail_page.dart
│   │   ├── //~bloc/
│   │   │   ├── profile.dart
│   │   │   └── profile_state.dart
│   │   ├── widgets/         # PropertyCard, PriceTag, etc.
│   │   └── models/          # Optional feature-specific models
│   │
├── //# routes/
│   └── app_routes.dart      # Route names and navigation logic
│
└── //?main.dart
-------------------------------------------------------------------------------------
UI triggers an event (e.g., LoadProperties)
BLoC receives the event and calls the repository
Repository makes API call through DioConsumer
API response is converted to model objects
BLoC emits new state with the data
UI rebuilds with the new state

?BLoC :
@For business logic and state management (clean, testable, scalable)
-----------------
!GetX :
* Localization
* Theming (Dark/Light)
* Navigation through routes

TODO ask GPT where to put theme, localization , internet connection, and middlewares for introScreens

?Screen Util pkg
.w → width scaling
.h → height scaling
.sp → font scaling
.r → general radius/size scaling

*/

//############################# fetching SHit
/*

//////////!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! when the boolean shared pref worked
  final prefs = await SharedPreferences.getInstance();
  final isDark = prefs.getBool('isDarkMode') ?? false;
  final langCode = prefs.getString('language') ?? 'ar';

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(ScreenUtilInit(
    designSize: const Size(430, 932),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      final appController = Get.put(AppController());

      appController.isDarkMode.value = isDark;
      appController.isArabic.value = langCode == 'en';

      return ThemeProvider(
        initTheme: isDark ? Themes().darkMode : Themes().lightMode,
        builder: (_, theme) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            translations: MyLocale(),
            locale: Locale(langCode),
            fallbackLocale: const Locale('en'),
            home: const HomeScreenNavigator(),
          );
        },
      );
    },
  ));
}

*/
