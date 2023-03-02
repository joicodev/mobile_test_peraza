import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_test_peraza/src/features/common/extensions/widget_extension.dart';
import 'package:mobile_test_peraza/src/features/common/resources/custom_text_style.dart';

class CommonWidgets {
  static Widget buildLottieAsset(
    BuildContext context,
    String asset, [
    String? title,
    TextStyle? style,
  ]) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(asset).paddingBottom(10),
        if (title != null)
          Text(
            title,
            textAlign: TextAlign.center,
            style: style ?? CustomTextStyle.medium(),
          ),
      ],
    );
  }
}
