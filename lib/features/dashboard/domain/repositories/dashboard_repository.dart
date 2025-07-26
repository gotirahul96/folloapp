import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/dashboard_data.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardData>> fetchDashboardData();
}
