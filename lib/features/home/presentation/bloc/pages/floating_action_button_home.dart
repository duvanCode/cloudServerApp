import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:cloudserver/shared/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonHome extends StatelessWidget {
  const FloatingActionButtonHome({super.key});
  
  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.buttonBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppDimensions.borderRadiusLarge,
            ),
          ),
          child: Icon(Icons.qr_code_scanner_rounded, color: AppColors.white),
        ),
      ],
    );
  }
}
