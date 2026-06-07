import 'package:dipe_freelance/features/client/domain/entities/project_entity.dart';

abstract class UserDashboardState {}

class UserDashboardInitial extends UserDashboardState {}

class UserDashboardLoading extends UserDashboardState {}

class UserDashboardSuccess extends UserDashboardState {
  final String userName;
  final double totalSpent;
  final double monthlyChange;
  final int inProgress;
  final int completed;
  final int pending;
  final List<ProjectEntity> recentProjects;

  UserDashboardSuccess({
    required this.userName,
    required this.totalSpent,
    required this.monthlyChange,
    required this.inProgress,
    required this.completed,
    required this.pending,
    required this.recentProjects,
  });
}

class UserDashboardFailure extends UserDashboardState {
  final String message;

  UserDashboardFailure({required this.message});
}
