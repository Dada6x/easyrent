import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

const items = [
  white,
  blue,
  white,
  blue,
];
const images = [
  intro1,
  intro2,
  intro3,
  intro4,
];
const texts = [
  'Explore thousands of listings and find the perfect home that matches your lifestyle and budget',
  'Get in touch with verified agents and schedule visits with a single tap',
  'Enjoy flexible payment options and complete peace of mind with secure, trusted transactions',
  'Whether renting or buying, enjoy secure transactions and instant updates on your deal status',
];

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final ValueNotifier<double> _notifier = ValueNotifier(0.0);
  final GlobalKey _button = GlobalKey();
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      _notifier.value = _pageController.page ?? 0.0;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _notifier,
            builder: (_, __) => CustomPaint(
              painter: FlowPainter(
                context: context,
                notifier: _notifier,
                target: _button,
                colors: items,
              ),
            ),
          ),
          PageView.builder(
            controller: _pageController,
            itemCount: items.length,
            itemBuilder: (context, i) => Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 200.h),
                child: SizedBox(
                  width: 400.w,
                  height: 500.h,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Expanded(child: FloatingWidget(i: i)),
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Text(
                          texts[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "Rubik",
                            fontWeight: FontWeight.w600,
                            color: i % 2 == 0 ? blue : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Interactive Button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 70.h, horizontal: 10.w),
              child: GestureDetector(
                onTap: () {
                  int currentPage = _notifier.value.round();
                  if (currentPage == items.length - 1) {
                    //@ middlewares
                    userPref?.setBool('isFirst', true);
                    Get.off(() => LoginPage());
                    // set the middle ware to never be here again
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: AnimatedBuilder(
                    animation: _notifier,
                    builder: (_, __) {
                      final animatorVal =
                          _notifier.value - _notifier.value.floor();
                      double opacity = 0, iconPos = 0;
                      int colorIndex;
                      if (animatorVal < 0.5) {
                        opacity = (animatorVal - 0.5) * -2;
                        iconPos = 80 * -animatorVal;
                        colorIndex = _notifier.value.floor() + 1;
                      } else {
                        colorIndex = _notifier.value.floor() + 2;
                        iconPos = -80;
                      }
                      if (animatorVal > 0.9) {
                        iconPos = -250 * (1 - animatorVal) * 10;
                        opacity = (animatorVal - 0.9) * 10;
                      }
                      colorIndex = colorIndex % items.length;
                      int currentPage = _notifier.value.round();
                      return SizedBox(
                        key: _button,
                        // offset: Offset(0, 0),
                        child: Container(
                          width: 188.w,
                          height: 46.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: items[colorIndex],
                          ),
                          child: Center(
                            child: Text(
                              currentPage == items.length - 1
                                  ? "Start Now"
                                  : "Next",
                              style: TextStyle(
                                fontSize: 18.5.sp,
                                fontFamily: "Rubik",
                                // fontWeight: FontWeight.w8,
                                color:
                                    colorIndex % 2 == 0 ? blue : Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FlowPainter extends CustomPainter {
  final BuildContext context;
  final ValueNotifier<double> notifier;
  final GlobalKey target;
  final List<Color> colors;

  RenderBox? _renderBox;

  FlowPainter({
    required this.context,
    required this.notifier,
    required this.target,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final screen = MediaQuery.of(context).size;
    _renderBox ??= target.currentContext?.findRenderObject() as RenderBox?;
    if (_renderBox == null) return;

    final page = notifier.value.floor();
    final animatorVal = notifier.value - page;
    final targetPos = _renderBox!.localToGlobal(Offset.zero);
    final xScale = screen.height * 8;
    final yScale = xScale / 2;
    final curvedVal = Curves.easeInOut.transform(animatorVal);
    final reverseVal = 1 - curvedVal;

    Paint buttonPaint = Paint(), bgPaint = Paint();
    Rect buttonRect;
    Rect bgRect = Rect.fromLTWH(0, 0, screen.width, screen.height);

    if (animatorVal < 0.5) {
      bgPaint.color = colors[page % colors.length];
      buttonPaint.color = colors[(page + 1) % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx - (xScale * curvedVal),
        targetPos.dy - (yScale * curvedVal),
        targetPos.dx + _renderBox!.size.width * reverseVal,
        targetPos.dy + _renderBox!.size.height + (yScale * curvedVal),
      );
    } else {
      bgPaint.color = colors[(page + 1) % colors.length];
      buttonPaint.color = colors[page % colors.length];
      buttonRect = Rect.fromLTRB(
        targetPos.dx + _renderBox!.size.width * reverseVal,
        targetPos.dy - yScale * reverseVal,
        targetPos.dx + _renderBox!.size.width + xScale * reverseVal,
        targetPos.dy + _renderBox!.size.height + yScale * reverseVal,
      );
    }

    canvas.drawRect(bgRect, bgPaint);
    canvas.drawRRect(
      RRect.fromRectAndRadius(buttonRect, Radius.circular(screen.height)),
      buttonPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class FloatingWidget extends StatefulWidget {
  final int i;
  const FloatingWidget({super.key, required this.i});

  @override
  State<FloatingWidget> createState() => _FloatingWidgetState();
}

class _FloatingWidgetState extends State<FloatingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 7),
  )..repeat(reverse: true);
  late final Animation<Offset> _animation =
      Tween(begin: Offset.zero, end: const Offset(0, 0.20))
          .animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int i = widget.i;
    return SlideTransition(
      position: _animation,
      child: Flexible(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.r),
          child: SvgPicture.asset(
            images[i],
            fit: BoxFit.contain,
            width: double.infinity,
            height: 250.h,
          ),
        ),
      ),
    );
  }
}
