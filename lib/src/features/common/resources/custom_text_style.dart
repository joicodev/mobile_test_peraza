import 'package:flutter/material.dart';

// Class containing custom styles for texts.
class CustomTextStyle {
  /*
    Returns a TextStyle object with caption style.
    @param FontWeight (default is FontWeight.w600).
    @return TextStyle object with caption style.
  */
  static TextStyle caption([FontWeight fontWeight = FontWeight.w600]) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: TypographyFontSizes.xSmall,
    );
  }

  /*
    Returns a TextStyle object with medium style.
    @param FontWeight (default is FontWeight.w600).
    @return TextStyle object with medium style.
  */
  static TextStyle medium([FontWeight fontWeight = FontWeight.w600]) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: TypographyFontSizes.medium,
    );
  }

  /*
    Returns a TextStyle object with large style.
    @param FontWeight (default is FontWeight.w700).
    @return TextStyle object with large style.
  */
  static TextStyle large([FontWeight fontWeight = FontWeight.w700]) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: TypographyFontSizes.large,
    );
  }

  /*
    Returns a TextStyle object with content style.
    @param FontWeight (default is FontWeight.w600).
    @return TextStyle object with content style.
  */
  static TextStyle content([FontWeight fontWeight = FontWeight.w600]) {
    return TextStyle(
      color: Colors.black,
      fontWeight: fontWeight,
      fontSize: TypographyFontSizes.smallest,
    );
  }
}

// Class that contains font size values for the application.
class TypographyFontSizes {
  static const xSmall = 9.0;
  static const smallest = 12.0;
  static const xMedium = 14.0;
  static const medium = 16.0;
  static const large = 24.0;

  // Private constructor to prevent instantiation of this class.
  TypographyFontSizes._();
}
