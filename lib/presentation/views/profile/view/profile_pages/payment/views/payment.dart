import 'package:bounce/bounce.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:easyrent/core/constants/utils/button.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/payment/widgets/creditCard_widget.dart';
import 'package:easyrent/presentation/views/web_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motion/motion.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(5.0.r),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Text(
                "you can edit this later on your account Settings",
                style: AppTextStyles.h16regular.copyWith(color: grey),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Bounce(
              onTap: () {},
              child: Center(
                child: Motion.elevated(
                    elevation: 90,
                    shadow: true,
                    translation: true,
                    glare: false,
                    borderRadius: BorderRadius.circular(25),
                    child: const CreditCardWidget()),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: SizedBox(
                height: 29.h,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "move Your Phone !\n tap on the card ",
                    style: AppTextStyles.h10light.copyWith(color: Theme.of(context).colorScheme.primary),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 350.h,
            ),
            CustomButton(
              hint: "Next",
              function: () async {
                Get.to(() => const StripeWebPage());
              },
              width: 200,
              borderRadius: 24,
            )
          ],
        ),
      ),
    );
  }
}
