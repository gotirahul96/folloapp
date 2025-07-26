import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/calendar_event.dart';

abstract class CalendarRepository {
  Future<Either<Failure, void>> addCalendarEvent(CalendarEvent event);
}
