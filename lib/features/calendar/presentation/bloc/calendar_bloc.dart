import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/usecases/add_calendar_event.dart';
import '../../domain/entities/calendar_event.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarBlocEvent, CalendarBlocState> {
  final AddCalendarEvent addCalendarEvent;
  CalendarBloc({required this.addCalendarEvent}) : super(CalendarInitial()) {
    on<ScheduleCalendar>(_onSchedule);
  }

  Future<void> _onSchedule(ScheduleCalendar event, Emitter<CalendarBlocState> emit) async {
    emit(CalendarLoading());
    final result = await addCalendarEvent(event.event);
    result.fold(
      (failure) => emit(CalendarFailure(failure.message)),
      (_) => emit(CalendarScheduled()),
    );
  }
}
