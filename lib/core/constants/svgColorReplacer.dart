import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThemedSvgReplacer extends StatelessWidget {
  final String assetPath;
  final double height;
  final double width;
  // List of original colors (hex strings) to replace in the SVG
  final List<String> originalColors;

  // The new color to replace the original colors with
  final Color themeColor;

  const ThemedSvgReplacer({
    super.key,
    required this.assetPath,
    required this.themeColor,
    this.originalColors = const ['#0061FF', '#0061ff'],
    required this.height,
    required this.width,
  });

  String _colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }

  // Load SVG asset as string, replace all original colors with theme color (case-insensitive)
  Future<String> loadAndReplaceSvgColor() async {
    String rawSvg = await rootBundle.loadString(assetPath);
    final themeColorHex = _colorToHex(themeColor);

    // Build a case-insensitive regex to match all original color variants
    final regex = RegExp(
      originalColors.map(RegExp.escape).join('|'),
      caseSensitive: false,
    );

    rawSvg = rawSvg.replaceAll(regex, themeColorHex);

    return rawSvg;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: loadAndReplaceSvgColor(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || !snapshot.hasData) {
          return const Center(child: Text('Error loading SVG'));
        }

        return SvgPicture.string(
          height: height,
          width: width,
          snapshot.data!,
          fit: BoxFit.contain,
        );
      },
    );
  }
}
