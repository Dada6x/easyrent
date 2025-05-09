// import 'package:easyrent/presentation/navigation/introduction_screen.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));


  runApp(ScreenUtilInit(
    designSize: const Size(430, 932), // from Figma
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
           extensions: const [
          SkeletonizerConfigData(),
        ],
          // brightness: Brightness.light
          fontFamily: "Rubik",
          // scaffoldBackgroundColor: white
        ),
        // darkTheme: ThemeData.dark(),
        home: const HomeScreenNavigator(),
        
      );
    },
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

TODO ask GPT where to put theme, localization , internet connection, and middlewares for introScreens

?Screen Util pkg
.w → width scaling
.h → height scaling
.sp → font scaling
.r → general radius/size scaling

*/





//############################# fetching SHit 
/*
! Fetch from Backend
Use Dio or http to fetch the property data.
Example using Dio:

Future<Property> fetchPropertyDetails(int propertyId) async {
  final response = await Dio().get('https://your-api.com/properties/$propertyId');

  if (response.statusCode == 200) {
    return Property.fromJson(response.data);
  } else {
    throw Exception('Failed to load property');
  }
}

! display in the detailsPage 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Property>(
      future: _futureProperty,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        final property = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: Text(property.title)),
          body: ListView(
            children: [
             ? Use property.imageUrls, property.agent, property.comments, etc.
            ],
          ),
        );


*/