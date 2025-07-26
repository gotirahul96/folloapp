import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/calendar_event.dart';
import '../repositories/calendar_repository.dart';

class AddCalendarEvent implements UseCase<void, CalendarEvent> {
  final CalendarRepository repository;
  AddCalendarEvent(this.repository);

  @override
  Future<Either<Failure, void>> call(CalendarEvent event) {
    return repository.addCalendarEvent(event);
  }
}
