import 'package:djamo_test/core/utils/app_colors_utils.dart';
import 'package:djamo_test/core/utils/lottites_animation_utils.dart';
import 'package:flutter/material.dart';

import '../../data/models/onboarding_model.dart';



List<OnBoardingModel> onboardingPages = [
  OnBoardingModel(
      title: 'Meeting',
      description: 'Enjoy to Meet and date with people all around the world',
      imageUrl: const LottieDataWidgetUtils(
        widthLottie: 350,
        lottieAsset: "images/lotties/task_management_1.json",
      ),
      bgColor: AppColorsUtils.kWhiteColor
  ),
  OnBoardingModel(
      title: 'Choice',
      description: 'Choose the people you like and meet with them in person',
      imageUrl: const LottieDataWidgetUtils(
        widthLottie: 350,
        lottieAsset: "images/lotties/task-manager-step-2.json",
      ),
      bgColor: AppColorsUtils.kWhiteColor
  ),
  OnBoardingModel(
    title: 'Create your first date',
    description: '',
    imageUrl: const LottieDataWidgetUtils(
      widthLottie: 300,
      lottieAsset: "images/lotties/task-manager-step-3.json",
    ),
    bgColor: AppColorsUtils.kStrongGreyColor.withOpacity(0.8),
  ),
];