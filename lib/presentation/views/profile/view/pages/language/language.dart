import 'package:flutter/material.dart';

class Language extends StatelessWidget {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text("Change Language"),
        CircleAvatar(),
        CircleAvatar(),
        CircleAvatar(),
      ],
    );
  }
}
