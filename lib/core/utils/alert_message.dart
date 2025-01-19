import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
showAlertMessageSnackbar(IconData icon, Color iconColor, String message, AlertType type, backgroundColor, Duration duration) {
  ScaffoldMessenger.of(this).hideCurrentSnackBar();
  return ScaffoldMessenger.of(this).showSnackBar(
    SnackBar(
      content: _AlertMessage(
        icon: icon,
        iconColor: iconColor,
        alertMessage: message,
        alertType: type,
      ),
      behavior: SnackBarBehavior.fixed,
      backgroundColor: backgroundColor,
      elevation: 0,
      duration: duration,
    ),
  );
 }
}

class _AlertMessage extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String alertMessage;
  final AlertType alertType;
  const _AlertMessage({
    Key? key,
    required this.icon,
    required this.iconColor,
    required this.alertMessage,
    required this.alertType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5),
        SizedBox(
          width: size.width / 1.29,
          child: Text(alertMessage, maxLines: 1),
        )
      ],
    );
  }
}

enum AlertType { error, warning, success, info, primary, danger, detail }