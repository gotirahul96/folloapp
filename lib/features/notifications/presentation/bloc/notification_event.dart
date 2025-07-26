part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object?> get props => [];
}

class AddNotification extends NotificationEvent {
  final NotificationItem item;
  const AddNotification(this.item);

  @override
  List<Object?> get props => [item];
}
