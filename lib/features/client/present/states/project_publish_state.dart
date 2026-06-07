import 'package:equatable/equatable.dart';

abstract class ProjectPublishState extends Equatable {
  const ProjectPublishState();

  @override
  List<Object> get props => [];
}

class ProjectPublishInitial extends ProjectPublishState {}

class ProjectPublishLoading extends ProjectPublishState {}

class ProjectPublishSuccess extends ProjectPublishState {}

class ProjectPublishFailure extends ProjectPublishState {
  final String message;

  const ProjectPublishFailure(this.message);

  @override
  List<Object> get props => [message];
}
