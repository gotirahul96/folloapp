part of 'job_bloc.dart';

abstract class JobState extends Equatable {
  const JobState();

  @override
  List<Object?> get props => [];
}

class JobInitial extends JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  final List<JobApplication> jobs;
  const JobLoaded(this.jobs);

  @override
  List<Object?> get props => [jobs];
}

class JobFailure extends JobState {
  final String message;
  const JobFailure(this.message);

  @override
  List<Object?> get props => [message];
}
