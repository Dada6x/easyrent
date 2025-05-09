import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

const items = [//TODO this need sto be fixed 
  Colors.white,
  primaryBlue,
  Colors.white,
  primaryBlue,
];
const lotties = [easyRent, easyRent, easyRent, easyRent];
const texts = [
  'Explore thousands of listings and find the perfect home that matches your lifestyle and budget',
  'Use smart filters to narrow your search by location, price, size, and amenities',
  'Get in touch with verified agents and schedule visits with a single tap',
  'Whether renting or buying, enjoy secure transactions and instant updates on your deal status',
];

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
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
          // Background Custom Painter
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
                padding: const EdgeInsets.only(top: 200),
                child: SizedBox(
                  width: 300,
                  height: 400,
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      Expanded(
                        child: Lottie.asset(lotties[i]),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      Center(
                        child: Text(
                          texts[i],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: i % 2 == 0 ? primaryBlue : Colors.white,
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
              padding: const EdgeInsets.symmetric(vertical: 70, horizontal: 10),
              child: GestureDetector(
                onTap: () {
                  int currentPage = _notifier.value.round();
                  if (currentPage == items.length - 1) {
                    Get.off(() => const HomeScreenNavigator());
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
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
                        // child: Transform.translate(
                        // offset: Offset(0, 0),
                        child: Container(
                          width: 180,
                          height: 45,
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
                                fontSize: 12,
                                fontFamily: "Rubik",
                                // fontWeight: FontWeight.w8,
                                color: colorIndex % 2 == 0
                                    ? primaryBlue
                                    : Colors.white,
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
