import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors_utils.dart';
import '../../data/models/onboarding_model.dart';
import 'onboarding_action_button_widget.dart';

class ActionBottomButtonWidget {
  static Widget button(BuildContext context, PageController pageController, int currentPage, List<OnBoardingModel> pages, VoidCallback? onFinish) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height / 15,
      child: currentPage == pages.length - 1
        ? Row(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10, bottom: 2),
                child:  OnBoardingActionButtonWidget.startButton(
                    context,
                    "Commençons",
                        () { },
                    AppColorsUtils.kPrimaryColor,
                    AppColorsUtils.kSecondaryLightColor,
                    AppColorsUtils.kWhiteColor,
                    size.height / 10,
                    size.height / 20,
                    size.height / 20,
                    size.width / 1.5,
                    size.height / 40,
                    size.width / 30,
                    size.width / 30,
                    size.height / 50
                )
            )
          ],
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 10),
                child: OnBoardingActionButtonWidget.skipButton(
                    currentPage == pages.length - 1 ? '' : 'Passer',
                    () {
                      pageController.animateToPage(pages.length - 1, duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
                    },
                    AppColorsUtils.kPrimaryColor,
                    FontWeight.w600,
                    TextDecoration.underline,
                    AppColorsUtils.kSecondaryMediumLightColor,
                    4.0
                )
            ),
            Container(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(
                  style: TextButton.styleFrom(
                      visualDensity: VisualDensity.comfortable,
                      backgroundColor: Colors.transparent,
                      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                  ),
                  onPressed: () {
                    if (currentPage == pages.length - 1) {
                      onFinish?.call();
                    } else {
                      pageController.animateToPage(currentPage + 1, curve: Curves.easeInOutCubic, duration: const Duration(milliseconds: 250));
                    }
                  },
                  child: Row(
                    children: [
                      currentPage == pages.length - 1
                        ? const SizedBox.shrink()
                        : OnBoardingActionButtonWidget.button(
                        'Suivant',
                        AppColorsUtils.kPrimaryColor,
                        AppColorsUtils.kWhiteColor,
                        AppColorsUtils.kPrimaryColor,
                        () {
                          pageController.nextPage(duration: const Duration(milliseconds: 600), curve: Curves.easeInOut);
                        },
                        size.width / 30,
                        size.width / 30,
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
    );
  }
}