import 'package:easyrent/core/constants/colors.dart';
import 'package:easyrent/core/constants/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgentWidget extends StatelessWidget {
  final String agentName;
  final String agentRole;
  final String agentImage;
  const AgentWidget(
      {super.key,
      required this.agentName,
      required this.agentRole,
      required this.agentImage});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 23.r,
        backgroundImage: AssetImage(agentImage),
      ),
      title: Text(//TODO its overflowing 
        agentName,
        style: AppTextStyles.h18semi,
      ),
      subtitle: Text(
        agentRole,
        style: AppTextStyles.h14medium.copyWith(color: grey),
      ),
      trailing: IntrinsicWidth(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.chat, size: 25.r, color: primaryBlue),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.phone_enabled, size: 25.r, color: primaryBlue),
              onPressed: () {
              
              },
            ),
          ],
        ),
      ),
    );
  }
}
