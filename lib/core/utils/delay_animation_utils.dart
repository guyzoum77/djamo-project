import 'dart:async';

import 'package:flutter/cupertino.dart';

class DelayAnimation extends StatefulWidget {
  final Widget child;
  final int delay;
  const DelayAnimation({Key? key, required this.child, required this.delay}) : super(key: key);

  @override
  State<DelayAnimation> createState() => _DelayAnimationState();
}

class _DelayAnimationState extends State<DelayAnimation>  with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animOffset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    final curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    _animOffset = Tween<Offset>(
      begin: const Offset(0.0, -0.35),
      end: Offset.zero,
    ).animate(curve);

    Timer(Duration(milliseconds: widget.delay), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: SlideTransition(
        position: _animOffset,
        child: widget.child,
      ),
    );
  }
}
