abstract class WithdrawFundsState {}

class WithdrawFundsInitial extends WithdrawFundsState {}

class WithdrawFundsLoading extends WithdrawFundsState {}

class WithdrawFundsSuccess extends WithdrawFundsState {
  final double balance;
  final List<Map<String, dynamic>> paymentMethods;
  final int selectedMethodIndex;

  WithdrawFundsSuccess({
    required this.balance,
    required this.paymentMethods,
    required this.selectedMethodIndex,
  });

  WithdrawFundsSuccess copyWith({
    double? balance,
    List<Map<String, dynamic>>? paymentMethods,
    int? selectedMethodIndex,
  }) {
    return WithdrawFundsSuccess(
      balance: balance ?? this.balance,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      selectedMethodIndex: selectedMethodIndex ?? this.selectedMethodIndex,
    );
  }
}

class WithdrawFundsSubmitting extends WithdrawFundsState {}

class WithdrawFundsSubmitSuccess extends WithdrawFundsState {
  final String message;

  WithdrawFundsSubmitSuccess(this.message);
}

class WithdrawFundsError extends WithdrawFundsState {
  final String message;

  WithdrawFundsError(this.message);
}
