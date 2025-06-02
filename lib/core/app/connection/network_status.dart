// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

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
//         ? Scaffold(
//           body: Center(
//               child: const Text("Online "),
//             ),
//         )
//         : Card(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 24,
//                 ),
//                 Text(
//                   '  You\'re Offline :(',
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Please Make Sure You\'re Connected To The Internet',
//                 ),
//                 const SizedBox(
//                   height: 24,
//                 )
//               ],
//             ),
//           );
//   }
// }
