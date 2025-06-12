import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:easyrent/core/constants/utils/button.dart';

class InviteFriendPage extends StatelessWidget {
  const InviteFriendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/svg/inviteFriends.svg",
              height: 220.h,
            ),
            SizedBox(height: 32.h),
            Text("Invite Your Friends", style: AppTextStyles.h32medium),
            SizedBox(height: 16.h),
            Text("Share the app with your friends and enjoy using it together!",
                textAlign: TextAlign.center, style: AppTextStyles.h14regular),
            const Spacer(),
            CustomButton(
              hint: "Share Now",
              function: () async {},
            )
          ],
        ),
      ),
    );
  }
}
//TODO add the Strings to localization 
