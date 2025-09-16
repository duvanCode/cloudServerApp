import 'package:cloudserver/features/auth/domain/usecases/login_usecase.dart';
import 'package:cloudserver/features/auth/presentation/bloc/auth_event.dart';
import 'package:cloudserver/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  AuthBloc({required this.loginUseCase}) : super(AuthInitial()) {
    on<LoginRequested>(_onLoginRequested);
  }

  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthError(message: 'Error de login')),
      (user) => emit(AuthSuccess(user: user)),
    );
  }
}
