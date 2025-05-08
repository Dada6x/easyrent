import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String date;
  final String comment;
  const CommentWidget(
      {super.key,
      required this.imagePath,
      required this.name,
      required this.date,
      required this.comment});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey.shade100,
      ),
      child: Column(
        children: [
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(avatar),
            ),
            title: Text(
              name,
              style: AppTextStyles.h16semi,
            ),
            subtitle: Text(
              date.toString(),
              style: AppTextStyles.h14regular.copyWith(color: grey),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text(
                style: AppTextStyles.h16regular.copyWith(color: grey), comment),
          )
        ],
      ),
    );
  }
}
