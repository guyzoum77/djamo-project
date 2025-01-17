import 'package:djamo_test/features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'package:get_it/get_it.dart';

class InjectionContainerOnBoarding {
  static final sl = GetIt.instance;

  static void init() {
    sl.registerFactory(() => OnboardingBloc());
  }
}