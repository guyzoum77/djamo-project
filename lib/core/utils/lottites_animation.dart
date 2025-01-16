import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatefulWidget {
  final double widthLottie;
  final String lottieAsset;
  final String textContent;
  final double? sizedBoxWidth;
  final Color? textStyleColors;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? containerWidth;
  final double? containerHeight;
  final EdgeInsetsGeometry? margin;

  const LottieWidget({
    Key? key,
    required this.widthLottie,
    required this.lottieAsset,
    required this.textContent,
    this.sizedBoxWidth,
    this.textStyleColors,
    this.fontWeight,
    this.fontSize,
    this.containerWidth,
    this.containerHeight,
    this.margin
  }) : super(key: key);

  @override
  State<LottieWidget> createState() => _LottieWidgetState();
}

class _LottieWidgetState extends State<LottieWidget> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          Container(
            width: widget.containerWidth,
            height: widget.containerHeight,
            margin: widget.margin,
            child: Lottie.asset(
              widget.lottieAsset,
              fit: BoxFit.cover,
              width: widget.widthLottie,
              controller: _controller,
              onLoaded: (composition) {
                _controller..duration = composition.duration..forward();
              },
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: widget.sizedBoxWidth,
                  child: Text(
                    widget.textContent,
                    style: TextStyle(
                      color: widget.textStyleColors,
                      fontFamily: "Nunito",
                      fontSize: widget.fontSize,
                      fontWeight: widget.fontWeight
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class LottieDataWidget extends StatefulWidget {
  final double widthLottie;
  final String lottieAsset;
  final double? containerWidth;
  final double? containerHeight;
  final EdgeInsetsGeometry? margin;

  const LottieDataWidget({
    Key? key,
    required this.widthLottie,
    required this.lottieAsset,
    this.containerWidth,
    this.containerHeight,
    this.margin
  }) : super(key: key);

  @override
  State<LottieDataWidget> createState() => _LottieDataWidgetState();
}

class _LottieDataWidgetState extends State<LottieDataWidget> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: widget.containerWidth,
      height: widget.containerHeight,
      margin: widget.margin,
      child: Lottie.asset(
        widget.lottieAsset,
        fit: BoxFit.cover,
        width: widget.widthLottie,
      ),
    );
  }
}

