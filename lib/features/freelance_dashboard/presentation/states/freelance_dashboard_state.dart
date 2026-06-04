import 'package:equatable/equatable.dart';

abstract class FreelanceDashboardState extends Equatable {
  const FreelanceDashboardState();

  @override
  List<Object> get props => [];
}

class FreelanceDashboardInitial extends FreelanceDashboardState {}

class FreelanceDashboardLoading extends FreelanceDashboardState {}

class FreelanceDashboardSuccess extends FreelanceDashboardState {}

class FreelanceDashboardFailure extends FreelanceDashboardState {
  final String message;

  const FreelanceDashboardFailure(this.message);

  @override
  List<Object> get props => [message];
}
