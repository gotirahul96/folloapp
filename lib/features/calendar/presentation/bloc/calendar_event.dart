part of 'calendar_bloc.dart';

abstract class CalendarBlocEvent extends Equatable {
  const CalendarBlocEvent();

  @override
  List<Object?> get props => [];
}

class ScheduleCalendar extends CalendarBlocEvent {
  final CalendarEvent event;
  const ScheduleCalendar(this.event);

  @override
  List<Object?> get props => [event];
}
