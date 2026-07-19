import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/forgot_password_usecase.dart';
import 'forgot_password_state.dart';

@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgotPasswordCubit(this._forgotPasswordUseCase)
    : super(ForgotPasswordInitial());

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordLoading());

    final result = await _forgotPasswordUseCase(email);

    result.fold(
      (failure) => emit(ForgotPasswordFailure(failure.message)),
      (_) => emit(
        ForgotPasswordSuccess(
          'إذا كان البريد مسجلاً، تم إرسال رابط إعادة التعيين',
        ),
      ),
    );
  }

  @override
  void emit(ForgotPasswordState state) {
    if (!isClosed) {
      super.emit(state);
    }
  }
}
