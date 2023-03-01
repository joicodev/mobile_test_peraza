import 'package:flutter/material.dart';

class CustomTextStyle {
  /// Convert the color to a darken color based on the [percent]
  static TextStyle contentTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: TypographyFontSizes.smallest,
    );
  }

  static TextStyle captionTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: TypographyFontSizes.xSmall,
    );
  }

  static TextStyle paragraphRegular() {
    return const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w600,
      fontSize: TypographyFontSizes.medium,
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
