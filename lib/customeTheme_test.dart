// import 'dart:math';
// import 'package:flutter/material.dart';

// class CustomThemeSwitcher extends StatefulWidget {
//   final ThemeData lightTheme;
//   final ThemeData darkTheme;

//   const CustomThemeSwitcher({
//     Key? key,
//     required this.lightTheme,
//     required this.darkTheme,
//   }) : super(key: key);

//   @override
//   _CustomThemeSwitcherState createState() => _CustomThemeSwitcherState();
// }

// class _CustomThemeSwitcherState extends State<CustomThemeSwitcher>
//     with SingleTickerProviderStateMixin {
//   late ThemeData _currentTheme;
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool _isLight = true;

//   Offset? _circleCenter; // dynamic center of reveal circle

//   final GlobalKey _buttonKey = GlobalKey();

//   @override
//   void initState() {
//     super.initState();
//     _currentTheme = widget.lightTheme;

//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: 700),
//     );

//     _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
//   }

//   void _toggleTheme() {
//     if (_controller.isAnimating) return;

//     final RenderBox? renderBox =
//         _buttonKey.currentContext?.findRenderObject() as RenderBox?;
//     if (renderBox != null) {
//       // Get button center in global coordinates
//       final Offset buttonCenter = renderBox.localToGlobal(renderBox.size.center(Offset.zero));

//       // AppBar height (default 56.0)
//       const double appBarHeight = kToolbarHeight;

//       // Set circle center at button's horizontal center and AppBar bottom edge vertically
//       final Offset circleStart = Offset(buttonCenter.dx, appBarHeight);

//       setState(() {
//         _circleCenter = circleStart;
//       });
//     }

//     if (_isLight) {
//       _controller.forward();
//     } else {
//       _controller.reverse();
//     }

//     setState(() {
//       _isLight = !_isLight;
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   double _calculateMaxRadius(Size size, Offset center) {
//     final distances = [
//       (center - Offset(0, 0)).distance,
//       (center - Offset(size.width, 0)).distance,
//       (center - Offset(0, size.height)).distance,
//       (center - Offset(size.width, size.height)).distance,
//     ];
//     return distances.reduce(max);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     // Default fallback for circleCenter if null
//     final Offset circleCenter = _circleCenter ?? Offset(size.width - 40, kToolbarHeight);

//     final maxRadius = _calculateMaxRadius(size, circleCenter);

//     return AnimatedBuilder(
//       animation: _animation,
//       builder: (context, child) {
//         final Color bgColor = Color.lerp(
//           widget.lightTheme.scaffoldBackgroundColor,
//           widget.darkTheme.scaffoldBackgroundColor,
//           _animation.value,
//         )!;

//         return Theme(
//           data: _isLight ? widget.lightTheme : widget.darkTheme,
//           child: Scaffold(
//             appBar: AppBar(
//               title: const Text("Custom Theme Switcher"),
//               actions: [
//                 IconButton(
//                   key: _buttonKey,
//                   icon: Icon(_isLight ? Icons.dark_mode : Icons.light_mode),
//                   onPressed: _toggleTheme,
//                 )
//               ],
//               backgroundColor: bgColor,
//             ),
//             body: Stack(
//               children: [
//                 Container(
//                   color: bgColor,
//                   child: Center(
//                     child: Text(
//                       'Hello, Theme!',
//                       style: TextStyle(fontSize: 32),
//                     ),
//                   ),
//                 ),
//                 ClipPath(
//                   clipper: CircleClipper(
//                     radius: _animation.value * maxRadius,
//                     center: circleCenter,
//                   ),
//                   child: Container(
//                     color: _isLight
//                         ? widget.darkTheme.scaffoldBackgroundColor
//                         : widget.lightTheme.scaffoldBackgroundColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class CircleClipper extends CustomClipper<Path> {
//   final double radius;
//   final Offset center;

//   CircleClipper({required this.radius, required this.center});

//   @override
//   Path getClip(Size size) {
//     return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
//   }

//   @override
//   bool shouldReclip(CircleClipper oldClipper) =>
//       radius != oldClipper.radius || center != oldClipper.center;
// }

// void main() {
//   runApp(
//     MaterialApp(
//       home: CustomThemeSwitcher(
//         lightTheme: ThemeData.light(),
//         darkTheme: ThemeData.dark(),
//       ),
//     ),
//   );
// }
