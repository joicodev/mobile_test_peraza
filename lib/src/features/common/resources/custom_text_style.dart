import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle caption([FontWeight fontWeight = FontWeight.w600]) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: TypographyFontSizes.xSmall,
    );
  }

  static TextStyle paragraphRegular() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: TypographyFontSizes.medium,
    );
  }

  static TextStyle paragraphBold() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: TypographyFontSizes.medium,
    );
  }

  static TextStyle content([FontWeight fontWeight = FontWeight.w600]) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: TypographyFontSizes.smallest,
    );
  }
}

class TypographyFontSizes {
  static const xSmall = 9.0;
  static const smallest = 12.0;
  static const xMedium = 14.0;
  static const medium = 16.0;
  static const xLarge = 18.0;
  static const large = 20.0;

  TypographyFontSizes._();
}
