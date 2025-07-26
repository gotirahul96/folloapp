part of 'calendar_bloc.dart';

abstract class CalendarBlocState extends Equatable {
  const CalendarBlocState();

  @override
  List<Object?> get props => [];
}

class CalendarInitial extends CalendarBlocState {}

class CalendarLoading extends CalendarBlocState {}

class CalendarScheduled extends CalendarBlocState {}

class CalendarFailure extends CalendarBlocState {
  final String message;
  const CalendarFailure(this.message);

  @override
  List<Object?> get props => [message];
}
