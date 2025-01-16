import 'package:flutter/material.dart';

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  final Duration duration = const Duration(milliseconds: 400);

  SlideRightRoute({required this.page, duration, RouteSettings? settings,}) :
    super(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child ) {
         return SlideTransition(
           position: Tween<Offset>(begin: const Offset(1, 0), end: Offset.zero,).animate(animation),
           child: page,
         );
      },
      settings: settings
    );

  @override
  Duration get transitionDuration => duration;
}

class ScaleTransitionRoute extends PageRouteBuilder {
  final Widget page;
  final Duration duration = const Duration(milliseconds: 400);

  ScaleTransitionRoute({required this.page, duration, RouteSettings? settings,}) :
    super(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child ) {
         return ScaleTransition(
           scale: CurvedAnimation (curve: Curves.decelerate, parent: animation),
           child: child,
         );
      },
      settings: settings
    );

  @override
  Duration get transitionDuration => duration;
}

class FadeTransitionRoute extends PageRouteBuilder {
  final Widget page;
  final Duration duration = const Duration(milliseconds: 500);

  FadeTransitionRoute({required this.page, duration, RouteSettings? settings,}) :
    super(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child ) {
         return FadeTransition(
           opacity: CurvedAnimation (curve: Curves.slowMiddle, parent: animation),
           child: child,
         );
      },
      settings: settings
    );

  @override
  Duration get transitionDuration => duration;
}

