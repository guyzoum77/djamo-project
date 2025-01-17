import 'package:flutter/material.dart';

class OnBoardingActionButtonWidget {
  static Widget startButton(BuildContext context,
      String name,
      VoidCallback onPressed,
      Color? color,
      Color? splashColor,
      Color? textColor,
      double containerMarginBottom,
      double containerPaddingLeft,
      double containerPaddingRight,
      double containerWidth,
      double containerHeight,
      double buttonPaddingLeft,
      double buttonPaddingRight,
      double buttonHeight) {
    return Container(
      margin: EdgeInsets.only(bottom: containerMarginBottom),
      padding: EdgeInsets.only(left: containerPaddingLeft, right: containerPaddingRight),
      width: containerWidth,
      height: containerHeight,
      child: MaterialButton (
        padding: EdgeInsets.only(left: buttonPaddingLeft, right: buttonPaddingRight),
        height: buttonHeight,
        onPressed: onPressed,
        color: color,
        textColor: textColor,
        splashColor: splashColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(name),
            ),
          ],
        ),
      ),
    );
  }

  static Widget skipButton(
      String name,
      VoidCallback onPressed, 
      Color color,
      FontWeight fontWeight, 
      TextDecoration? underline,
      Color splashColor,
      double paddingAllSide) {
    return InkWell(
      splashColor: splashColor,
      onTap: onPressed,
      child: Padding(
          padding: EdgeInsets.all(paddingAllSide),
          child:Text(name, style: TextStyle(fontFamily: 'Nunito', color: color, fontWeight: fontWeight, decoration: underline))
      ),
    );
  }
  
  static Widget button(String name,
      Color color,
      Color textColor,
      Color splashColor,
      VoidCallback onPressed,
      double paddingLeft,
      double paddingRight) {
    return MaterialButton (
      padding: EdgeInsets.only(left: paddingLeft, right: paddingRight),
      height: 35,
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      splashColor: splashColor,
      child: Text(name),
    );
  }
}
