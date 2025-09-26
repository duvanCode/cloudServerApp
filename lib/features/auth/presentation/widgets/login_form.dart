import 'package:cloudserver/core/widgets/inputs/custom_checkbox_field.dart';
import 'package:cloudserver/core/widgets/inputs/custom_submit_field.dart';
import 'package:cloudserver/core/widgets/inputs/custom_text_field.dart';
import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:cloudserver/shared/constants/app_dimensions.dart';
import 'package:cloudserver/shared/utils/validators.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onSubmit;
  final ValueNotifier<bool> isChecked;

  const LoginForm({
    Key? key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.onSubmit,
    required this.isChecked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            hintText: 'Email',
            controller: emailController,
            validator: Validators.email,
            keyboardType: TextInputType.emailAddress,
            contentPadding: EdgeInsets.all(AppDimensions.paddingMedium),
          ),
          SizedBox(height: AppDimensions.paddingSmall),
          CustomTextField(
            hintText: 'Password',
            controller: passwordController,
            validator: Validators.password,
            obscureText: true,
            contentPadding: EdgeInsets.all(AppDimensions.paddingMedium),
          ),
          SizedBox(height: AppDimensions.paddingMedium),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomCheckboxField(
                    isChecked: isChecked,
                  ),
                  Text('Remember me', style: TextStyle(color: AppColors.white)),
                ],
              ),
              Text(
                'Forgot password?',
                style: TextStyle(color: AppColors.white),
              ),
            ],
          ),
          SizedBox(height: AppDimensions.paddingSmall),
          SizedBox(
            width: double.infinity,
            child: CustomSubmitField(
              child: Text('Submit', style: TextStyle(color: AppColors.white)),
              onPressed: onSubmit,
            ),
          ),
        ],
      ),
    );
  }
}
