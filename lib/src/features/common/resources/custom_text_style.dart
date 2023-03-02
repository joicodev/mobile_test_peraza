import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle caption([FontWeight fontWeight = FontWeight.w600]) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: TypographyFontSizes.xSmall,
    );
  }

  static TextStyle medium([FontWeight fontWeight = FontWeight.w600]) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: TypographyFontSizes.medium,
    );
  }

  static TextStyle large([FontWeight fontWeight = FontWeight.w600]) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: TypographyFontSizes.large,
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
  static const large = 24.0;

  TypographyFontSizes._();
}
