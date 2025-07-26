import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/analytics_data.dart';
import '../repositories/analytics_repository.dart';

class GetAnalytics implements UseCase<AnalyticsData, NoParams> {
  final AnalyticsRepository repository;
  GetAnalytics(this.repository);

  @override
  Future<Either<Failure, AnalyticsData>> call(NoParams params) {
    return repository.fetchAnalytics();
  }
}
