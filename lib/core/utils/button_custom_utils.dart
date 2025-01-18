import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.name,
    required this.onPressed,
    this.textStyle,
    this.color,
    this.backgroundColor,
    required this.minimumSize
  });

  final String name;
  final TextStyle? textStyle;
  final Color? color;
  final double minimumSize;
  final Color? backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build (BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: Size.fromHeight(minimumSize),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w500,
          fontFamily: 'Nunito',
          color: color
        )
      ),
      child: Text(name, style: textStyle,),
    );
  }
}

class CustomOutlineButton extends StatelessWidget {
  const CustomOutlineButton({
    Key? key,
    required this.name,
    required this.backgroundColor,
    required this.borderSideColor,
    required this.primaryColor,
    required this.textColor,
    required this.minimumSize,
    required this.elevation,
    required this.fontSize,
    required this.onPressed,
    required this.borderRadius,
  });

  final String name;
  final Color backgroundColor;
  final Color borderSideColor;
  final Color primaryColor;
  final Color textColor;
  final double borderRadius;
  final double minimumSize;
  final double elevation;
  final double fontSize;
  final VoidCallback onPressed;

  @override
  Widget build (BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryColor, backgroundColor: backgroundColor,
        side: BorderSide(color: borderSideColor, width: 1),
        minimumSize: Size.fromHeight(minimumSize),
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.normal, fontFamily: 'Nunito'),
      ),
      onPressed: onPressed,
      child: Text(name, style: TextStyle(color: textColor),),
    );
  }
}

class CustomOutlineWithIconButton extends StatelessWidget {
  const CustomOutlineWithIconButton({
    Key? key,
    required this.name,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderSideColor,
    required this.onPressed,
    required this.icon,
    required this.minimumSize,
    required this.borderRadius,
    required this.iconSize,
  });

  final String name;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderSideColor;
  final double minimumSize;
  final double borderRadius;
  final VoidCallback onPressed;
  final IconData icon;
  final double iconSize;

  @override
  Widget build (BuildContext context) {
    final size = MediaQuery.of(context).size;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderSideColor, width: 1),
        minimumSize: Size.fromHeight(minimumSize),
        elevation: 0.3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, fontFamily: 'Nunito'),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(icon, size: iconSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Nunito',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconCustomOutlineButton extends StatelessWidget {
  const IconCustomOutlineButton({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.icon,
    required this.size,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderSideColor,
    required this.minimumSize,
  });

  final String name;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderSideColor;
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final double minimumSize;

  @override
  Widget build (BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderSideColor, width: 1),
        minimumSize: Size.fromHeight(minimumSize),
        elevation: 0.3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, fontFamily: 'Nunito'),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Icon(icon, size: size,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(name, style: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, fontFamily: 'Nunito'),),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageCustomOutlineButton extends StatelessWidget {
  const ImageCustomOutlineButton({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.icon,
    required this.size,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderSideColor,
    required this.minimumSize,
    required this.borderRadius,
  });

  final String name;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderSideColor;
  final VoidCallback onPressed;
  final String icon;
  final double size;
  final double minimumSize;
  final double borderRadius;

  @override
  Widget build (BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderSideColor, width: 1),
        minimumSize: Size.fromHeight(minimumSize),
        elevation: 0.3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, fontFamily: 'Nunito'),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Image.asset(icon, width: size),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, fontFamily: 'Nunito'),),
            ],
          ),
        ],
      ),
    );
  }
}

class IconCustomButton extends StatelessWidget {
  const IconCustomButton({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.icon,
    required this.size,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderSideColor,
    required this.minimumSize,
    required this.borderRadius,
  });

  final String name;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderSideColor;
  final VoidCallback onPressed;
  final IconData icon;
  final double size;
  final double minimumSize;
  final double borderRadius;

  @override
  Widget build (BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, size: size,),
              const SizedBox(width: 5),
              Text(name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, fontFamily: 'Nunito'),),
            ],
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderSideColor, width: 1),
        minimumSize: Size.fromHeight(minimumSize),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Nunito')
      ),
    );
  }
}

class CustomWhiteOutlineButton extends StatelessWidget {
  const CustomWhiteOutlineButton({
    Key? key,
    required this.name,
    required this.onPressed,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderSideColor,
    required this.textColor,
    required this.minimumSize,
    required this.borderRadius,
  });

  final String name;
  final Color foregroundColor;
  final Color backgroundColor;
  final Color borderSideColor;
  final Color textColor;
  final double minimumSize;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build (BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor,
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderSideColor, width: 1),
        minimumSize: Size.fromHeight(minimumSize),
        elevation: 0.3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.normal, fontFamily: 'Nunito', color: textColor),
      ),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(name, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.normal, fontFamily: 'Nunito'),),
            ],
          ),
        ],
      ),
    );
  }
}