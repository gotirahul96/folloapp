part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object?> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationScheduled extends NotificationState {}

class NotificationFailure extends NotificationState {
  final String message;
  const NotificationFailure(this.message);

  @override
  List<Object?> get props => [message];
}
