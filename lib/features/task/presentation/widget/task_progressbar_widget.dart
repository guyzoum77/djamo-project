import 'package:djamo_test/core/utils/app_colors_utils.dart';
import 'package:flutter/material.dart';

class TaskProgressBarWidget extends StatefulWidget {
  final String taskPercent;
  final double progressIndicatorValue;
  final Color progressBarColor;
  final Color progressBackgroundColor;
  final Color textColor;
  final double fontSize;
  final double progressBarHeight;
  final double progressBarWidth;

  const TaskProgressBarWidget({super.key,
    required this.taskPercent,
    required this.progressIndicatorValue,
    required this.progressBarColor,
    required this.progressBackgroundColor,
    required this.textColor,
    required this.fontSize,
    required this.progressBarHeight,
    required this.progressBarWidth
  });

  @override
  State<TaskProgressBarWidget> createState() => _TaskProgressBarWidgetState();
}

class _TaskProgressBarWidgetState extends State<TaskProgressBarWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
              ),
              height: widget.progressBarHeight,
              width: widget.progressBarWidth,
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Positioned.fill(
                    child: LinearProgressIndicator(
                      //Here you pass the percentage
                      value: widget.progressIndicatorValue,
                      color: widget.progressBarColor,
                      backgroundColor: widget.progressBackgroundColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  Center(
                    child: Text(
                      widget.taskPercent,
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: widget.fontSize,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
