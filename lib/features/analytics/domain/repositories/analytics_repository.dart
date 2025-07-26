import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/analytics_data.dart';

abstract class AnalyticsRepository {
  Future<Either<Failure, AnalyticsData>> fetchAnalytics();
}
