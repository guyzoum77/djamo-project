import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors_utils.dart';

class TaskCardWidget extends StatefulWidget {
  final double? containerWidth;
  final double containerHeight;
  final double marginLeft;
  final double marginRight;
  final double marginTop;
  final double marginBottom;
  final double radius;
   BoxBorder? border;
  final double boxShadowSpreadRadius;
  final double boxShadowBlurRadius;
  final double offsetLeft;
  final double offsetRight;
  final Widget? child;

   TaskCardWidget({super.key,
    this.containerWidth,
    required this.containerHeight,
    required this.marginLeft,
    required this.marginRight,
    required this.marginTop,
    required this.marginBottom,
    required this.radius,
    this.border,
    required this.child,
    required this.boxShadowSpreadRadius,
    required this.boxShadowBlurRadius,
    required this.offsetLeft,
    required this.offsetRight,
  });

  @override
  State<TaskCardWidget> createState() => _TaskCardWidgetState();
}

class _TaskCardWidgetState extends State<TaskCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: widget.containerWidth,
          height: widget.containerHeight,
          margin: EdgeInsets.only(left: widget.marginLeft, right: widget.marginRight, bottom: widget.marginBottom, top: widget.marginTop),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            color: AppColorsUtils.kWhiteColor,
            border: widget.border,
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(.1),
                spreadRadius: widget.boxShadowSpreadRadius,
                blurRadius: widget.boxShadowBlurRadius,
                offset: Offset(widget.offsetLeft, widget.offsetRight),
              )
            ]
          ),
          child: widget.child,
        )
      ],
    );
  }
}
