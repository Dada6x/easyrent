import 'package:dio/dio.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/services/api/dio_consumer.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/data/repos/userRepo.dart';
import 'package:easyrent/presentation/views/auth/views/login.dart';
import 'package:easyrent/presentation/views/auth/widgets/button.dart';
import 'package:easyrent/presentation/views/auth/widgets/empty_search_bar.dart';
import 'package:easyrent/presentation/views/auth/widgets/greeting.dart';
import 'package:easyrent/core/utils/textFields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
//$----------------------text controllers------------------------->
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();
//$------------------------------------------------------------->

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
                Padding(
                  padding: EdgeInsets.all(5.0.r),
                  child: greetings("Create Account", "Sign Up to get Started!"),
                ),
                //! Full Name
                CustomTextfield(
                  hint: "Full Name ",
                  icon: const Icon(Icons.person),
                  controller: _nameController,
                ),
                //! Email
                CustomTextfield(
                  hint: "Phone Number ",
                  icon: const Icon(Icons.phone),
                  controller: _phoneNumberController,
                  isPhoneNumber: true,
                ),
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
                CustomeButton(
                  hint: "Register",
                  function: () {
                    //TODO make it lighter the validate function 
                    final name = _nameController.text.trim();
                    final phone = _phoneNumberController.text.trim();
                    final password = _passwordController.text;
                    final confirmPassword = _confirmController.text;
                    if (name.isEmpty ||
                        phone.isEmpty ||
                        password.isEmpty ||
                        _phoneNumberController.text.length != 10 ||
                        password.length < 6 ||
                        name.length < 5 ||
                        !RegExp(r'[!@#\$&*~]').hasMatch(password) ||
                        //@ password must at least have one special character 
                        confirmPassword.isEmpty) {
                      Get.snackbar(
                        "Missing Information",
                        "All fields are required",
                        snackStyle: SnackStyle.FLOATING,
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: red,
                        colorText: white,
                        margin: EdgeInsets.all(12.w),
                        borderRadius: 8.r,
                      );
                      return;
                    }
                    if (password != confirmPassword) {
                      Get.snackbar(
                        "Error",
                        "Passwords do not match",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: red,
                        colorText: white,
                        margin: EdgeInsets.all(12.w),
                        borderRadius: 8.r,
                      );
                      return;
                    }
                    //
                    var api = DioConsumer(Dio());
                    Userrepo(api).signUpUser(
                        userName: name,
                        number: phone,
                        password: password,
                        latLang: {
                          //! EDIT THIS SHIT LATER what should i do else ?
                          "lat": 33.53680665392176,
                          "lon": 36.198938818542835,
                        });
                  },
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
                            transition: Transition.leftToRight,
                            curve: Curves.easeInOutCubicEmphasized);
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
}
