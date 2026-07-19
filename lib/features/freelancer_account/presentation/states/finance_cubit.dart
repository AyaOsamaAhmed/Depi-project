import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dipe_freelance/features/freelancer_account/presentation/states/finance_state.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FinanceCubit extends Cubit<FinanceState> {
  FinanceCubit() : super(FinanceInitial());

  Future<void> fetchFinanceData() async {
    emit(FinanceLoading());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(FinanceLoaded());
  }

  Future<void> withdrawFunds() async {
    emit(WithdrawalInProgress());
    // Simulate API call
    await Future.delayed(const Duration(seconds: 1));
    emit(WithdrawalSuccess());
  }

  @override
  void emit(FinanceState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
