part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class PinSubmitted extends AuthEvent {
  final String pin;
  const PinSubmitted(this.pin);

  @override
  List<Object?> get props => [pin];
}
