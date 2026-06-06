import 'package:equatable/equatable.dart';
import 'package:dipe_freelance/core/errors/failures.dart';

abstract class FreelancerState extends Equatable {
  const FreelancerState();

  @override
  List<Object?> get props => [];
}

class FreelancerInitial extends FreelancerState {}

class FreelancerLoading extends FreelancerState {}

class FreelancerSuccess extends FreelancerState {}

class FreelancerFailure extends FreelancerState {
  final Failure failure;

  const FreelancerFailure(this.failure);

  @override
  List<Object?> get props => [failure];
}

class AnalyticsLoading extends FreelancerState {}

class AnalyticsLoaded extends FreelancerState {}
