abstract class JobsState {}

class JobsInitial extends JobsState {}

class JobsLoading extends JobsState {}

class JobsLoaded extends JobsState {}

class JobsError extends JobsState {
  final String message;
  JobsError(this.message);
}

class ProposalSubmitting extends JobsState {}

class ProposalSubmitSuccess extends JobsState {}

class ProposalSubmitFailure extends JobsState {
  final String error;
  ProposalSubmitFailure(this.error);
}
