// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
// import 'package:lottie/lottie.dart';


// class NetworkStatus extends StatefulWidget {
//   const NetworkStatus({super.key});

//   @override
//   State<NetworkStatus> createState() => _NetworkStatusState();
// }

// class _NetworkStatusState extends State<NetworkStatus> {
//   bool isConnectedToInternet = true;

//   StreamSubscription? _internetConnectionStreamSubscription;

//   void _checkInternetConnection() {
//     _internetConnectionStreamSubscription =
//         InternetConnection().onStatusChange.listen((event) {
//       switch (event) {
//         case InternetStatus.connected:
//           setState(() {
//             isConnectedToInternet = true;
//           });
//           break;
//         case InternetStatus.disconnected:
//           setState(() {
//             isConnectedToInternet = false;
//           });
//           break;
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _checkInternetConnection();
//   }

//   @override
//   void dispose() {
//     _internetConnectionStreamSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return isConnectedToInternet
//         ? HabitTable(key: habitTableKey)
//         : Card(
//             color: Theme.of(context).colorScheme.tertiary,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 35),
//                   child: Get.isDarkMode
//                       ? Lottie.asset('assets/animations/dinofordarktheme.json')
//                       : Lottie.asset('assets/animations/dinolightmode.json'),
//                 ),
                
//                 Text(
//                   '  You\'re Offline :(',
//                   style: manropeFun(context),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Please Make Sure You\'re Connected To The Internet',
//                   style: manropeFun(context),
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 )
//               ],
//             ),
//           );
//   }
// }
