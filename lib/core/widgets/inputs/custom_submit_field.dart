import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSubmitField extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;

  const CustomSubmitField({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.buttonBlue),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
