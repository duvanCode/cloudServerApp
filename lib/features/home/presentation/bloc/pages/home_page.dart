import 'package:cloudserver/features/auth/domain/entities/user.dart';
import 'package:cloudserver/features/home/presentation/bloc/home_bloc.dart';
import 'package:cloudserver/features/home/presentation/bloc/home_state.dart';
import 'package:cloudserver/features/home/presentation/bloc/pages/app_bar_home.dart';
import 'package:cloudserver/features/home/presentation/bloc/pages/floating_action_button_home.dart';
import 'package:cloudserver/features/home/presentation/bloc/pages/search_form.dart';
import 'package:cloudserver/shared/constants/app_colors.dart';
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
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarHome(),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SearchFrom(userName: user.name)
              ],
            );
        },
      ),
      floatingActionButton:FloatingActionButtonHome()
    );
  }
}
