import 'package:easyrent/presentation/view/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  runApp(const GetMaterialApp(
    debugShowCheckedModeBanner: false,
    home: IntroductionScreen(),
  ));
}

/*
lib/
├── //! core/
│   ├── services/            # Dio setup, API client
│   ├── constants/           # App-wide constants like colors, images paths
│   └── utils/               # Helpers, formatters, etc.
│
├── //@ data/
│   ├── models/              # Shared models (e.g., User, Location)
│   └── repositories/        # API calls and implementations
│
├── //? presentation/
│   ├── //$home/
│   │   ├── views/
│   │   │   └── home_page.dart
│   │   └── //~bloc/            # Optional if home needs dynamic state
│   │
│   ├── //$auth/
│   │   ├── views/
│   │   │   └── login_page.dart
│   │   ├── //~bloc/
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
│   │   └── models/          # Optional feature-specific models
│   │
├── //# routes/
│   └── app_routes.dart      # Route names and navigation logic
│
└── main.dart
-------------------------------------------------------------------------------------
?BLoC :
@For business logic and state management (clean, testable, scalable)
-----------------
!GetX :
* Localization
* Theming (Dark/Light)
* Navigation through routes

*/
//TODO ask GPT where to put theme, localization , internet connection, and middlewares for introScreens
// do more application with res API's 
// 