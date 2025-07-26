import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/notification_item.dart';
import '../repositories/notification_repository.dart';

class ScheduleNotification implements UseCase<void, NotificationItem> {
  final NotificationRepository repository;
  ScheduleNotification(this.repository);

  @override
  Future<Either<Failure, void>> call(NotificationItem item) {
    return repository.scheduleNotification(item);
  }
}
