import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatefulWidget {
  final String hint;
  final Future<void> Function()? function;
  final double? width;
  final double? borderRadius;

  const CustomButton({
    super.key,
    required this.hint,
    required this.function,
    this.width,
    this.borderRadius,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isLoading = false;

  void _handleTap() async {
    setState(() => isLoading = true);
    if (widget.function != null) await widget.function!();
    await Future.delayed(const Duration(seconds: 2));
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
      child: SizedBox(
        width: widget.width ?? double.infinity,
        height: 52.h,
        child: ElevatedButton(
          onPressed: isLoading ? null : _handleTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius ?? 12.r),
            ),
          ),
          child: isLoading
              ? SizedBox(
                  width: 24.w,
                  height: 24.w,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : Text(widget.hint,
                  style: AppTextStyles.h18semi.copyWith(color: white)),
        ),
      ),
    );
  }
}
