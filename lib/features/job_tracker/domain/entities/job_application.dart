class JobApplication {
  final String id;
  final String company;
  final String position;
  final DateTime appliedOn;
  final JobStatus status;

  JobApplication({
    required this.id,
    required this.company,
    required this.position,
    required this.appliedOn,
    this.status = JobStatus.applied,
  });
}

enum JobStatus { applied, interview, offer, rejected }
