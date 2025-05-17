import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:easyrent/presentation/views/auth/views/forget_password.dart';
import 'package:easyrent/presentation/views/auth/views/signup.dart';
import 'package:easyrent/presentation/views/auth/widgets/button.dart';
import 'package:easyrent/presentation/views/auth/widgets/empty_search_bar.dart';
import 'package:easyrent/presentation/views/auth/widgets/greeting.dart';
import 'package:easyrent/core/utils/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
//$----------------------text controllers------------------------->
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
//$--------------------------------------------------------------->

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: emptySearchBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                greetings("Welcome Back!", "Please login to your account"),
                //! EMAIL
                CustomTextfield(
                  hint: "Phone Number ",
                  icon: const Icon(Icons.phone),
                  controller: _emailController,
                  isPhoneNumber: true,
                ),
                //! PASSWORD
                CustomTextfield(
                  hint: "Password ",
                  icon: const Icon(Icons.password_outlined),
                  controller: _passwordController,
                  isPassword: true,
                ),
                //! FORGET PASSWORD
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        //forget password
                        Get.to(() => ForgetPasswordPage());
                      },
                      child: Text('Forgot Password?',
                          style: AppTextStyles.h14regular
                              .copyWith(color: primaryBlue))),
                ),
                //! LOGIN BUTTON :O
                CustomeButton(
                  hint: "login",
                  function: () {
                    Get.off(() => const HomeScreenNavigator());
                  },
                ),
                //! navigating to signup
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?",
                        style: AppTextStyles.h12regular),
                    TextButton(
                      onPressed: () {
                        Get.off(() => SignupPage(),
                            transition: Transition.rightToLeft,
                            curve: Curves.easeInOutCubicEmphasized);
                      },
                      child: Text('Sign Up', style: AppTextStyles.h16semi),
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
}
