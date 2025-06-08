
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FAQItem extends StatelessWidget {
  final String question;
  final String? answer;

  const FAQItem({
    super.key,
    required this.question,
    this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: ExpansionTile(
        expandedAlignment: Alignment.center,
        maintainState: false,
        collapsedIconColor: primaryBlue,
        collapsedShape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            )),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.outline,
            )),
        textColor: primaryBlue,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        collapsedBackgroundColor: Theme.of(context).colorScheme.secondary,
        expansionAnimationStyle: AnimationStyle(curve: Curves.easeIn),
        title: Text(
          question,
          style: AppTextStyles.h18medium,
        ),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0.w, vertical: 10.h),
            child: Text(
              answer!,
              style: AppTextStyles.h14medium.copyWith(color: grey),
            ),
          ),
        ],
      ),
    );
  }
}
