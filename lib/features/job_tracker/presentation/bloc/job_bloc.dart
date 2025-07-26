import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/job_application.dart';
import '../../domain/usecases/get_applications.dart';
import '../../../../core/usecases/usecase.dart';

part 'job_event.dart';
part 'job_state.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final GetApplications getApplications;
  JobBloc({required this.getApplications}) : super(JobInitial()) {
    on<LoadJobs>(_onLoadJobs);
  }

  Future<void> _onLoadJobs(LoadJobs event, Emitter<JobState> emit) async {
    emit(JobLoading());
    final result = await getApplications(NoParams());
    result.fold(
      (failure) => emit(JobFailure(failure.message)),
      (jobs) => emit(JobLoaded(jobs)),
    );
  }
}
