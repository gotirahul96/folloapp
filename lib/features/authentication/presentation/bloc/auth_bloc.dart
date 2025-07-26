import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/login_with_pin.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithPin loginWithPin;
  AuthBloc({required this.loginWithPin}) : super(AuthInitial()) {
    on<PinSubmitted>(_onPinSubmitted);
  }

  Future<void> _onPinSubmitted(PinSubmitted event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final result = await loginWithPin(event.pin);
    result.fold(
      (failure) => emit(AuthFailure(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }
}
