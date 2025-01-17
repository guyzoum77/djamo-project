import 'package:go_router/go_router.dart';

import 'features/onboarding/presentation/pages/onboarding_page.dart';

final router = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingPage()
    ),
  ]
);