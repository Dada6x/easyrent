import 'package:easyrent/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(3.0.r),
      child: ListTile(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: primaryBlue),
            borderRadius: BorderRadius.circular(12)),
        tileColor: Theme.of(context).colorScheme.secondary,
        title: const Text("Notification"),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete,
              color: red,
            )),
      ),
    );
  }
}
