import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextfield extends StatefulWidget {
  final String hint;
  final Icon icon;
  final TextEditingController controller;
  final bool isPassword;
  final bool isPhoneNumber;

  const CustomTextfield({
    super.key,
    required this.hint,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.isPhoneNumber = false,
  });

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  bool _obscureText = true;
  String? _errorText;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validate(String value) {
    if (widget.isPhoneNumber) {
      if (value.isEmpty) {
        setState(() {
          _errorText = "Phone number is required".tr;
        });
      } else if (!value.startsWith('09')) {
        setState(() {
          _errorText = "Phone number must start with 09".tr;
        });
      } else if (value.length != 10) {
        setState(() {
          _errorText = "Phone number must be exactly 10 digits".tr;
        });
      } else if (!RegExp(r'^\d{10}$').hasMatch(value)) {
        setState(() {
          _errorText = "Phone number must contain only digits".tr;
        });
      } else {
        setState(() {
          _errorText = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _obscureText : false,
            keyboardType: widget.isPhoneNumber
                ? TextInputType.number
                : TextInputType.text,
            maxLength: widget.isPhoneNumber ? 10 : null,
            onChanged: _validate,
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.secondary,
              filled: true,
              prefixIcon: widget.icon,
              prefixIconColor: primaryBlue,
              labelText: widget.hint.tr,
              labelStyle: AppTextStyles.h20regular.copyWith(color: grey),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: grey,
                      ),
                      onPressed: _toggleVisibility,
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(10.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.outline),
                borderRadius: BorderRadius.circular(10.r),
              ),
              errorText: _errorText,
            ),
          ),
        ],
      ),
    );
  }
}
