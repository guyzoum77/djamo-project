import 'package:djamo_test/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:djamo_test/features/onboarding/presentation/pages/onboarding_page_presenter_view.dart';
import 'package:djamo_test/features/onboarding/presentation/widget/onboarding_page_content_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => sl<OnboardingBloc>(), child: OnBoardingPagePresenterView(pages: onboardingPages));
  }
}