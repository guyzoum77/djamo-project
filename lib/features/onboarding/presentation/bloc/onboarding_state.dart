part of 'onboarding_bloc.dart';

sealed class OnboardingState extends Equatable {
  const OnboardingState();
}

final class OnboardingInitial extends OnboardingState {
  @override
  List<Object> get props => [];
}
