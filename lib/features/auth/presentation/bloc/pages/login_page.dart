import 'package:cloudserver/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:cloudserver/features/auth/presentation/bloc/auth_state.dart';
import 'package:cloudserver/features/auth/presentation/widgets/login_header.dart';
import 'package:cloudserver/features/auth/presentation/widgets/login_form.dart';
import 'package:cloudserver/shared/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 41, 55, 1),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            Navigator.pushReplacementNamed(context, '/home');
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(child: CircularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthHeader(),
                SizedBox(height: AppDimensions.paddingMedium),
                LoginForm(
                  formKey: GlobalKey(),
                  emailController: TextEditingController(),
                  passwordController: TextEditingController(),
                  onSubmit: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
