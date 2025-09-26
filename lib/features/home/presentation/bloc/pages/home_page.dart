import 'package:cloudserver/core/widgets/inputs/custom_text_field.dart';
import 'package:cloudserver/features/home/presentation/bloc/home_bloc.dart';
import 'package:cloudserver/features/home/presentation/bloc/home_state.dart';
import 'package:cloudserver/shared/constants/app_colors.dart';
import 'package:cloudserver/shared/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        toolbarHeight:0,
        backgroundColor: AppColors.inputBackground,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppDimensions.paddingSmall),
                  color: AppColors.inputBackground,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          hintText: 'Search Clound',
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: AppColors.white,
                          widthBorder:1,
                          contentPadding: EdgeInsets.symmetric(vertical: AppDimensions.paddingSmall),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(
                          AppDimensions.paddingSmall,
                        ),
                        child: Text(
                          '0GB',
                          style: TextStyle(color: AppColors.primaryBlue),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          overlayColor: WidgetStateProperty.all(
                            AppColors.overlayColor,
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(1.0),
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(
                              AppDimensions.borderRadiusLarge,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: AppColors.blueGrey,
                            child: Text(
                              'DY',
                              style: TextStyle(color: AppColors.primaryBlue),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.buttonBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLarge),
            ),
            child: Icon(Icons.qr_code_scanner_rounded, color: AppColors.white),
          ),
        ],
      ),
    );
  }
}
