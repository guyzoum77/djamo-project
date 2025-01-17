import 'package:djamo_test/features/onboarding/presentation/widget/action_bottom_button_widget.dart';
import 'package:djamo_test/features/onboarding/presentation/widget/current_page_indicator_widget.dart';
import 'package:djamo_test/features/onboarding/presentation/widget/pageView_builder_widget.dart';
import 'package:flutter/material.dart';

import '../../data/models/onboarding_model.dart';

class AnimatedContainerWidget {
  static Widget content(BuildContext context, Color bgColor, PageController pageController, int itemCountLength, int currentPage,
      void Function(void Function() fn) setState, List<OnBoardingModel> pages, VoidCallback? onFinish) {

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      color: bgColor,
      child: SafeArea(
        child: Column(
          children: [
            PageViewBuilderWidget.builder(context, pageController, itemCountLength, currentPage, setState, pages),
            CurrentPageIndicatorWidget.indicator(currentPage, pages),
            ActionBottomButtonWidget.button(context, pageController, currentPage, pages, onFinish),
          ],
        ),
      ),
    );
  }
}