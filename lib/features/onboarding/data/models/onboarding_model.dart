import 'package:flutter/material.dart';

class OnBoardingModel {
  final String title;
  final String description;
  final Widget imageUrl;
  final Color bgColor;
  final Color textColor;

  OnBoardingModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.bgColor = Colors.white,
    this.textColor = Colors.white
  });
}