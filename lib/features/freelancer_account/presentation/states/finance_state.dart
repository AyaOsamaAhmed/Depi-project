abstract class FinanceState {}

class FinanceInitial extends FinanceState {}

class FinanceLoading extends FinanceState {}

class FinanceLoaded extends FinanceState {}

class FinanceError extends FinanceState {
  final String message;
  FinanceError(this.message);
}

class WithdrawalInProgress extends FinanceState {}

class WithdrawalSuccess extends FinanceState {}

class WithdrawalFailure extends FinanceState {
  final String error;
  WithdrawalFailure(this.error);
}
