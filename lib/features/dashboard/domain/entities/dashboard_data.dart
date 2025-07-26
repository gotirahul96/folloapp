import '../../job_tracker/domain/entities/job_application.dart';

class DashboardData {
  final List<JobApplication> applications;
  const DashboardData({required this.applications});
}
