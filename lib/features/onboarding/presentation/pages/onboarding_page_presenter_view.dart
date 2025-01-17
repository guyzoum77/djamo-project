import 'package:djamo_test/features/onboarding/data/models/onboarding_model.dart';
import 'package:djamo_test/features/onboarding/presentation/widget/animated_container_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingPagePresenterView extends StatefulWidget {
  final List<OnBoardingModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnBoardingPagePresenterView({super.key, required this.pages, this.onSkip, this.onFinish});

  @override
  State<OnBoardingPagePresenterView> createState() => _OnBoardingPagePresenterViewState();
}

class _OnBoardingPagePresenterViewState extends State<OnBoardingPagePresenterView> {
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;


    return Scaffold(
      body: AnimatedContainerWidget.content(
        context, widget.pages[currentPage].bgColor, pageController, widget.pages.length, currentPage, setState, widget.pages, widget.onFinish
      )
    );
  }
}
