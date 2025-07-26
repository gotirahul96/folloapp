import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/job_application.dart';
import '../repositories/job_repository.dart';

class GetApplications implements UseCase<List<JobApplication>, NoParams> {
  final JobRepository repository;
  GetApplications(this.repository);

  @override
  Future<Either<Failure, List<JobApplication>>> call(NoParams params) {
    return repository.fetchApplications();
  }
}
