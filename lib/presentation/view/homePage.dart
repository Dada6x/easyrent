import 'package:easyrent/presentation/widgets/homeappbar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homePageAppbar(),
      body: const Center(child: Text("HOME")),
    );
  }
}
