import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/utils/textStyles.dart';
import 'package:easyrent/data/models/comment_model.dart';
import 'package:easyrent/presentation/views/property_homepage/widgets/comment_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CommentSection extends StatefulWidget {
  final List<Comment> comments; // Make sure you define a Comment model

  const CommentSection({super.key, required this.comments});

  @override
  _CommentSectionState createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  bool showAllComments = false;

  @override
  Widget build(BuildContext context) {
    final visibleComments =
        showAllComments ? widget.comments : widget.comments.take(1).toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.comments.length > 1)
          Row(
            children: [
              Text(
                "Comments".tr,
                style: AppTextStyles.h20semi,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  //TODO
                  setState(() {
                    showAllComments = !showAllComments;
                  });
                },
                child: Text(
                  showAllComments ? "See Less".tr : "See All".tr,
                  style: AppTextStyles.h16semi.copyWith(color: primaryBlue),
                ),
              ),
            ],
          ),
        ListView.builder(
          itemCount: visibleComments.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final comment = visibleComments[index];
            return Column(
              children: [
                CommentWidget(
                  userRating: 3.2,
                  imagePath: comment.avatar,
                  userName: comment.username,
                  date: comment.date,
                  commentMessage: comment.commentMessage,
                ),
                SizedBox(height: 10.h),
              ],
            );
          },
        ),
        // if (widget.comments.length > 1)
        //   Align(
        //     alignment: Alignment.centerRight,
        //     child: TextButton(
        //       onPressed: () {
        //         //TODO
        //         setState(() {
        //           showAllComments = !showAllComments;
        //         });
        //       },
        //       child: Text(
        //         showAllComments ? "See Less" : "See All",
        //         style: AppTextStyles.h16semi.copyWith(color: primaryBlue),
        //       ),
        //     ),
        //   )
      ],
    );
  }
}
