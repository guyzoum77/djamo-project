import 'package:djamo_test/features/onboarding/presentation/widget/onboarding_action_button_widget.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors_utils.dart';
import '../../data/models/onboarding_model.dart';

class PageViewBuilderWidget {
  static Widget builder(BuildContext context,
                        PageController pageController,
                        int itemCountLength,
                        int currentPage,
                        void Function(void Function() fn) setState,
                        List<OnBoardingModel> pages) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: itemCountLength,
        onPageChanged: (int idx) {
          print("currentPage on onPageChanged is $currentPage");
          setState(() {
            currentPage = idx;
          });
        },
        itemBuilder: (BuildContext context, int idx) {
          final item = pages[idx];
          print("currentPage is ${currentPage}");
          print("pages.length is ${pages.length}");

          return Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 75),
              currentPage == pages.length - 1
              ? Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: OnBoardingActionButtonWidget.skipButton(
                      "Passer",
                      () { },
                      AppColorsUtils.kPrimaryColor,
                      FontWeight.w600,
                      TextDecoration.underline,
                      AppColorsUtils.kSecondaryMediumLightColor,
                      4.0
                    )
                  )
                ],
              )
              : const SizedBox.shrink(),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: item.imageUrl
                ),
              ),
              Expanded(
                  flex: 1,
                  child: currentPage != pages.length - 1
                    ? Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                              item.title,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                                color: currentPage == pages.length - 1 ? item.textColor : AppColorsUtils.kPrimaryColor,
                              )
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 280),
                          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                          child: Text(
                            item.description,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: currentPage == pages.length - 1 ? item.textColor : AppColorsUtils.kPrimaryColor,
                              fontFamily: 'Nunito',
                            )
                          ),
                        )
                      ]
                  )
                  : Column(
                    children: [
                      currentPage == pages.length - 1 ? SizedBox(height: MediaQuery.of(context).size.height / 75 ) : const SizedBox(),
                      Container(
                        constraints: const BoxConstraints(maxWidth: 280),
                        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                        child: Text(item.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: currentPage == pages.length - 1 ? item.textColor : AppColorsUtils.kPrimaryColor,
                              fontFamily: 'Nunito',
                            )
                        ),
                      )
                    ],
                  )
              )
            ],
          );
        },
      ),
    );
  }
}