import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/views/auth/widgets/button.dart';
import 'package:easyrent/presentation/views/auth/widgets/greeting.dart';
import 'package:easyrent/presentation/views/payment/widgets/creditCard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motion/motion.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Your Payment Method'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(5.0.r),
          child: Column(
            children: [
              // SizedBox(
              //   height: 300.h,
              // ),
              Padding(
                padding: EdgeInsets.all(20.r),
                child: greetings(
                  "add Your ",
                  "Payment Method",
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: Text(
                  "you can edit this later on your account Settings",
                  style: AppTextStyles.h16regular.copyWith(color: grey),
                ),
              ),
               SizedBox(
                height: 20.h,
              ),
              Center(
                child: Motion.elevated(
                    elevation: 90,
                    borderRadius: BorderRadius.circular(25),
                    child: const CreditCardWidget()),
              ),
              SizedBox(
                height: 180.h,
              ),
              CustomeButton(
                hint: "Next",
                function: () {},
                width: 200,
                borderRadius: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
