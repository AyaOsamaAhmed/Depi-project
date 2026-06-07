import 'package:equatable/equatable.dart';

abstract class ProjectLiveState extends Equatable {
  const ProjectLiveState();

  @override
  List<Object> get props => [];
}

class ProjectLiveInitial extends ProjectLiveState {}

class ProjectLiveLoading extends ProjectLiveState {}

class ProjectLiveSuccess extends ProjectLiveState {}

class ProjectLiveFailure extends ProjectLiveState {
  final String message;

  const ProjectLiveFailure(this.message);

  @override
  List<Object> get props => [message];
}
