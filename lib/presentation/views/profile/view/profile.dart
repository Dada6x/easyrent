import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/divider.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart';
import 'package:easyrent/presentation/views/auth/widgets/button.dart';
import 'package:easyrent/presentation/views/profile/payment/views/payment.dart';
import 'package:easyrent/presentation/views/profile/widgets/profileappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:motion/motion.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // image
            SizedBox(
              height: 26.r,
            ),
            Material(
              shadowColor: Colors.transparent,
              child: Motion(
                filterQuality: FilterQuality.high,
                controller: MotionController(maxAngle: 250, damping: 0.2),
                glare: const GlareConfiguration(maxOpacity: 0),
                shadow: const ShadowConfiguration(color: Colors.transparent),
                // glare: true,
                // translation: true,
                borderRadius: BorderRadius.circular(80),
                child: Column(
                  children: [
                    Stack(children: [
                      CircleAvatar(
                        radius: 80.r,
                        backgroundImage: const AssetImage(avatar),
                      ),
                      Positioned(
                          bottom: 1.r,
                          right: -10.r,
                          height: 49.r,
                          child: RawMaterialButton(
                            onPressed: () {
                              //! image Picker Dialog
                              Get.dialog(
                                AlertDialog(
                                  title: const Center(
                                    child: Text(
                                      'Choose ',
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.camera,
                                              color: primaryBlue,
                                              semanticLabel: "camera",
                                            )),
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(
                                              Icons.image,
                                              color: primaryBlue,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                            elevation: 2,
                            fillColor: Theme.of(context).colorScheme.secondary,
                            padding: EdgeInsets.all(10.r),
                            shape: const CircleBorder(),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: primaryBlue,
                              size: 28.r,
                            ),
                          )),
                    ]),
                    // image
                    Padding(
                      padding: EdgeInsets.all(8.r),
                      child: Text(
                          textAlign: TextAlign.center,
                          "User Name",
                          style: AppTextStyles.h24semi),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            const CustomDivider(),
            customListTile(
                "My Booking".tr, Icons.call_to_action_rounded, () {}),
            customListTile("Payments".tr, Icons.payment, () {
              Get.to(() => const PaymentMethod());
            }),
            customListTile("My Favorite".tr, Icons.favorite, () {}),
            const CustomDivider(),
            customListTile("Notifications".tr, Icons.notifications, () {}),
            customListTile("Security".tr, Icons.security, () {}),
            customListTile("Language".tr, Icons.language, () {}),
            customListTile("Help Center".tr, Icons.help, () {}),
            customListTile("Invite Friends".tr, Icons.people, () {}),
            const CustomDivider(),
            customListRedTile("Logout".tr, Icons.logout, () {
              Get.off(() => LoginPage());
            }),
          ],
        ),
      ),
    );
  }
}

Widget customListTile(
  String string,
  IconData? leading,
  Function destination,
) {
  return RawMaterialButton(
    onPressed: () {
      destination();
    },
    child: ListTile(
      leading: Icon(
        leading,
        color: primaryBlue,
        size: 29.r, //!
      ),
      title: Text(string, style: AppTextStyles.h18medium),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15.r, //!
      ),
    ),
  );
}

Widget customListRedTile(
  String string,
  IconData? leading,
  Function destination,
) {
  return RawMaterialButton(
    onPressed: () {
      destination();
    },
    child: ListTile(
      leading: Icon(
        leading,
        color: red,
        size: 29.r,
      ),
      title: Text(string, style: AppTextStyles.h18medium.copyWith(color: red)),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15.r,
      ),
    ),
  );
}

void logoutDialog() {
  Get.dialog(
    const AlertDialog(
      title: Center(
        child: Text(
          'are You Sure you want to logout',
        ),
      ),
      actions: <Widget>[],
    ),
  );
}
