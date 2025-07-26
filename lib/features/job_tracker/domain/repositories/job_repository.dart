import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/job_application.dart';

abstract class JobRepository {
  Future<Either<Failure, List<JobApplication>>> fetchApplications();
  Future<Either<Failure, void>> addApplication(JobApplication application);
  Future<Either<Failure, void>> updateApplication(JobApplication application);
}
