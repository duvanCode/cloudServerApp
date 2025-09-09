// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection.dart';
import './features/auth/presentation/bloc/auth_bloc.dart';
import './features/auth/presentation/bloc/pages/login_page.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // ← AQUÍ SE INICIALIZAN TODAS LAS DEPENDENCIAS
  await initializeDependencies();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Mi App',
        routes: {
          '/': (context) => LoginPage()
        },
      ),
    );
  }
}