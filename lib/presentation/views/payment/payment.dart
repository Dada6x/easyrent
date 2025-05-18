import 'package:easyrent/presentation/views/payment/creditCard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion/motion.dart';

class MotionCardPage extends StatelessWidget {
  const MotionCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Your Payment Method')),
      body: Column(
        children: [
          SizedBox(
            height: 300.h,
          ),
          Center(
            child: Motion.elevated(
                elevation: 90,
                borderRadius: BorderRadius.circular(25),
                child: const CreditCardWidget()),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("DDWAD"))
        ],
      ),
    );
  }
}
