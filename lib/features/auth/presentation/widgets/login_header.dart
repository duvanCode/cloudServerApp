import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:cloudserver/shared/constants/app_dimensions.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.cloud,
          color: AppColors.primaryBlue,
          size: AppDimensions.iconSizeLarge,
        ),
        SizedBox(width: AppDimensions.paddingSmall),
        Text(
          'Cloud Server',
          style: TextStyle(
            color: AppColors.primaryBlue,
            fontSize: AppDimensions.fontSizeLarge,
          ),
        ),
      ],
    );
  }
}