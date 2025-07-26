import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/notification_item.dart';

abstract class NotificationRepository {
  Future<Either<Failure, void>> scheduleNotification(NotificationItem item);
}
