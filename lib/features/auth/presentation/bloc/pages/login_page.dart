import 'package:cloudserver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cloudserver/features/auth/presentation/bloc/auth_event.dart';
import 'package:cloudserver/features/auth/presentation/bloc/auth_state.dart';
import 'package:cloudserver/features/auth/presentation/widgets/login_header.dart';
import 'package:cloudserver/features/auth/presentation/widgets/login_form.dart';
import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:cloudserver/shared/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ValueNotifier<bool> isChecked = ValueNotifier(false);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/home',arguments: state.user);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(AppDimensions.paddingMedium),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthHeader(),
                SizedBox(height: AppDimensions.paddingMedium),
                LoginForm(
                  formKey:formKey,
                  emailController: emailController,
                  passwordController: passwordController,
                  isChecked: isChecked,
                  onSubmit: () {
                   if (formKey.currentState!.validate()) {
                      LoginRequested loginData = LoginRequested(
                          email: emailController.text,
                          password: passwordController.text
                          //rememberMe: isChecked.value,
                        );
                      BlocProvider.of<AuthBloc>(context).add(
                         loginData
                      );
                    } 
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
