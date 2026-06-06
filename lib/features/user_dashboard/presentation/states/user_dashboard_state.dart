import 'package:equatable/equatable.dart';

abstract class UserDashboardState extends Equatable {
  const UserDashboardState();

  @override
  List<Object> get props => [];
}

class UserDashboardInitial extends UserDashboardState {}

class UserDashboardLoading extends UserDashboardState {}

class UserDashboardSuccess extends UserDashboardState {}

class UserDashboardFailure extends UserDashboardState {
  final String message;

  const UserDashboardFailure(this.message);

  @override
  List<Object> get props => [message];
}
