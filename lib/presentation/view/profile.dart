import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/widgets/profileappbar.dart';
import 'package:flutter/material.dart';
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
            Center(
              child: Stack(children: [
                const CircleAvatar(
                  radius: 80, //!
                  backgroundImage: AssetImage(avatar),
                ),
                Positioned(
                    bottom: 1,
                    right: -10, //!
                    height: 49, //!
                    child: RawMaterialButton(
                      onPressed: () {
                        //! image Picker Dialog
                        Get.dialog(
                          AlertDialog(
                            title: const Center(
                              child: Text(
                                'Choose ',
                                // style: klasikHeader,
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
                      padding: const EdgeInsets.all(15.0),
                      shape: const CircleBorder(),
                      child: const Icon(
                        Icons.camera_alt_outlined,
                        color: primaryBlue,
                      ),
                    )),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  textAlign: TextAlign.center,
                  "Yahea Dada",
                  style: AppTextStyles.h24semi),
            ),
            const Divider(
              color: lightPrimary,
              indent: 20, //!
              endIndent: 20, //!
            ),
            customListTile(
              "My Booking ",
              Icons.call_to_action_rounded,
            ),
            customListTile(
              "Payments ",
              Icons.payment,
            ),
            const Divider(
              color: lightPrimary,
              indent: 20, //!
              endIndent: 20, //!
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
  return Material(
    child: ListTile(
      leading: Icon(
        leading,
        color: primaryBlue,
        size: 28, //!
      ),
      title: Text(string, style: AppTextStyles.h18medium),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15, //!
      ),
    ),
  );
}
