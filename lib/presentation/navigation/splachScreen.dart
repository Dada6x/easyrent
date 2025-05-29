import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/navigation/introduction_screen.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1120),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    Future.delayed(const Duration(seconds: 2), () {
      _controller.forward().whenComplete(() {
        // ! just the introduction
        if (userPref?.getBool("isFirst") == true) {
          Get.offNamed("/login");
        } else {
          Get.off(() => const IntroductionScreen());
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (_, child) {
              final radius = screenSize.longestSide * 1.5 * _animation.value;
              return ClipPath(
                  clipper: CircleRevealClipper(radius),
                  child: Container(color: primaryBlue));
            },
          ),
          Center(child: Lottie.asset(easyRent)),
        ],
      ),
    );
  }
}

class CircleRevealClipper extends CustomClipper<Path> {
  final double radius;

  CircleRevealClipper(this.radius);

  @override
  Path getClip(Size size) {
    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    path.addOval(Rect.fromCircle(center: center, radius: radius));
    return path;
  }

  @override
  bool shouldReclip(CircleRevealClipper oldClipper) =>
      radius != oldClipper.radius;
}

// ctrl + Q SideBar items (version ,search , notes and todos )
// ctrl + E search in project (files )
// ctrl + R change Projects 