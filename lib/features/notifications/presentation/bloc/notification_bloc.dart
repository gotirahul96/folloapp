import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/schedule_notification.dart';
import '../../domain/entities/notification_item.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final ScheduleNotification scheduleNotification;
  NotificationBloc({required this.scheduleNotification}) : super(NotificationInitial()) {
    on<AddNotification>(_onAdd);
  }

  Future<void> _onAdd(AddNotification event, Emitter<NotificationState> emit) async {
    emit(NotificationLoading());
    final result = await scheduleNotification(event.item);
    result.fold(
      (failure) => emit(NotificationFailure(failure.message)),
      (_) => emit(NotificationScheduled()),
    );
  }
}
