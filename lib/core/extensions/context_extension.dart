import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // GET SCREEN SIZE
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get appbarSize => 56;

  //GET THEMEMODE
  bool isDarkMode() {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }

  //PADDING
  EdgeInsets get p0 => EdgeInsets.zero;
  EdgeInsets get p10 => const EdgeInsets.all(10);
  EdgeInsets get pv20 => const EdgeInsets.symmetric(vertical: 20);
  EdgeInsets get por10 => const EdgeInsets.only(right: 10);
}
