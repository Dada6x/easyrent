import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart';
import 'package:easyrent/presentation/views/auth/widgets/greeting.dart';
import 'package:easyrent/presentation/views/auth/widgets/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
//$----------------------text controllers------------------------->
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
//$------------------------------------------------------------->

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                greetings("Create Account", "Sign Up to get Started!"),
                //! Full Name
                CustomTextfield(
                    hint: "Full Name ",
                    icon: const Icon(Icons.person),
                    controller: _nameController),
                //! Email
                CustomTextfield(
                    hint: "Email",
                    icon: const Icon(Icons.email),
                    controller: _emailController),
                //! Password
                CustomTextfield(
                  hint: "Password",
                  icon: const Icon(Icons.lock),
                  controller: _passwordController,
                  isPassword: true,
                ),
                //!Confirm Password
                CustomTextfield(
                  hint: "Confirm Password",
                  icon: const Icon(Icons.lock),
                  controller: _confirmController,
                  isPassword: true,
                ),
                //! Register BUTTON :O
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.off(() => const HomeScreenNavigator());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Text('Register',
                          style: AppTextStyles.h18semi.copyWith(color: white)),
                    ),
                  ),
                ),
                //! navigating to signup
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("ALready have an account !",
                        style: AppTextStyles.h12regular),
                    TextButton(
                      onPressed: () {
                        Get.off(() => LoginPage(),
                            transition: Transition.leftToRightWithFade);
                      },
                      child: Text('Login', style: AppTextStyles.h16semi),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration customeInputDecoration(
    BuildContext context,
    Icon icon,
    String hint,
  ) {
    return InputDecoration(
      fillColor: Theme.of(context).colorScheme.secondary,
      filled: true,
      prefixIcon: icon,
      prefixIconColor: primaryBlue,
      labelText: hint.tr,
      labelStyle: AppTextStyles.h20regular.copyWith(color: grey),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
