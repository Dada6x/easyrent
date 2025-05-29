import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/divider.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart';
import 'package:easyrent/presentation/views/profile/view/pages/payment/views/payment.dart';
import 'package:easyrent/presentation/views/profile/widgets/profileappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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
                controller: MotionController(maxAngle: 50, damping: 0.2),
                glare: const GlareConfiguration(maxOpacity: 0),
                shadow: const ShadowConfiguration(color: Colors.transparent),
                translation:
                    const TranslationConfiguration(maxOffset: Offset(50, 120)),
                borderRadius: BorderRadius.circular(80),
                child: Column(
                  children: [
                    Stack(
                      children: [
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
                              Get.dialog(
                                AlertDialog(
                                  title:
                                      const Center(child: Text('Choose Image')),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconButton(
                                          onPressed: () async {
                                            Get.back(); 
                                            final ImagePicker picker =
                                                ImagePicker();
                                            final XFile? image =
                                                await picker.pickImage(
                                              source: ImageSource.camera,
                                            );
                                            if (image != null) {
                                              // Handle the selected image from camera
                                              // You can set it to your CircleAvatar later when you're ready
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.camera,
                                            color: primaryBlue,
                                            semanticLabel: "camera",
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () async {
                                            Get.back();
                                            final ImagePicker picker =
                                                ImagePicker();
                                            final XFile? image =
                                                await picker.pickImage(
                                              source: ImageSource.gallery,
                                            );
                                            if (image != null) {
                                              // Handle the selected image from gallery
                                              // You can set it to your CircleAvatar later when you're ready
                                            }
                                          },
                                          icon: const Icon(
                                            Icons.image,
                                            color: primaryBlue,
                                          ),
                                        ),
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
                          ),
                        ),
                      ],
                    ),
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
              showDeleteDialog(context);
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

void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 24.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Are You sure to logout ?', style: AppTextStyles.h20medium),
              SizedBox(height: 12.h),
              Text(
                'You will be missed  🥺',
                style: AppTextStyles.h14regular,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                      child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          style: TextButton.styleFrom(
                            backgroundColor: primaryBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: Text('Cancel',
                              style: AppTextStyles.h16medium
                                  .copyWith(color: white)))),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        userPref?.setBool('isLoggedIn', false);
                        Get.off(() => LoginPage());
                        // Navigator.pop(context);
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text('Yes, Logout',
                          style:
                              AppTextStyles.h16medium.copyWith(color: white)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
