import 'package:easyrent/presentation/views/profile/view/profile_pages/Faq/widgets/faq_item_widget.dart';
import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        FAQItem(
          question: "Why isn't my device displayed on the computer?",
          answer: 'idk man se the help center ',
        ),
        FAQItem(
          question:
              "Why does Windows tell me I don't have access permission after I change the access password?",
          answer:
              "Windows remembers the passwords of devices you've connected to before. If you can't access your device after changing the password, try the following:\n"
              "1. Change the device's display name. This will allow the computer to rediscover the device.\n"
              "2. Restart the computer and try again.",
        ),
        FAQItem(
          question:
              "Why does Windows tell me to check my spelling or tell me there is a network error?",
          answer: "NIgga shut the fuck up ",
        ),
        FAQItem(
          question: "Would You Rather ....",
          answer: "Yeah amma do it ",
        ),
      ],
    );
  }
}
