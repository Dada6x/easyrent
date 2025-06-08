import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/divider.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/Faq/view/faq.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/favourite/view/favourite_page.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/friends/invite_friend_page.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/language/view/language.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/my_booking/views/my_booking.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/notifications/views/notifications_page.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/payment/views/payment.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/security/view/security_page.dart';
import 'package:easyrent/presentation/views/profile/view/profile_pages/theme/theme_page.dart';
import 'package:easyrent/presentation/views/profile/widgets/custome_list_tile.dart';
import 'package:easyrent/presentation/views/profile/widgets/dialog/logout_dialog.dart';
import 'package:easyrent/presentation/views/profile/widgets/profileappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion/motion.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        Skeletonizer(
                          child: CircleAvatar(
                            radius: 80.r,
                            backgroundImage: const AssetImage(avatar),
                          ),
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
                      child: Skeletonizer(
                        child: Text(
                            textAlign: TextAlign.center,
                            "User Name".tr,
                            style: AppTextStyles.h24semi),
                      ),
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
              string: "My Booking".tr,
              leading: Icons.call_to_action_rounded,
              destination_widget: MyBooking(),
            ),
            //! payment
            customListTile(
              string: "Payments".tr,
              leading: Icons.payment,
              destination_widget: const PaymentMethod(),
            ),
            //! favorite Page
            customListTile(
                string: "My Favorite".tr,
                leading: Icons.favorite,
                destination_widget: const MyFavouritePage()),
            const CustomDivider(),
            //! Notifications
            customListTile(
                string: "Notifications".tr,
                leading: Icons.notifications,
                destination_widget: const NotificationsPage()),
            //! security
            customListTile(
              string: "Security".tr,
              leading: Icons.security,
              destination_widget: const SecurityPage(),
            ),
            //! language
            customListTile(
                string: "Language".tr,
                leading: Icons.language,
                destination_widget: const LanguagePage()),
            customListTile(
                string: "Themes".tr,
                leading: Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                destination_widget: const ThemePage()),
            //! FAQ
            customListTile(
                string: "FAQ".tr,
                leading: Icons.help,
                destination_widget: const FAQPage()),
            //! invite Friends
            customListTile(
                string: "Invite Friends".tr,
                leading: Icons.people,
                destination_widget: const InviteFriendPage()),
            const CustomDivider(),
            //! LogOut
            customListRedTile("Logout".tr, Icons.logout, () {
              showDeleteDialog(context);
            }),
          ],
        ),
      ),
    );
  }
}

class Scaffold_page extends StatelessWidget {
  final Widget widget;
  final String title;
  const Scaffold_page({
    super.key,
    required this.widget,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title.tr),
      ),
      body: widget,
    );
  }
}
