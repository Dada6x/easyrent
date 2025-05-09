import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class panorama extends StatelessWidget {
  const panorama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("property Name "),
      ),
      body: Center(
        child: PanoramaViewer(
          child: Image.asset(
              'assets/images/2018_04_21_ES_Supernova_VT_Void-CC.jpg'),
        ),
      ),
    );
  }
}
