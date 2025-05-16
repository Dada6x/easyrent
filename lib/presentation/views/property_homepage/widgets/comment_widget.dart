import 'package:easyrent/core/constants/assets.dart';
import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommentWidget extends StatelessWidget {
  final String imagePath;
  final String userName;
  final String date;
  final String commentMessage;
  final double userRating;
  const CommentWidget(
      {super.key,
      required this.imagePath,
      required this.userName,
      required this.date,
      required this.commentMessage,
      required this.userRating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: border),
        borderRadius: BorderRadius.circular(8.r),
        color: white,
      ),
      child: Column(
        children: [
          ListTile(
            // isThreeLine: true,
            leading: CircleAvatar(
              radius: 25.r,
              backgroundImage: const AssetImage(avatar),
            ),
            title: Text(
              userName,
              style: AppTextStyles.h16semi,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date.toString(),
                  style: AppTextStyles.h14regular.copyWith(color: grey),
                ),
                SizedBox(
                  width: 10.h,
                ),
                Row(
                  children: [
                    Text(
                      userRating.toString(),
                      style: AppTextStyles.h14regular.copyWith(color: grey),
                    ),
                    Icon(
                      Icons.star,
                      color: orange,
                      size: 16.r,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0.r),
            child: Text(
              style: AppTextStyles.h16regular.copyWith(color: grey),
              commentMessage,
            ),
          )
        ],
      ),
    );
  }
}
