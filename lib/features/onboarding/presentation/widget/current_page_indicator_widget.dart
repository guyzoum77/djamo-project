import 'package:flutter/cupertino.dart';

import '../../../../core/utils/app_colors_utils.dart';
import '../../data/models/onboarding_model.dart';

class CurrentPageIndicatorWidget {
  static Widget indicator(int currentPage, List<OnBoardingModel> pages) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: pages.map((item) => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: currentPage == pages.indexOf(item) ? 30 : 8,
        height: 8,
        margin: const EdgeInsets.only(left: 2.0, right: 2.0, top: 2.0, bottom: 20),
        decoration: BoxDecoration(
          color: currentPage == pages.length - 1 && currentPage == pages.indexOf(item)
            ? AppColorsUtils.kPrimaryColor
            : currentPage == pages.indexOf(item)
            ? AppColorsUtils.kStrongGreyColor
            : currentPage == pages.length - 1
            ? AppColorsUtils.kWhiteColor
            : AppColorsUtils.kPrimaryColor,
          borderRadius: BorderRadius.circular(10.0)
        ),
      )).toList(),
    );
  }
}