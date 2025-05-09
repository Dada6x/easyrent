import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/profile/widgets/profileappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
            Center(
              child: Stack(children: [
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
                      fillColor: Colors.white,
                      padding: EdgeInsets.all(10.r),
                      shape: const CircleBorder(),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: primaryBlue,
                        size: 28.r,
                      ),
                    )),
              ]),
            ),
            Padding(
              padding: EdgeInsets.all(8.r),
              child: Text(
                  textAlign: TextAlign.center,
                  "User Name",
                  style: AppTextStyles.h24semi),
            ),
            Divider(
              color: border,
              indent: 20.w,
              endIndent: 20.w,
            ),
            customListTile(
              "My Booking ",
              Icons.call_to_action_rounded,
            ),
            customListTile(
              "Payments ",
              Icons.payment,
            ),
            customListTile(
              "My Favorite ",
              Icons.favorite,
            ),
            Divider(
              color: border,
              indent: 20.w, //!
              endIndent: 20.w, //!
            ),
            customListTile(
              "Notifications ",
              Icons.notifications,
            ),
            customListTile(
              "Security ",
              Icons.security,
            ),
            customListTile(
              "Language ",
              Icons.language,
            ),
            customListTile(
              "Help Center ",
              Icons.help,
            ),
            customListTile(
              "Invite Friends ",
              Icons.people,
            ),
            customListTile(
              "Logout ",
              Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}

Widget customListTile(
  String string,
  IconData? leading,
) {
  return RawMaterialButton(
    onPressed: () {
      // destination to go 🌃
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
