import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/divider.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart';
import 'package:easyrent/presentation/views/profile/view/pages/Faq/view/faq.dart';
import 'package:easyrent/presentation/views/profile/view/pages/favourite/favourite_page.dart';
import 'package:easyrent/presentation/views/profile/view/pages/friends/invite_friend_page.dart';
import 'package:easyrent/presentation/views/profile/view/pages/language/language.dart';
import 'package:easyrent/presentation/views/profile/view/pages/my_booking/my_booking.dart';
import 'package:easyrent/presentation/views/profile/view/pages/notifications/widgets/notification_widget.dart';
import 'package:easyrent/presentation/views/profile/view/pages/payment/views/payment.dart';
import 'package:easyrent/presentation/views/profile/view/pages/security/security_page.dart';
import 'package:easyrent/presentation/views/profile/view/pages/theme/theme_page.dart';
import 'package:easyrent/presentation/views/profile/widgets/custome_list_tile.dart';
import 'package:easyrent/presentation/views/profile/widgets/dialog/logout_dialog.dart';
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
                          "User Name".tr,
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
            customListTile("My Booking".tr, Icons.call_to_action_rounded, () {
              Get.to(
                () => Scaffold_page(
                  title: "My Booking".tr,
                  widget: const MyBooking(),
                ),
              );
            }),
            //! payment
            customListTile("Payments".tr, Icons.payment, () {
              Get.to(() => const PaymentMethod());
            }),
            //! favorite Page
            customListTile("My Favorite".tr, Icons.favorite, () {
              Get.to(
                () => Scaffold_page(
                  title: "My Favorite".tr,
                  widget: const MyFavouritePage(),
                ),
              );
            }),
            const CustomDivider(),
            //! Notifications
            customListTile("Notifications".tr, Icons.notifications, () {
              Get.to(
                () => Scaffold_page(
                  title: "Notifications".tr,
                  widget: const NotificationWidget(),
                ),
              );
            }),
            //! security
            customListTile("Security".tr, Icons.security, () {
              Get.to(
                () => Scaffold_page(
                  title: "Security".tr,
                  widget: const SecurityPage(),
                ),
              );
            }),
            //! language
            customListTile("Language".tr, Icons.language, () {
              Get.to(
                () => Scaffold_page(
                  title: "Language".tr,
                  widget: const Language(),
                ),
              );
            }),
            customListTile("Themes".tr,
                Get.isDarkMode ? Icons.light_mode : Icons.dark_mode, () {
              Get.to(
                () => Scaffold_page(
                  title: "Themes".tr,
                  widget: const ThemePage(),
                ),
              );
            }),
            //! FAQ
            customListTile("FAQ".tr, Icons.help, () {
              Get.to(
                () => const Scaffold_page(
                  title: "FAQ",
                  widget: FAQPage(),
                ),
              );
            }),
            //! invite Friends
            customListTile("Invite Friends".tr, Icons.people, () {
              Get.to(
                () => Scaffold_page(
                  title: "Invite Friends".tr,
                  widget: InviteFriendPage(),
                ),
              );
            }),
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
