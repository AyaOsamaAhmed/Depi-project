abstract class ProjectState {}

class ProjectInitial extends ProjectState {}

class ProjectLoading extends ProjectState {}

class ProjectLoaded extends ProjectState {}

class ProjectError extends ProjectState {
  final String message;
  ProjectError(this.message);
}

class WorkSubmitting extends ProjectState {}

class WorkSubmitSuccess extends ProjectState {}

class WorkSubmitFailure extends ProjectState {
  final String error;
  WorkSubmitFailure(this.error);
}

class RatingInProgress extends ProjectState {}

class RatingSuccess extends ProjectState {}

class RatingFailure extends ProjectState {
  final String error;
  RatingFailure(this.error);
}
