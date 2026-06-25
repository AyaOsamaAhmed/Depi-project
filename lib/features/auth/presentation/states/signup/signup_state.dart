abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupDataCollected extends SignupState {}

class SignupFailure extends SignupState {
  final String message;
  SignupFailure(this.message);
}

class SignupSuccess extends SignupState {}
