import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'withdraw_funds_state.dart';

@injectable
class WithdrawFundsCubit extends Cubit<WithdrawFundsState> {
  WithdrawFundsCubit() : super(WithdrawFundsInitial());

  Future<void> loadWithdrawFunds() async {
    emit(WithdrawFundsLoading());
    // Simulate API call
    await Future.delayed(const Duration(milliseconds: 300));
    emit(
      WithdrawFundsSuccess(
        balance: 4250.00,
        selectedMethodIndex: 0,
        paymentMethods: [
          {
            'name': 'InstaPay',
            'detail': 'ayaahmed18@instapay',
            'icon': Icons.payment,
          },
          {
            'name': 'Bank transfer',
            'detail': '****4568',
            'icon': Icons.credit_card,
          },
          {
            'name': 'PayPal',
            'detail': 'ayaahmed18@paypall',
            'icon': Icons.account_balance_wallet,
          },
        ],
      ),
    );
  }

  void selectMethod(int index) {
    if (state is WithdrawFundsSuccess) {
      final current = state as WithdrawFundsSuccess;
      emit(current.copyWith(selectedMethodIndex: index));
    }
  }

  Future<void> withdraw(double amount) async {
    if (state is WithdrawFundsSuccess) {
      final current = state as WithdrawFundsSuccess;
      if (amount > current.balance) {
        emit(WithdrawFundsError('Insufficient balance.'));
        // Reload to restore state
        emit(current);
        return;
      }

      emit(WithdrawFundsSubmitting());
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      final newBalance = current.balance - amount;
      emit(
        WithdrawFundsSubmitSuccess(
          'Successfully withdrew \$${amount.toStringAsFixed(2)}',
        ),
      );

      // Update local state with new balance
      emit(
        WithdrawFundsSuccess(
          balance: newBalance,
          selectedMethodIndex: current.selectedMethodIndex,
          paymentMethods: current.paymentMethods,
        ),
      );
    }
  }

  @override
  void emit(WithdrawFundsState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
