// core/di/injection.dart
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Importar todas las dependencias de Auth
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // ===== 1. SERVICIOS EXTERNOS PRIMERO =====
  await _initExternalServices();
  
  // ===== 2. FEATURES =====
  _initAuth();
  // _initHome(); // Cuando tengas el feature Home
}

// ===== CONFIGURACIÓN DE SERVICIOS EXTERNOS =====
Future<void> _initExternalServices() async {
  // Dio para HTTP requests
  getIt.registerLazySingleton<Dio>(() {
    final dio = Dio();
    dio.options.baseUrl = 'https://tu-api.com/api/'; // Cambia por tu URL
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
    
    // Opcional: Interceptors para logging
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (obj) => print('[DIO] $obj'),
    ));
    
    return dio;
  });
  
  // SharedPreferences para storage local
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
}

// ===== CONFIGURACIÓN DE AUTH FEATURE =====
void _initAuth() {
  // 📡 DATA SOURCES
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: getIt<Dio>()),
  );
  
  // 🏪 REPOSITORY
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
    ),
  );
  
  // 🎯 USE CASES
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<AuthRepository>()),
  );
  
  // 🎨 BLOC
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUseCase: getIt<LoginUseCase>(),
    ),
  );
}