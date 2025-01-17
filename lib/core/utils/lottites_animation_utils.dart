import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidgetUtils extends StatefulWidget {
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

  const LottieWidgetUtils({
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
  State<LottieWidgetUtils> createState() => _LottieWidgetUtilsState();
}

class _LottieWidgetUtilsState extends State<LottieWidgetUtils> with TickerProviderStateMixin {
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

class LottieDataWidgetUtils extends StatefulWidget {
  final double widthLottie;
  final String lottieAsset;
  final double? containerWidth;
  final double? containerHeight;
  final EdgeInsetsGeometry? margin;

  const LottieDataWidgetUtils({
    Key? key,
    required this.widthLottie,
    required this.lottieAsset,
    this.containerWidth,
    this.containerHeight,
    this.margin
  }) : super(key: key);

  @override
  State<LottieDataWidgetUtils> createState() => _LottieDataWidgetUtilsState();
}

class _LottieDataWidgetUtilsState extends State<LottieDataWidgetUtils> {

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: widget.containerWidth,
          height: widget.containerHeight,
          margin: widget.margin,
          child: Lottie.asset(
            widget.lottieAsset,
            fit: BoxFit.cover,
            width: widget.widthLottie,
          ),
        )
      ],
    );
  }
}

