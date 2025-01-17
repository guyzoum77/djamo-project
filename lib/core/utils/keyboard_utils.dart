import 'package:flutter/material.dart';

class KeyboardUtils {
  static void close() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}