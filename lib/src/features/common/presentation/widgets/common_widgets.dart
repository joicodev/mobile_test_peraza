import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_test_peraza/src/features/common/resources/custom_text_style.dart';

class CommonWidgets {
  static Widget buildLottieAsset(
    BuildContext context,
    String asset, [
    String? title,
  ]) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 330, child: Lottie.asset(asset)),
        if (title != null)
          Text(
            title,
            textAlign: TextAlign.center,
            style: CustomTextStyle.paragraphBold(),
          ),
      ],
    );
  }
}
