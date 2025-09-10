import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckboxField extends StatefulWidget {
  CustomCheckboxField({Key? key});

  @override
  _StateCustomCheckboxField createState() => _StateCustomCheckboxField();
}

class _StateCustomCheckboxField extends State<CustomCheckboxField> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _value,
      onChanged: (bool? value) {
        setState(() {});
        _value = value ?? false;
      },
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.resolveWith((states) {
        return _value
            ? AppColors.buttonBlue
            : AppColors.white;
      }),
    );
  }
}
