import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCheckboxField extends StatefulWidget {
  final ValueNotifier<bool>? isChecked;
  CustomCheckboxField({Key? key, this.isChecked});

  @override
  _StateCustomCheckboxField createState() => _StateCustomCheckboxField();
}

class _StateCustomCheckboxField extends State<CustomCheckboxField> {
  bool get isChecked => widget.isChecked?.value ?? false;

  set isChecked(bool value) {
    setState(() {
      isChecked = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: isChecked,
      onChanged: (bool? value) {
        if (widget.isChecked != null && value != null) {
          widget.isChecked!.value = value;
        }
        setState(() {});
      },
      visualDensity: VisualDensity.compact,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      fillColor: WidgetStateProperty.resolveWith((states) {
        return this.isChecked ? AppColors.buttonBlue : AppColors.white;
      }),
    );
  }
}
