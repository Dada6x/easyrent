import 'dart:async';
import 'package:dio/dio.dart';
import 'package:easyrent/core/services/api/api_consumer.dart';
import 'package:easyrent/core/services/api/dio_consumer.dart';
import 'package:easyrent/core/services/api/end_points.dart';
import 'package:easyrent/data/repos/userRepo.dart';
import 'package:easyrent/main.dart';
import 'package:easyrent/presentation/navigation/navigator.dart';
import 'package:easyrent/core/utils/button.dart';
import 'package:easyrent/presentation/views/auth/widgets/empty_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';

class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final TextEditingController _pinController = TextEditingController();

  Timer? _timer;
  int _remainingTime = 60;
  bool _canResend = false;
  bool? _isCodeValid;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  //! its working but not clean , also i need to fetch the user at this point

  Future<void> sendVerificationCode() async {
    try {
      //TODO use the verifyCode Function in the user Repo 
      //TODO ID
      //TODO DIOCONSUMER API SHIT
      final response = await DioConsumer(Dio()).post(
        EndPoints.verifyCode,
        data: {
          ApiKey.code: _pinController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        //! in order to transfer this into another repo i need the emit state of the shit here
        // like if status code is 200 emit succses state to the pin codes
        final token = response.data['accessToken'];
        debug.i("$token");
        await saveToken(token);
        setState(() {
          _isCodeValid = true;
        });
        // await Future.delayed(const Duration(milliseconds: 600));
        userPref?.setBool('isLoggedIn', true);
        Get.off(() => const HomeScreenNavigator());
        //! WE MAKE AN NEW USER TO DO SHIT FOR US HEHEHE
      } else {
        setState(() {
          _isCodeValid = false;
        });
      }
      //TODO add server exceptions
    } catch (e) {
      setState(() {
        _isCodeValid = false;
      });
      Get.snackbar(
        "Error",
        "Invalid or expired verification code",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void _startTimer() {
    _canResend = false;
    _remainingTime = 45;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _canResend = true;
          _timer?.cancel();
        }
      });
    });
  }

  void _onResendCode() {
    if (_canResend) {
      _startTimer();
      // Add resend API call here if needed

//! AAAAAAAAAAAAAAAAAAAAAAAAADDDDDDDDDDDDDDDDDDDDDDD THE RESEND CODE PLEASEEEEEEE
    }
  }

  Color _getStatusColor(BuildContext context) {
    if (_isCodeValid == true) return green;
    if (_isCodeValid == false) return red;
    return Theme.of(context).colorScheme.outline;
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(context);

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: emptySearchBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Text("Verification", style: AppTextStyles.h32semi),
                SizedBox(height: 10.h),
                Text(
                  "Enter the 5-digit code sent to your email",
                  style: AppTextStyles.h16light.copyWith(color: grey),
                ),
                SizedBox(height: 40.h),
                PinCodeTextField(
                  appContext: context,
                  controller: _pinController,
                  length: 5,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  textStyle: AppTextStyles.h20semi,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10.r),
                    fieldHeight: 60.h,
                    fieldWidth: 60.w,
                    activeColor: statusColor,
                    selectedColor: statusColor,
                    inactiveColor: Theme.of(context).colorScheme.outline,
                    activeFillColor: Theme.of(context).colorScheme.secondary,
                    selectedFillColor: Theme.of(context).colorScheme.secondary,
                    inactiveFillColor: Theme.of(context).colorScheme.secondary,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onChanged: (value) {
                    setState(() {
                      _isCodeValid = null;
                    });
                  },
                  onCompleted: (value) async {
                    if (value.length == 5) {
                      await sendVerificationCode();
                    }
                  },
                ),
                SizedBox(height: 30.h),
                //! we can TRASH THE BUTTON COZ ITS NOT USEFUL ACTUALLY  ☝🤓
                CustomeButton(
                  hint: "Verify",
                  function: () async {
                    if (_pinController.text.length == 5) {
                      await sendVerificationCode();
                    } else {
                      Get.snackbar("Error", "Please enter a 5-digit code",
                          snackPosition: SnackPosition.BOTTOM);
                    }
                  },
                ),
                SizedBox(height: 300.h),
                Center(
                  child: SizedBox(
                    width: 180.w,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.outline,
                          ),
                          borderRadius: BorderRadius.circular(32.r),
                        ),
                      ),
                      onPressed: _canResend ? _onResendCode : null,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.timer,
                            color: primaryBlue,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            _canResend
                                ? "Resend Code"
                                : "Resend in 00:${_remainingTime.toString().padLeft(2, '0')}",
                            style: AppTextStyles.h14regular.copyWith(
                              color: _canResend ? primaryBlue : grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
